particle: particle.c
	 #/usr/local/bin/gcc -I/usr/local/include -L/usr/local/lib particle.c -o particle
	 /cygdrive/c/Program\ Files/Haskell\ Platform/8.6.5/mingw/bin/gcc.exe -I/usr/local/include -L/usr/local/lib particle.c -o particle
particle_omp: particle.c
	/cygdrive/c/Program\ Files/Haskell\ Platform/8.6.5/mingw/bin/gcc.exe -I/usr/local/include -L/usr/local/lib particle.c -fopenmp -o particle_omp

run: particle
	./particle 2000 100 100 10 1
	cat solution.txt
	python plot_solution.py solution.txt

run_omp: particle_omp
	./particle_omp 2000 100 100 10 1
	cat solution.txt
	python plot_solution.py solution.txt

