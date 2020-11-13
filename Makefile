particle: particle.c
	 #/usr/local/bin/gcc -I/usr/local/include -L/usr/local/lib particle.c -o particle
	 /cygdrive/c/Program\ Files/Haskell\ Platform/8.6.5/mingw/bin/gcc.exe -I/usr/local/include -L/usr/local/lib particle.c -o particle
particle_omp: particle.c
	/cygdrive/c/Program\ Files/Haskell\ Platform/8.6.5/mingw/bin/gcc.exe -I/usr/local/include -L/usr/local/lib particle.c -fopenmp -o particle_omp
mpi_particle: mpi_particle.c
	mpicc -I/usr/local/include -L/usr/local/lib mpi_particle.c -o mpi_particle

run: particle
	./particle 2000 100 100 10 5
	cat solution.txt
	#python plot_solution.py solution.txt

run_omp: particle_omp
	./particle_omp 2000 100 100 10 5
	cat solution.txt
	#python plot_solution.py solution.txt

run_mpi: mpi_particle
	#mpirun.openmpi particle_mpi 2000 100 100 10 5
	mpiexec --use-hwthread-cpus mpi_particle 300 100 100 10 5
	#cat solution.txt
	#python plot_solution.py solution.txt

clean:
	rm particle solution.txt particle_omp

