// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xdepolarize_hls.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XDepolarize_hls_CfgInitialize(XDepolarize_hls *InstancePtr, XDepolarize_hls_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XDepolarize_hls_Set_d_bwsup(XDepolarize_hls *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BWSUP_DATA, (u32)(Data));
    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BWSUP_DATA + 4, (u32)(Data >> 32));
}

u64 XDepolarize_hls_Get_d_bwsup(XDepolarize_hls *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BWSUP_DATA);
    Data += (u64)XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BWSUP_DATA + 4) << 32;
    return Data;
}

void XDepolarize_hls_Set_d_Wij(XDepolarize_hls *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_WIJ_DATA, (u32)(Data));
    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_WIJ_DATA + 4, (u32)(Data >> 32));
}

u64 XDepolarize_hls_Get_d_Wij(XDepolarize_hls *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_WIJ_DATA);
    Data += (u64)XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_WIJ_DATA + 4) << 32;
    return Data;
}

void XDepolarize_hls_Set_d_Xi(XDepolarize_hls *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_XI_DATA, (u32)(Data));
    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_XI_DATA + 4, (u32)(Data >> 32));
}

u64 XDepolarize_hls_Get_d_Xi(XDepolarize_hls *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_XI_DATA);
    Data += (u64)XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_XI_DATA + 4) << 32;
    return Data;
}

void XDepolarize_hls_Set_d_Bj(XDepolarize_hls *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BJ_DATA, (u32)(Data));
    XDepolarize_hls_WriteReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BJ_DATA + 4, (u32)(Data >> 32));
}

u64 XDepolarize_hls_Get_d_Bj(XDepolarize_hls *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BJ_DATA);
    Data += (u64)XDepolarize_hls_ReadReg(InstancePtr->Control_BaseAddress, XDEPOLARIZE_HLS_CONTROL_ADDR_D_BJ_DATA + 4) << 32;
    return Data;
}

