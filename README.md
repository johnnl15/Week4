## HW Assignment 3 020221

1) Create a rule as such: 
```
rule clean: 
	shell: 
		"rm -rf *.png *.sqlite3"
```
Then run the following: 
```
snakemake --cores 1 clean
```
Only, files with .png or .sqlite3 should be deleted. 

2) Our class discussion said that there was no way to delete from only one rule. However, one option is to use the make the output file temporary using temp() 

3) Citation: Köster, Johannes and Rahmann, Sven. “Snakemake - A scalable bioinformatics workflow engine”. Bioinformatics 2012.

4) [mtcars graph](mtcars.png)

5) 

Touch mtcars.sqlite3

```
$ snakemake --cores 1 --touch mtcars.sqlite3
Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       makesequeldb
        1
Select jobs to execute...

[Tue Feb  2 14:08:57 2021]
rule makesequeldb:
    output: mtcars.sqlite3
    jobid: 0

[Tue Feb  2 14:08:57 2021]
Finished job 0.
1 of 1 steps (100%) done
Complete log: /mnt/c/downloads/johnny/ee283/assignmentthree/Code/.snakemake/log/2021-02-02T140857.590108.snakemake.log
```

Touch mtcars.png

```
$ snakemake --cores 1 --touch mtcars.png
Building DAG of jobs...
Using shell: /usr/bin/bash
Provided cores: 1 (use --cores to define parallelism)
Rules claiming more threads will be scaled down.
Job counts:
        count   jobs
        1       makegraph
        1       makesequeldb
        2
Select jobs to execute...

[Tue Feb  2 14:06:46 2021]
rule makesequeldb:
    output: mtcars.sqlite3
    jobid: 1

[Tue Feb  2 14:06:46 2021]
Finished job 1.
1 of 2 steps (50%) done
Select jobs to execute...

[Tue Feb  2 14:06:46 2021]
rule makegraph:
    input: mtcars.sqlite3
    output: mtcars.png
    jobid: 0

[Tue Feb  2 14:06:46 2021]
Finished job 0.
2 of 2 steps (100%) done
Complete log: /mnt/c/downloads/johnny/ee283/assignmentthree/Code/.snakemake/log/2021-02-02T140646.018496.snakemake.log
```
