# Header, load and parallelize 
using Pkg
Pkg.activate(".")
Pkg.instantiate()

using Distributed

nodes = open("machinefile") do f
    read(f, String)
    end
nodes = split(nodes, "\n")
pop!(nodes)
nodes = string.(nodes)
my_procs = map(x -> (x, :auto), nodes)

addprocs(my_procs; exeflags="--project", enable_threaded_blas = false)

A = work_load() 

rmprocs(workers()...)