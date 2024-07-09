#!/bin/bash
sbatch <<EOT
#!/bin/bash
#SBATCH --partition=long
#SBATCH --nodes=$3
#SBATCH --time=07-00:00:00
#SBATCH --job-name=$1_$2

scontrol show hostnames $SLURM_JOB_NODELIST > machinefile

julia --project job_julia.jl $1 $2
EOT