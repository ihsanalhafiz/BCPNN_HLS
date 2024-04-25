set moduleName depolarize_hls_Pipeline_computeRow
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {depolarize_hls_Pipeline_computeRow}
set C_modelType { void 0 }
set C_modelArgList {
	{ temp float 32 regular  }
	{ Ni int 32 regular  }
	{ Xi_stream int 32 regular {fifo 0 volatile }  }
	{ Wij_stream int 32 regular {fifo 0 volatile }  }
	{ alpha float 32 regular  }
	{ temp_1_out float 32 regular {pointer 1}  }
}
set hasAXIMCache 0
set AXIMCacheInstList { }
set C_modelArgMapList {[ 
	{ "Name" : "temp", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Ni", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Xi_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Wij_stream", "interface" : "fifo", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "alpha", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "temp_1_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 21
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ temp sc_in sc_lv 32 signal 0 } 
	{ Ni sc_in sc_lv 32 signal 1 } 
	{ Xi_stream_dout sc_in sc_lv 32 signal 2 } 
	{ Xi_stream_empty_n sc_in sc_logic 1 signal 2 } 
	{ Xi_stream_read sc_out sc_logic 1 signal 2 } 
	{ Wij_stream_dout sc_in sc_lv 32 signal 3 } 
	{ Wij_stream_empty_n sc_in sc_logic 1 signal 3 } 
	{ Wij_stream_read sc_out sc_logic 1 signal 3 } 
	{ alpha sc_in sc_lv 32 signal 4 } 
	{ temp_1_out sc_out sc_lv 32 signal 5 } 
	{ temp_1_out_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ grp_fu_316_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_316_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_316_p_dout0 sc_in sc_lv 32 signal -1 } 
	{ grp_fu_316_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "temp", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "temp", "role": "default" }} , 
 	{ "name": "Ni", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Ni", "role": "default" }} , 
 	{ "name": "Xi_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Xi_stream", "role": "dout" }} , 
 	{ "name": "Xi_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Xi_stream", "role": "empty_n" }} , 
 	{ "name": "Xi_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Xi_stream", "role": "read" }} , 
 	{ "name": "Wij_stream_dout", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Wij_stream", "role": "dout" }} , 
 	{ "name": "Wij_stream_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Wij_stream", "role": "empty_n" }} , 
 	{ "name": "Wij_stream_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Wij_stream", "role": "read" }} , 
 	{ "name": "alpha", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "alpha", "role": "default" }} , 
 	{ "name": "temp_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "temp_1_out", "role": "default" }} , 
 	{ "name": "temp_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "temp_1_out", "role": "ap_vld" }} , 
 	{ "name": "grp_fu_316_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_316_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_316_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_316_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_316_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_316_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_316_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_316_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"],
		"CDFG" : "depolarize_hls_Pipeline_computeRow",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "5012", "EstimateLatencyMax" : "5012",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "temp", "Type" : "None", "Direction" : "I"},
			{"Name" : "Ni", "Type" : "None", "Direction" : "I"},
			{"Name" : "Xi_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Xi_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "Wij_stream", "Type" : "Fifo", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "Wij_stream_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "alpha", "Type" : "None", "Direction" : "I"},
			{"Name" : "temp_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "computeRow", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "5", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.fadd_32ns_32ns_32_6_no_dsp_1_U17", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	depolarize_hls_Pipeline_computeRow {
		temp {Type I LastRead 0 FirstWrite -1}
		Ni {Type I LastRead 0 FirstWrite -1}
		Xi_stream {Type I LastRead 1 FirstWrite -1}
		Wij_stream {Type I LastRead 1 FirstWrite -1}
		alpha {Type I LastRead 0 FirstWrite -1}
		temp_1_out {Type O LastRead -1 FirstWrite 10}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "5012", "Max" : "5012"}
	, {"Name" : "Interval", "Min" : "5012", "Max" : "5012"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	temp { ap_none {  { temp in_data 0 32 } } }
	Ni { ap_none {  { Ni in_data 0 32 } } }
	Xi_stream { ap_fifo {  { Xi_stream_dout fifo_data_in 0 32 }  { Xi_stream_empty_n fifo_status 0 1 }  { Xi_stream_read fifo_port_we 1 1 } } }
	Wij_stream { ap_fifo {  { Wij_stream_dout fifo_data_in 0 32 }  { Wij_stream_empty_n fifo_status 0 1 }  { Wij_stream_read fifo_port_we 1 1 } } }
	alpha { ap_none {  { alpha in_data 0 32 } } }
	temp_1_out { ap_vld {  { temp_1_out out_data 1 32 }  { temp_1_out_ap_vld out_vld 1 1 } } }
}
