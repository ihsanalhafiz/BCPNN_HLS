// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xdepolarize_hls.h"

extern XDepolarize_hls_Config XDepolarize_hls_ConfigTable[];

#ifdef SDT
XDepolarize_hls_Config *XDepolarize_hls_LookupConfig(UINTPTR BaseAddress) {
	XDepolarize_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XDepolarize_hls_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XDepolarize_hls_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XDepolarize_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDepolarize_hls_Initialize(XDepolarize_hls *InstancePtr, UINTPTR BaseAddress) {
	XDepolarize_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDepolarize_hls_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDepolarize_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XDepolarize_hls_Config *XDepolarize_hls_LookupConfig(u16 DeviceId) {
	XDepolarize_hls_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XDEPOLARIZE_HLS_NUM_INSTANCES; Index++) {
		if (XDepolarize_hls_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XDepolarize_hls_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XDepolarize_hls_Initialize(XDepolarize_hls *InstancePtr, u16 DeviceId) {
	XDepolarize_hls_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XDepolarize_hls_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XDepolarize_hls_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

