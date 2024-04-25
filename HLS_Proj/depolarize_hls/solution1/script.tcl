############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project depolarize_hls
set_top depolarize_hls
add_files ../src_hls/Prj.cpp
add_files ../src_hls/Prj.h
add_files -tb ../src_hls/hls_depolarize.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7a200tfbg484-1}
create_clock -period 10 -name default
config_export -flow impl -format ip_catalog -output /home/miahafiz/BCPNN_HLS/HLS_Proj -rtl vhdl -vivado_clock 10
#source "./depolarize_hls/solution1/directives.tcl"
csim_design -clean -O
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog -output /home/miahafiz/BCPNN_HLS/HLS_Proj
