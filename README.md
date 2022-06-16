# Ada-JobQueue
The Ada JobQueue implementation and SCP20 case study

## Introduction
see [Introduction](Intro.md)

## Environment

download [GNATStudio](https://www.adacore.com/download) from AdaCode and install it.

My GNAT version is
```shell
$ gnat --help
GNAT Community 2020 (20200429-93)
```
## Case Study

We provide three industrial case studies: three subsystems of The Guidance, Navigation and Control (GNC) system

- [CASE A](A/): Data Processing of Sun Sensor (DPSS);
- [CASE B](B/): Computation of Orbit Elements (COE);
- [CASE C](C/): Eliminate Initial Deviation (EID).

From more details, please read our [SCP paper](materials/scpmain.pdf)

## Compile and Run
There are two ways to compile & run our case studies.

- From CMD
```shell
$ gprbuild -d -P/home/YOUR-PATH/A/JobQueue/jobqueue.gpr /home/YOUR-PATH/A/JobQueue/src/main.adb
$ ./YOUR-PATH/A/JobQueue/obj/main
```

- From IDE
1. open the selected Ada project from GNAT Studio
2. right click the project and select `Build > Build Main:main.adb` to compile your project
3. right click then project and select `Run > Run Main:main` to execute your project

