// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.2 (64-bit)
// Tool Version Limit: 2023.10
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XDEPOLARIZE_HLS_H
#define XDEPOLARIZE_HLS_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xdepolarize_hls_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XDepolarize_hls_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XDepolarize_hls;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XDepolarize_hls_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XDepolarize_hls_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XDepolarize_hls_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XDepolarize_hls_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XDepolarize_hls_Initialize(XDepolarize_hls *InstancePtr, UINTPTR BaseAddress);
XDepolarize_hls_Config* XDepolarize_hls_LookupConfig(UINTPTR BaseAddress);
#else
int XDepolarize_hls_Initialize(XDepolarize_hls *InstancePtr, u16 DeviceId);
XDepolarize_hls_Config* XDepolarize_hls_LookupConfig(u16 DeviceId);
#endif
int XDepolarize_hls_CfgInitialize(XDepolarize_hls *InstancePtr, XDepolarize_hls_Config *ConfigPtr);
#else
int XDepolarize_hls_Initialize(XDepolarize_hls *InstancePtr, const char* InstanceName);
int XDepolarize_hls_Release(XDepolarize_hls *InstancePtr);
#endif


void XDepolarize_hls_Set_d_bwsup(XDepolarize_hls *InstancePtr, u64 Data);
u64 XDepolarize_hls_Get_d_bwsup(XDepolarize_hls *InstancePtr);
void XDepolarize_hls_Set_d_Wij(XDepolarize_hls *InstancePtr, u64 Data);
u64 XDepolarize_hls_Get_d_Wij(XDepolarize_hls *InstancePtr);
void XDepolarize_hls_Set_d_Xi(XDepolarize_hls *InstancePtr, u64 Data);
u64 XDepolarize_hls_Get_d_Xi(XDepolarize_hls *InstancePtr);
void XDepolarize_hls_Set_d_Bj(XDepolarize_hls *InstancePtr, u64 Data);
u64 XDepolarize_hls_Get_d_Bj(XDepolarize_hls *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
