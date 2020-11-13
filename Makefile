particle: particle.c
	 #/usr/local/bin/gcc -I/usr/local/include -L/usr/local/lib particle.c -o particle
	 /usr/bin/gcc -I/usr/local/include -L/usr/local/lib particle.c -o particle -lm
particle_omp: particle.c
	/usr/bin/gcc -I/usr/local/include -L/usr/local/lib particle.c -fopenmp -o particle_omp -lm

run: particle
	./particle 2000 100 100 10 5
	cat solution.txt
	#python plot_solution.py solution.txt

run_omp: particle_omp
	./particle_omp 2000 100 100 10 5
	cat solution.txt
	#python plot_solution.py solution.txt

mpi_particle: mpi_particle.c
	mpicc.openmpi -I/usr/local/include -L/usr/local/lib mpi_particle.c -o mpi_particle -lm

run_mpi: mpi_particle
	mpirun.openmpi mpi_particle 2000 100 100 10 5
	
