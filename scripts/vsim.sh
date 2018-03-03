#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Must provide a file path for the script to run."
	exit 1
fi

vsim -modelsimini ~/intelFPGA_pro/17.1/modelsim_ase/modelsim.ini -c -do $1 $2 $3
