--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Thu Apr 25 17:01:19 2024
--Host        : miahafiz running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target bd_0.bd
--Design      : bd_0
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0 is
  port (
    Ni : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Nj : in STD_LOGIC_VECTOR ( 31 downto 0 );
    alpha : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_ctrl_done : out STD_LOGIC;
    ap_ctrl_idle : out STD_LOGIC;
    ap_ctrl_ready : out STD_LOGIC;
    ap_ctrl_start : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    beta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    biasmul : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arready : in STD_LOGIC;
    m_axi_gmem_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_arvalid : out STD_LOGIC;
    m_axi_gmem_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awready : in STD_LOGIC;
    m_axi_gmem_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_awvalid : out STD_LOGIC;
    m_axi_gmem_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_bready : out STD_LOGIC;
    m_axi_gmem_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_bvalid : in STD_LOGIC;
    m_axi_gmem_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_rlast : in STD_LOGIC;
    m_axi_gmem_rready : out STD_LOGIC;
    m_axi_gmem_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_rvalid : in STD_LOGIC;
    m_axi_gmem_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_wlast : out STD_LOGIC;
    m_axi_gmem_wready : in STD_LOGIC;
    m_axi_gmem_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_wvalid : out STD_LOGIC;
    s_axi_control_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_arready : out STD_LOGIC;
    s_axi_control_arvalid : in STD_LOGIC;
    s_axi_control_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_awready : out STD_LOGIC;
    s_axi_control_awvalid : in STD_LOGIC;
    s_axi_control_bready : in STD_LOGIC;
    s_axi_control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_bvalid : out STD_LOGIC;
    s_axi_control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_rready : in STD_LOGIC;
    s_axi_control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_rvalid : out STD_LOGIC;
    s_axi_control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_wready : out STD_LOGIC;
    s_axi_control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_wvalid : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of bd_0 : entity is "bd_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_0,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of bd_0 : entity is "bd_0.hwdef";
end bd_0;

architecture STRUCTURE of bd_0 is
  component bd_0_hls_inst_0 is
  port (
    s_axi_control_AWADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_AWVALID : in STD_LOGIC;
    s_axi_control_AWREADY : out STD_LOGIC;
    s_axi_control_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_WVALID : in STD_LOGIC;
    s_axi_control_WREADY : out STD_LOGIC;
    s_axi_control_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_BVALID : out STD_LOGIC;
    s_axi_control_BREADY : in STD_LOGIC;
    s_axi_control_ARADDR : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_ARVALID : in STD_LOGIC;
    s_axi_control_ARREADY : out STD_LOGIC;
    s_axi_control_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_RVALID : out STD_LOGIC;
    s_axi_control_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    m_axi_gmem_AWID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_AWADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_AWLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_AWSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_AWBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_AWLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_AWREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_AWCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_AWPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_AWQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_AWVALID : out STD_LOGIC;
    m_axi_gmem_AWREADY : in STD_LOGIC;
    m_axi_gmem_WID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_WDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_WSTRB : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_WLAST : out STD_LOGIC;
    m_axi_gmem_WVALID : out STD_LOGIC;
    m_axi_gmem_WREADY : in STD_LOGIC;
    m_axi_gmem_BID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_BRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_BVALID : in STD_LOGIC;
    m_axi_gmem_BREADY : out STD_LOGIC;
    m_axi_gmem_ARID : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_ARADDR : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_ARLEN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_ARSIZE : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_ARBURST : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_ARLOCK : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_ARREGION : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_ARCACHE : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_ARPROT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_ARQOS : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_ARVALID : out STD_LOGIC;
    m_axi_gmem_ARREADY : in STD_LOGIC;
    m_axi_gmem_RID : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_RDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_RRESP : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_RLAST : in STD_LOGIC;
    m_axi_gmem_RVALID : in STD_LOGIC;
    m_axi_gmem_RREADY : out STD_LOGIC;
    Ni : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Nj : in STD_LOGIC_VECTOR ( 31 downto 0 );
    alpha : in STD_LOGIC_VECTOR ( 31 downto 0 );
    beta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    biasmul : in STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component bd_0_hls_inst_0;
  signal Ni_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal Nj_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal alpha_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal ap_clk_0_1 : STD_LOGIC;
  signal ap_ctrl_0_1_done : STD_LOGIC;
  signal ap_ctrl_0_1_idle : STD_LOGIC;
  signal ap_ctrl_0_1_ready : STD_LOGIC;
  signal ap_ctrl_0_1_start : STD_LOGIC;
  signal ap_rst_n_0_1 : STD_LOGIC;
  signal beta_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal biasmul_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem_ARADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem_ARBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_ARCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_ARID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem_ARLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem_ARLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_ARPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem_ARQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_ARREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem_ARREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_ARSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem_ARVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem_AWADDR : STD_LOGIC_VECTOR ( 63 downto 0 );
  signal hls_inst_m_axi_gmem_AWBURST : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_AWCACHE : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_AWID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem_AWLEN : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal hls_inst_m_axi_gmem_AWLOCK : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_AWPROT : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem_AWQOS : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_AWREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem_AWREGION : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_AWSIZE : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal hls_inst_m_axi_gmem_AWVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem_BID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem_BREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_BVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem_RID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem_RLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem_RREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal hls_inst_m_axi_gmem_RVALID : STD_LOGIC;
  signal hls_inst_m_axi_gmem_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal hls_inst_m_axi_gmem_WID : STD_LOGIC_VECTOR ( 0 to 0 );
  signal hls_inst_m_axi_gmem_WLAST : STD_LOGIC;
  signal hls_inst_m_axi_gmem_WREADY : STD_LOGIC;
  signal hls_inst_m_axi_gmem_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal hls_inst_m_axi_gmem_WVALID : STD_LOGIC;
  signal s_axi_control_0_1_ARADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_control_0_1_ARREADY : STD_LOGIC;
  signal s_axi_control_0_1_ARVALID : STD_LOGIC;
  signal s_axi_control_0_1_AWADDR : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal s_axi_control_0_1_AWREADY : STD_LOGIC;
  signal s_axi_control_0_1_AWVALID : STD_LOGIC;
  signal s_axi_control_0_1_BREADY : STD_LOGIC;
  signal s_axi_control_0_1_BRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_control_0_1_BVALID : STD_LOGIC;
  signal s_axi_control_0_1_RDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_control_0_1_RREADY : STD_LOGIC;
  signal s_axi_control_0_1_RRESP : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal s_axi_control_0_1_RVALID : STD_LOGIC;
  signal s_axi_control_0_1_WDATA : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal s_axi_control_0_1_WREADY : STD_LOGIC;
  signal s_axi_control_0_1_WSTRB : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal s_axi_control_0_1_WVALID : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 CLK.AP_CLK CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME CLK.AP_CLK, ASSOCIATED_BUSIF m_axi_gmem:s_axi_control, ASSOCIATED_RESET ap_rst_n, CLK_DOMAIN bd_0_ap_clk_0, FREQ_HZ 100000000.0, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of ap_ctrl_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_ctrl_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ";
  attribute X_INTERFACE_INFO of ap_rst_n : signal is "xilinx.com:signal:reset:1.0 RST.AP_RST_N RST";
  attribute X_INTERFACE_PARAMETER of ap_rst_n : signal is "XIL_INTERFACENAME RST.AP_RST_N, INSERT_VIP 0, POLARITY ACTIVE_LOW";
  attribute X_INTERFACE_INFO of m_axi_gmem_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of s_axi_control_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of Ni : signal is "xilinx.com:signal:data:1.0 DATA.NI DATA";
  attribute X_INTERFACE_PARAMETER of Ni : signal is "XIL_INTERFACENAME DATA.NI, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of Nj : signal is "xilinx.com:signal:data:1.0 DATA.NJ DATA";
  attribute X_INTERFACE_PARAMETER of Nj : signal is "XIL_INTERFACENAME DATA.NJ, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of alpha : signal is "xilinx.com:signal:data:1.0 DATA.ALPHA DATA";
  attribute X_INTERFACE_PARAMETER of alpha : signal is "XIL_INTERFACENAME DATA.ALPHA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of beta : signal is "xilinx.com:signal:data:1.0 DATA.BETA DATA";
  attribute X_INTERFACE_PARAMETER of beta : signal is "XIL_INTERFACENAME DATA.BETA, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of biasmul : signal is "xilinx.com:signal:data:1.0 DATA.BIASMUL DATA";
  attribute X_INTERFACE_PARAMETER of biasmul : signal is "XIL_INTERFACENAME DATA.BIASMUL, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of m_axi_gmem_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_PARAMETER of m_axi_gmem_araddr : signal is "XIL_INTERFACENAME m_axi_gmem, ADDR_WIDTH 64, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 1, HAS_LOCK 1, HAS_PROT 1, HAS_QOS 1, HAS_REGION 1, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 1, INSERT_VIP 0, MAX_BURST_LENGTH 256, NUM_READ_OUTSTANDING 16, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 16, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of m_axi_gmem_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awlock : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awqos : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awregion : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_bid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wid : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of m_axi_gmem_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi_gmem ";
  attribute X_INTERFACE_INFO of s_axi_control_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_PARAMETER of s_axi_control_araddr : signal is "XIL_INTERFACENAME s_axi_control, ADDR_WIDTH 32, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN bd_0_ap_clk_0, DATA_WIDTH 32, FREQ_HZ 100000000.0, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 0, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, INSERT_VIP 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.0, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0";
  attribute X_INTERFACE_INFO of s_axi_control_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
  attribute X_INTERFACE_INFO of s_axi_control_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi_control ";
begin
  Ni_0_1(31 downto 0) <= Ni(31 downto 0);
  Nj_0_1(31 downto 0) <= Nj(31 downto 0);
  alpha_0_1(31 downto 0) <= alpha(31 downto 0);
  ap_clk_0_1 <= ap_clk;
  ap_ctrl_0_1_start <= ap_ctrl_start;
  ap_ctrl_done <= ap_ctrl_0_1_done;
  ap_ctrl_idle <= ap_ctrl_0_1_idle;
  ap_ctrl_ready <= ap_ctrl_0_1_ready;
  ap_rst_n_0_1 <= ap_rst_n;
  beta_0_1(31 downto 0) <= beta(31 downto 0);
  biasmul_0_1(31 downto 0) <= biasmul(31 downto 0);
  hls_inst_m_axi_gmem_ARREADY <= m_axi_gmem_arready;
  hls_inst_m_axi_gmem_AWREADY <= m_axi_gmem_awready;
  hls_inst_m_axi_gmem_BID(0) <= m_axi_gmem_bid(0);
  hls_inst_m_axi_gmem_BRESP(1 downto 0) <= m_axi_gmem_bresp(1 downto 0);
  hls_inst_m_axi_gmem_BVALID <= m_axi_gmem_bvalid;
  hls_inst_m_axi_gmem_RDATA(31 downto 0) <= m_axi_gmem_rdata(31 downto 0);
  hls_inst_m_axi_gmem_RID(0) <= m_axi_gmem_rid(0);
  hls_inst_m_axi_gmem_RLAST <= m_axi_gmem_rlast;
  hls_inst_m_axi_gmem_RRESP(1 downto 0) <= m_axi_gmem_rresp(1 downto 0);
  hls_inst_m_axi_gmem_RVALID <= m_axi_gmem_rvalid;
  hls_inst_m_axi_gmem_WREADY <= m_axi_gmem_wready;
  m_axi_gmem_araddr(63 downto 0) <= hls_inst_m_axi_gmem_ARADDR(63 downto 0);
  m_axi_gmem_arburst(1 downto 0) <= hls_inst_m_axi_gmem_ARBURST(1 downto 0);
  m_axi_gmem_arcache(3 downto 0) <= hls_inst_m_axi_gmem_ARCACHE(3 downto 0);
  m_axi_gmem_arid(0) <= hls_inst_m_axi_gmem_ARID(0);
  m_axi_gmem_arlen(7 downto 0) <= hls_inst_m_axi_gmem_ARLEN(7 downto 0);
  m_axi_gmem_arlock(1 downto 0) <= hls_inst_m_axi_gmem_ARLOCK(1 downto 0);
  m_axi_gmem_arprot(2 downto 0) <= hls_inst_m_axi_gmem_ARPROT(2 downto 0);
  m_axi_gmem_arqos(3 downto 0) <= hls_inst_m_axi_gmem_ARQOS(3 downto 0);
  m_axi_gmem_arregion(3 downto 0) <= hls_inst_m_axi_gmem_ARREGION(3 downto 0);
  m_axi_gmem_arsize(2 downto 0) <= hls_inst_m_axi_gmem_ARSIZE(2 downto 0);
  m_axi_gmem_arvalid <= hls_inst_m_axi_gmem_ARVALID;
  m_axi_gmem_awaddr(63 downto 0) <= hls_inst_m_axi_gmem_AWADDR(63 downto 0);
  m_axi_gmem_awburst(1 downto 0) <= hls_inst_m_axi_gmem_AWBURST(1 downto 0);
  m_axi_gmem_awcache(3 downto 0) <= hls_inst_m_axi_gmem_AWCACHE(3 downto 0);
  m_axi_gmem_awid(0) <= hls_inst_m_axi_gmem_AWID(0);
  m_axi_gmem_awlen(7 downto 0) <= hls_inst_m_axi_gmem_AWLEN(7 downto 0);
  m_axi_gmem_awlock(1 downto 0) <= hls_inst_m_axi_gmem_AWLOCK(1 downto 0);
  m_axi_gmem_awprot(2 downto 0) <= hls_inst_m_axi_gmem_AWPROT(2 downto 0);
  m_axi_gmem_awqos(3 downto 0) <= hls_inst_m_axi_gmem_AWQOS(3 downto 0);
  m_axi_gmem_awregion(3 downto 0) <= hls_inst_m_axi_gmem_AWREGION(3 downto 0);
  m_axi_gmem_awsize(2 downto 0) <= hls_inst_m_axi_gmem_AWSIZE(2 downto 0);
  m_axi_gmem_awvalid <= hls_inst_m_axi_gmem_AWVALID;
  m_axi_gmem_bready <= hls_inst_m_axi_gmem_BREADY;
  m_axi_gmem_rready <= hls_inst_m_axi_gmem_RREADY;
  m_axi_gmem_wdata(31 downto 0) <= hls_inst_m_axi_gmem_WDATA(31 downto 0);
  m_axi_gmem_wid(0) <= hls_inst_m_axi_gmem_WID(0);
  m_axi_gmem_wlast <= hls_inst_m_axi_gmem_WLAST;
  m_axi_gmem_wstrb(3 downto 0) <= hls_inst_m_axi_gmem_WSTRB(3 downto 0);
  m_axi_gmem_wvalid <= hls_inst_m_axi_gmem_WVALID;
  s_axi_control_0_1_ARADDR(5 downto 0) <= s_axi_control_araddr(5 downto 0);
  s_axi_control_0_1_ARVALID <= s_axi_control_arvalid;
  s_axi_control_0_1_AWADDR(5 downto 0) <= s_axi_control_awaddr(5 downto 0);
  s_axi_control_0_1_AWVALID <= s_axi_control_awvalid;
  s_axi_control_0_1_BREADY <= s_axi_control_bready;
  s_axi_control_0_1_RREADY <= s_axi_control_rready;
  s_axi_control_0_1_WDATA(31 downto 0) <= s_axi_control_wdata(31 downto 0);
  s_axi_control_0_1_WSTRB(3 downto 0) <= s_axi_control_wstrb(3 downto 0);
  s_axi_control_0_1_WVALID <= s_axi_control_wvalid;
  s_axi_control_arready <= s_axi_control_0_1_ARREADY;
  s_axi_control_awready <= s_axi_control_0_1_AWREADY;
  s_axi_control_bresp(1 downto 0) <= s_axi_control_0_1_BRESP(1 downto 0);
  s_axi_control_bvalid <= s_axi_control_0_1_BVALID;
  s_axi_control_rdata(31 downto 0) <= s_axi_control_0_1_RDATA(31 downto 0);
  s_axi_control_rresp(1 downto 0) <= s_axi_control_0_1_RRESP(1 downto 0);
  s_axi_control_rvalid <= s_axi_control_0_1_RVALID;
  s_axi_control_wready <= s_axi_control_0_1_WREADY;
hls_inst: component bd_0_hls_inst_0
     port map (
      Ni(31 downto 0) => Ni_0_1(31 downto 0),
      Nj(31 downto 0) => Nj_0_1(31 downto 0),
      alpha(31 downto 0) => alpha_0_1(31 downto 0),
      ap_clk => ap_clk_0_1,
      ap_done => ap_ctrl_0_1_done,
      ap_idle => ap_ctrl_0_1_idle,
      ap_ready => ap_ctrl_0_1_ready,
      ap_rst_n => ap_rst_n_0_1,
      ap_start => ap_ctrl_0_1_start,
      beta(31 downto 0) => beta_0_1(31 downto 0),
      biasmul(31 downto 0) => biasmul_0_1(31 downto 0),
      m_axi_gmem_ARADDR(63 downto 0) => hls_inst_m_axi_gmem_ARADDR(63 downto 0),
      m_axi_gmem_ARBURST(1 downto 0) => hls_inst_m_axi_gmem_ARBURST(1 downto 0),
      m_axi_gmem_ARCACHE(3 downto 0) => hls_inst_m_axi_gmem_ARCACHE(3 downto 0),
      m_axi_gmem_ARID(0) => hls_inst_m_axi_gmem_ARID(0),
      m_axi_gmem_ARLEN(7 downto 0) => hls_inst_m_axi_gmem_ARLEN(7 downto 0),
      m_axi_gmem_ARLOCK(1 downto 0) => hls_inst_m_axi_gmem_ARLOCK(1 downto 0),
      m_axi_gmem_ARPROT(2 downto 0) => hls_inst_m_axi_gmem_ARPROT(2 downto 0),
      m_axi_gmem_ARQOS(3 downto 0) => hls_inst_m_axi_gmem_ARQOS(3 downto 0),
      m_axi_gmem_ARREADY => hls_inst_m_axi_gmem_ARREADY,
      m_axi_gmem_ARREGION(3 downto 0) => hls_inst_m_axi_gmem_ARREGION(3 downto 0),
      m_axi_gmem_ARSIZE(2 downto 0) => hls_inst_m_axi_gmem_ARSIZE(2 downto 0),
      m_axi_gmem_ARVALID => hls_inst_m_axi_gmem_ARVALID,
      m_axi_gmem_AWADDR(63 downto 0) => hls_inst_m_axi_gmem_AWADDR(63 downto 0),
      m_axi_gmem_AWBURST(1 downto 0) => hls_inst_m_axi_gmem_AWBURST(1 downto 0),
      m_axi_gmem_AWCACHE(3 downto 0) => hls_inst_m_axi_gmem_AWCACHE(3 downto 0),
      m_axi_gmem_AWID(0) => hls_inst_m_axi_gmem_AWID(0),
      m_axi_gmem_AWLEN(7 downto 0) => hls_inst_m_axi_gmem_AWLEN(7 downto 0),
      m_axi_gmem_AWLOCK(1 downto 0) => hls_inst_m_axi_gmem_AWLOCK(1 downto 0),
      m_axi_gmem_AWPROT(2 downto 0) => hls_inst_m_axi_gmem_AWPROT(2 downto 0),
      m_axi_gmem_AWQOS(3 downto 0) => hls_inst_m_axi_gmem_AWQOS(3 downto 0),
      m_axi_gmem_AWREADY => hls_inst_m_axi_gmem_AWREADY,
      m_axi_gmem_AWREGION(3 downto 0) => hls_inst_m_axi_gmem_AWREGION(3 downto 0),
      m_axi_gmem_AWSIZE(2 downto 0) => hls_inst_m_axi_gmem_AWSIZE(2 downto 0),
      m_axi_gmem_AWVALID => hls_inst_m_axi_gmem_AWVALID,
      m_axi_gmem_BID(0) => hls_inst_m_axi_gmem_BID(0),
      m_axi_gmem_BREADY => hls_inst_m_axi_gmem_BREADY,
      m_axi_gmem_BRESP(1 downto 0) => hls_inst_m_axi_gmem_BRESP(1 downto 0),
      m_axi_gmem_BVALID => hls_inst_m_axi_gmem_BVALID,
      m_axi_gmem_RDATA(31 downto 0) => hls_inst_m_axi_gmem_RDATA(31 downto 0),
      m_axi_gmem_RID(0) => hls_inst_m_axi_gmem_RID(0),
      m_axi_gmem_RLAST => hls_inst_m_axi_gmem_RLAST,
      m_axi_gmem_RREADY => hls_inst_m_axi_gmem_RREADY,
      m_axi_gmem_RRESP(1 downto 0) => hls_inst_m_axi_gmem_RRESP(1 downto 0),
      m_axi_gmem_RVALID => hls_inst_m_axi_gmem_RVALID,
      m_axi_gmem_WDATA(31 downto 0) => hls_inst_m_axi_gmem_WDATA(31 downto 0),
      m_axi_gmem_WID(0) => hls_inst_m_axi_gmem_WID(0),
      m_axi_gmem_WLAST => hls_inst_m_axi_gmem_WLAST,
      m_axi_gmem_WREADY => hls_inst_m_axi_gmem_WREADY,
      m_axi_gmem_WSTRB(3 downto 0) => hls_inst_m_axi_gmem_WSTRB(3 downto 0),
      m_axi_gmem_WVALID => hls_inst_m_axi_gmem_WVALID,
      s_axi_control_ARADDR(5 downto 0) => s_axi_control_0_1_ARADDR(5 downto 0),
      s_axi_control_ARREADY => s_axi_control_0_1_ARREADY,
      s_axi_control_ARVALID => s_axi_control_0_1_ARVALID,
      s_axi_control_AWADDR(5 downto 0) => s_axi_control_0_1_AWADDR(5 downto 0),
      s_axi_control_AWREADY => s_axi_control_0_1_AWREADY,
      s_axi_control_AWVALID => s_axi_control_0_1_AWVALID,
      s_axi_control_BREADY => s_axi_control_0_1_BREADY,
      s_axi_control_BRESP(1 downto 0) => s_axi_control_0_1_BRESP(1 downto 0),
      s_axi_control_BVALID => s_axi_control_0_1_BVALID,
      s_axi_control_RDATA(31 downto 0) => s_axi_control_0_1_RDATA(31 downto 0),
      s_axi_control_RREADY => s_axi_control_0_1_RREADY,
      s_axi_control_RRESP(1 downto 0) => s_axi_control_0_1_RRESP(1 downto 0),
      s_axi_control_RVALID => s_axi_control_0_1_RVALID,
      s_axi_control_WDATA(31 downto 0) => s_axi_control_0_1_WDATA(31 downto 0),
      s_axi_control_WREADY => s_axi_control_0_1_WREADY,
      s_axi_control_WSTRB(3 downto 0) => s_axi_control_0_1_WSTRB(3 downto 0),
      s_axi_control_WVALID => s_axi_control_0_1_WVALID
    );
end STRUCTURE;
