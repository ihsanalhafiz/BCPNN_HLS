// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// control
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of d_bwsup
//        bit 31~0 - d_bwsup[31:0] (Read/Write)
// 0x14 : Data signal of d_bwsup
//        bit 31~0 - d_bwsup[63:32] (Read/Write)
// 0x18 : reserved
// 0x1c : Data signal of d_Wij
//        bit 31~0 - d_Wij[31:0] (Read/Write)
// 0x20 : Data signal of d_Wij
//        bit 31~0 - d_Wij[63:32] (Read/Write)
// 0x24 : reserved
// 0x28 : Data signal of d_Xi
//        bit 31~0 - d_Xi[31:0] (Read/Write)
// 0x2c : Data signal of d_Xi
//        bit 31~0 - d_Xi[63:32] (Read/Write)
// 0x30 : reserved
// 0x34 : Data signal of d_Bj
//        bit 31~0 - d_Bj[31:0] (Read/Write)
// 0x38 : Data signal of d_Bj
//        bit 31~0 - d_Bj[63:32] (Read/Write)
// 0x3c : reserved
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XDEPOLARIZE_HLS_CONTROL_ADDR_D_BWSUP_DATA 0x10
#define XDEPOLARIZE_HLS_CONTROL_BITS_D_BWSUP_DATA 64
#define XDEPOLARIZE_HLS_CONTROL_ADDR_D_WIJ_DATA   0x1c
#define XDEPOLARIZE_HLS_CONTROL_BITS_D_WIJ_DATA   64
#define XDEPOLARIZE_HLS_CONTROL_ADDR_D_XI_DATA    0x28
#define XDEPOLARIZE_HLS_CONTROL_BITS_D_XI_DATA    64
#define XDEPOLARIZE_HLS_CONTROL_ADDR_D_BJ_DATA    0x34
#define XDEPOLARIZE_HLS_CONTROL_BITS_D_BJ_DATA    64

