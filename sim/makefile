compile:
	vlog -sv ../compile_file.sv

simulate:
	bsub -Is -P PJ03163A -Jd top_val-PD-sim_vcs -W 300 -R 'select[(rhe6 || rhe7) && x86_64 && mem>16380] rusage[mem=16380]' -q inter vsim mem_top -gui -do "run -all;exit" &
