set SynModuleInfo {
  {SRCNAME depolarize_hls_Pipeline_read_bwsup MODELNAME depolarize_hls_Pipeline_read_bwsup RTLNAME depolarize_hls_depolarize_hls_Pipeline_read_bwsup
    SUBMODULES {
      {MODELNAME depolarize_hls_flow_control_loop_pipe_sequential_init RTLNAME depolarize_hls_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME depolarize_hls_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME depolarize_hls_Pipeline_read_Wij_first_read_Wij_second MODELNAME depolarize_hls_Pipeline_read_Wij_first_read_Wij_second RTLNAME depolarize_hls_depolarize_hls_Pipeline_read_Wij_first_read_Wij_second}
  {SRCNAME depolarize_hls_Pipeline_read_Xi MODELNAME depolarize_hls_Pipeline_read_Xi RTLNAME depolarize_hls_depolarize_hls_Pipeline_read_Xi}
  {SRCNAME depolarize_hls_Pipeline_read_Bj MODELNAME depolarize_hls_Pipeline_read_Bj RTLNAME depolarize_hls_depolarize_hls_Pipeline_read_Bj}
  {SRCNAME depolarize_hls_Pipeline_computeRow MODELNAME depolarize_hls_Pipeline_computeRow RTLNAME depolarize_hls_depolarize_hls_Pipeline_computeRow
    SUBMODULES {
      {MODELNAME depolarize_hls_fadd_32ns_32ns_32_6_no_dsp_1 RTLNAME depolarize_hls_fadd_32ns_32ns_32_6_no_dsp_1 BINDTYPE op TYPE fadd IMPL fabric LATENCY 5 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME depolarize_hls_Pipeline_store_bwsup MODELNAME depolarize_hls_Pipeline_store_bwsup RTLNAME depolarize_hls_depolarize_hls_Pipeline_store_bwsup}
  {SRCNAME depolarize_hls MODELNAME depolarize_hls RTLNAME depolarize_hls IS_TOP 1
    SUBMODULES {
      {MODELNAME depolarize_hls_fadd_32ns_32ns_32_7_full_dsp_1 RTLNAME depolarize_hls_fadd_32ns_32ns_32_7_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 6 ALLOW_PRAGMA 1}
      {MODELNAME depolarize_hls_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME depolarize_hls_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME depolarize_hls_mul_31ns_32ns_63_2_1 RTLNAME depolarize_hls_mul_31ns_32ns_63_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME depolarize_hls_mul_32s_32s_32_2_1 RTLNAME depolarize_hls_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME depolarize_hls_fifo_w32_d2_S RTLNAME depolarize_hls_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME Wij_stream_U}
      {MODELNAME depolarize_hls_fifo_w32_d2_S RTLNAME depolarize_hls_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME Xi_stream_U}
      {MODELNAME depolarize_hls_fifo_w32_d2_S RTLNAME depolarize_hls_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME Bj_stream_U}
      {MODELNAME depolarize_hls_fifo_w32_d2_S RTLNAME depolarize_hls_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME bwsup_stream_U}
      {MODELNAME depolarize_hls_fifo_w32_d2_S RTLNAME depolarize_hls_fifo_w32_d2_S BINDTYPE storage TYPE fifo IMPL srl ALLOW_PRAGMA 1 INSTNAME bwsup_stream_out_U}
      {MODELNAME depolarize_hls_gmem_m_axi RTLNAME depolarize_hls_gmem_m_axi BINDTYPE interface TYPE adapter IMPL m_axi}
      {MODELNAME depolarize_hls_control_s_axi RTLNAME depolarize_hls_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
    }
  }
}
