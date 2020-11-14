#!/bin/sh
#SBATCH --account=icts
#SBATCH --partition=curie
#SBATCH --nodes=4 --ntasks 32 --ntasks-per-node=8
#SBATCH --time=10:00
#SBATCH --mem-per-cpu=2000
#SBATCH --job-name="Blessed_mpi"
#SBATCH --mail-user=blessedbrighton@live.com
#SBATCH --mail-type=ALL

export OMP_NUM_THREADS=32
module load mpi/openmpi-4.0.1
make mpi_particle
make run_mpi > mpi_output.txt
