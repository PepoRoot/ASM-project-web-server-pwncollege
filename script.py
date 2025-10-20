import subprocess
first_command = subprocess.run(['as', '-o', 'program.o', 'program.s'],check=True)
seconed_command = subprocess.run(['ld', '-o', 'program', 'program.o'],check=True)
third_command = subprocess.run(['/challenge/run', './program'],check=True) 