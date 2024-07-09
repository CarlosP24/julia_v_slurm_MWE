#!/bin/bash
sbatch <<EOT
#!/bin/bash
#SBATCH --partition=special
#SBATCH --nodes=$1
#SBATCH --time=07-00:00:00

scontrol show hostnames $SLURM_JOB_NODELIST > machinefile

julia --project job_julia.jl
EOT