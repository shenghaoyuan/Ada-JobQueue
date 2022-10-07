-include Makefile.config

SED := sed
CAT := cat
AWK := awk
COQC := coqc
OCAMLOPT := ocamlopt
COQMAKEFILE := coq_makefile
CP := cp
MV := mv

CC=gcc
OFLAGS=-Os
CLIGHTGEN=clightgen

THIS_FILE := $(lastword $(MAKEFILE_LIST))

COQEXTRAFLAGS := COQEXTRAFLAGS = '-w all,-extraction,-disj-pattern-notation'

OCAMLINCS := -I extr # -I src

DIRS := compcerttso jobqueue

COQINCLUDES := INSTALLDEFAULTROOT = compcerttso "\n"
COQINCLUDES += $(foreach d, $(DIRS),-R $(d) $(d) "\n")
ifeq (,$(wildcard ./Makefile.config.c))
	COQINCLUDES +=-R $(COMPCERTDIR) compcert
endif

all:
	@echo $@
	@$(MAKE) compcerttso
	@$(MAKE) jobqueue
	@$(MAKE) document

COMPCERTTSO= lib/Vlib.v lib/Coqlib.v lib/Mergesort.v lib/Maps.v \
   common/AST.v common/Values.v common/Libtactics.v common/Events.v common/Simulations.v common/Memcomp.v \
   clightTSO/Csyntax.v
   
JOBQUEUE= BoundedWorkStealingPool.v
 

COQCOMPCERTTSO = $(addprefix compcerttso/, $(COMPCERTTSO))
COQJOBQUEUE = $(addprefix jobqueue/, $(JOBQUEUE))

FILES=$(COQCCOQCOMPCERTTSOOMM) $(COQJOBQUEUE)

depend: $(FILES)
	@echo "Analyzing Coq dependencies"
	@$(COQDEP) $^ > .depend

compcerttso:
	@echo $@
	$(COQMAKEFILE) -f _CoqProject $(COQCOMPCERTTSO) $(COQEXTRAFLAGS)  -o CoqMakefile
	make -f CoqMakefile

jobqueue:
	@echo $@
	$(COQMAKEFILE) -f _CoqProject $(COQJOBQUEUE) $(COQEXTRAFLAGS)  -o CoqMakefile
	make -f CoqMakefile

DOCFLAG := -external https://compcert.org/doc/html compcert -base bpf -short-names 
document:
	@echo $@
	mkdir -p html
	mkdir -p html/glob
	cp compcerttso/*/*.glob html/glob
	cp jobqueue/*.glob html/glob
	coq2html $(DOCFLAG) -d html html/glob/*.glob compcerttso/*/*.v
	coq2html $(DOCFLAG) -d html html/glob/*.glob jobqueue/*.v

CoqProject:
	@echo $(COQINCLUDES) > _CoqProject

GITDIR=/home/shyuan/GitHub/Ada-JobQueue

gitpush:
	@echo $@
	cp compcerttso/clightTSO/*.v $(GITDIR)/compcerttso/clightTSO
	cp compcerttso/common/*.v $(GITDIR)/compcerttso/common
	cp compcerttso/lib/*.v $(GITDIR)/compcerttso/lib
	cp jobqueue/*.v $(GITDIR)/jobqueue
	cp Makefile $(GITDIR)
	cp configure $(GITDIR)

clean :
	@echo $@
	make -f CoqMakefile clean
	find . -name "*\.vo" -exec rm {} \;
	find . -name "*\.vok" -exec rm {} \;
	find . -name "*\.vos" -exec rm {} \;
	find . -name "*\.glob" -exec rm {} \;
	find . -name "*\.aux" -exec rm {} \;
	find . -name "*\.cmi" -exec rm {} \;
	find . -name "*\.cmx" -exec rm {} \;
	find . -name "*\.crashcoqide" -exec rm {} \;


# We want to keep the .cmi that were built as we go
.SECONDARY:

.PHONY: all compcerttso jobqueue document CoqProject gitpush clean
