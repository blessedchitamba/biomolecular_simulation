#!/bin/sh

#SBATCH --account=icts

#SBATCH --partition=curie

#SBATCH --time=10:00
#SBATCH --nodes=1 --ntasks=1 --cpus-per-task=32

#SBATCH --mem-per-cpu=2000

#SBATCH --job-name="Gerald_a1_1"

#SBATCH --mail-user=geraldjoshua7@gmail.com

#SBATCH --mail-type=ALL

export OMP_NUM_THREADS=32
./particle_omp 100 100 100 10 5 >particle_omp.txt
./particle 100 100 100 10 5 >particle.txt