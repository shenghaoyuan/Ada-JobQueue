## Thread pool pattern JobQueue in Ada

- a JobQueue that stores all ready jobs (i.e. procedures in Ada), and
- workers that get jobs from the head of the queue and execute them in parallel on separate cores.

After one jobs is completed, all waiting jobs that depend on the job are put in the tail of the queue by the related worker.

## JobQueue protected type

a JobQueue protected type offering: *enqueue* and *dequeue* operations:
- *put* and *get* which allow adding a ask to the queue and extracting a job to the queue provided it is not empty.

```Ada
type job is access procedure;
type index is mod M; -- M is the size of the queue
type todolist is array (index) of job;
protected JobQueue is
  entry put(a : in job);
  entry get(a : out job);
 private
  todo : todolist := (others => null);
  head : index := 0;
  tail : index := 0;
  count : integer range 0..M := 0;
end JobQueue;
```

Concurrent calls to these entries will be sequentialized by the protected object.

## Mappings

The JobQueue contains two kinds of mappings: *static mapping* and *dynamic mapping*. The static mapping is that a worker is bound to a specific CPU and makes an infinite loop: extracting a job from the queue and executing it.
```Ada
task type worker (N : CPU_Range) with CPU => N is
end worker;
task body worker is
  a : job;
begin
  loop
    JobQueue.get(a);
    a.all;
  end loop;
end worker;
worker1 : worker(1);
...
```
The dynamic mapping is between workers and jobs, and this kind of mapping depends on the concurrent queue operations on running time.

# Synchronization mechanism

To implement the **Wait/Notify** mechanism, a counter should be defined with a protected type. Each job has one counter with an initial value, which is the number of jobs it depends on. When one of them is completed, the value
decreases by 1 (i.e. calling the procedure *decr* once). If the return value of *decr* is true, then the job can be executed.
```Ada
protected type counter(init : integer := 1) is
  procedure decr (z : out boolean);
 private
  c : integer := init;
end counter;
```

There are three cases:
- [CASE_A](A/JobQueue/)
- [CASE_B](B/JobQueue/)
- [CASE_C](C/JobQueue/)
