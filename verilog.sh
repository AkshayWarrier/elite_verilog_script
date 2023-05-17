#! /bin/bash
# Script to compile verilog using iverilog and visualize using gtkwave
module_name=$1 
cd $module_name
ls *.v > filelist.txt
iverilog -o $module_name -c filelist.txt
./$module_name
gtkwave dump.vcd
cd ..