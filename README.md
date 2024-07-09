# julia_v_slurm_MWE
MWE test of julia distributed malfunctions when using a slurm cluster.

In this example, we use our standard proccedure to launch parallel jobs in a slurm cluster. 

- `functions.jl` contains a function with an infinite parallel loop to keep the workers occupied during the test.
- `job_julia.jl` launches the parallel julia workers accross all nodes. Option `:auto` in `my_procs` means that there will be as many workers per node as physical cores per node.
- `job.slurm` manages the `sbatch`options and launches the julia code.

## MWE
We use this code from a terminal in the cluster access node:
````
$ bash job.slurm 2
Submitted batch job jobid
`````

We check that the job is running in the nodes specified at `machinefile`. We cancel the process manually to simulate an error,
````
$ scancel jobid 
````

While the process has disappeared from the slurm queue, the julia workers are still zombie-runing at the cluster nodes. 

We cannot close them from julia by means of `rmprocs(workers()...)` as there is no julia REPL in the access node. The only way to kill this processes is to `ssh` to the affected nodes and kill the zombie processes.