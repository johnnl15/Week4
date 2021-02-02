rule all: 
	input: 
		"mtcars.sqlite3",
		"mtcars.png"

rule makesequeldb: 
	input: 
	output: 
		"mtcars.sqlite3"
	script: 
		"mtcars.R"

rule makegraph: 
	input: 
		"mtcars.sqlite3"
	output: 
		"mtcars.png"
	script: 
  		"mtcars.py"

rule clean: 
	shell: 
		"rm -rf *.png *.sqlite3"
