#! /bin/bash
# Script to compile verilog using iverilog and visualize using gtkwave

if [[ "$1" == -* ]]; then
    if [[ "$1" ==  "-v" ]]; then
        module_name=$2
        RUN_GTKWAVE=true
    else
        echo "Invalid option"
        exit 1
    fi
else
    module_name=$1
    RUN_GTKWAVE=false
fi

cd $module_name
ls *.v > filelist.txt
iverilog -o $module_name -c filelist.txt
./$module_name

if [[ "$RUN_GTKWAVE" == true ]]; then
    gtkwave *.vcd &> /dev/null &
fi

cd ..