############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project VitisHLS_Proj
open_solution "solution1" -flow_target vivado
set_part {xc7a200tsbv484-2L}
create_clock -period 10 -name default
#source "./VitisHLS_Proj/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog