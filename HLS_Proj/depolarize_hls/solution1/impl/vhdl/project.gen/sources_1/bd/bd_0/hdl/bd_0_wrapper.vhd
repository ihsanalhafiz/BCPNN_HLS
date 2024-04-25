--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Thu Apr 25 17:01:19 2024
--Host        : miahafiz running 64-bit Ubuntu 22.04.4 LTS
--Command     : generate_target bd_0_wrapper.bd
--Design      : bd_0_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity bd_0_wrapper is
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
end bd_0_wrapper;

architecture STRUCTURE of bd_0_wrapper is
  component bd_0 is
  port (
    Ni : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Nj : in STD_LOGIC_VECTOR ( 31 downto 0 );
    alpha : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    beta : in STD_LOGIC_VECTOR ( 31 downto 0 );
    biasmul : in STD_LOGIC_VECTOR ( 31 downto 0 );
    ap_ctrl_start : in STD_LOGIC;
    ap_ctrl_done : out STD_LOGIC;
    ap_ctrl_idle : out STD_LOGIC;
    ap_ctrl_ready : out STD_LOGIC;
    m_axi_gmem_awid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_awaddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_awregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_awqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_awvalid : out STD_LOGIC;
    m_axi_gmem_awready : in STD_LOGIC;
    m_axi_gmem_wid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_wlast : out STD_LOGIC;
    m_axi_gmem_wvalid : out STD_LOGIC;
    m_axi_gmem_wready : in STD_LOGIC;
    m_axi_gmem_bid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_bvalid : in STD_LOGIC;
    m_axi_gmem_bready : out STD_LOGIC;
    m_axi_gmem_arid : out STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_araddr : out STD_LOGIC_VECTOR ( 63 downto 0 );
    m_axi_gmem_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_gmem_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_arregion : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_gmem_arqos : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_gmem_arvalid : out STD_LOGIC;
    m_axi_gmem_arready : in STD_LOGIC;
    m_axi_gmem_rid : in STD_LOGIC_VECTOR ( 0 to 0 );
    m_axi_gmem_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_gmem_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_gmem_rlast : in STD_LOGIC;
    m_axi_gmem_rvalid : in STD_LOGIC;
    m_axi_gmem_rready : out STD_LOGIC;
    s_axi_control_awaddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_awvalid : in STD_LOGIC;
    s_axi_control_awready : out STD_LOGIC;
    s_axi_control_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_control_wvalid : in STD_LOGIC;
    s_axi_control_wready : out STD_LOGIC;
    s_axi_control_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_bvalid : out STD_LOGIC;
    s_axi_control_bready : in STD_LOGIC;
    s_axi_control_araddr : in STD_LOGIC_VECTOR ( 5 downto 0 );
    s_axi_control_arvalid : in STD_LOGIC;
    s_axi_control_arready : out STD_LOGIC;
    s_axi_control_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_control_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_control_rvalid : out STD_LOGIC;
    s_axi_control_rready : in STD_LOGIC
  );
  end component bd_0;
begin
bd_0_i: component bd_0
     port map (
      Ni(31 downto 0) => Ni(31 downto 0),
      Nj(31 downto 0) => Nj(31 downto 0),
      alpha(31 downto 0) => alpha(31 downto 0),
      ap_clk => ap_clk,
      ap_ctrl_done => ap_ctrl_done,
      ap_ctrl_idle => ap_ctrl_idle,
      ap_ctrl_ready => ap_ctrl_ready,
      ap_ctrl_start => ap_ctrl_start,
      ap_rst_n => ap_rst_n,
      beta(31 downto 0) => beta(31 downto 0),
      biasmul(31 downto 0) => biasmul(31 downto 0),
      m_axi_gmem_araddr(63 downto 0) => m_axi_gmem_araddr(63 downto 0),
      m_axi_gmem_arburst(1 downto 0) => m_axi_gmem_arburst(1 downto 0),
      m_axi_gmem_arcache(3 downto 0) => m_axi_gmem_arcache(3 downto 0),
      m_axi_gmem_arid(0) => m_axi_gmem_arid(0),
      m_axi_gmem_arlen(7 downto 0) => m_axi_gmem_arlen(7 downto 0),
      m_axi_gmem_arlock(1 downto 0) => m_axi_gmem_arlock(1 downto 0),
      m_axi_gmem_arprot(2 downto 0) => m_axi_gmem_arprot(2 downto 0),
      m_axi_gmem_arqos(3 downto 0) => m_axi_gmem_arqos(3 downto 0),
      m_axi_gmem_arready => m_axi_gmem_arready,
      m_axi_gmem_arregion(3 downto 0) => m_axi_gmem_arregion(3 downto 0),
      m_axi_gmem_arsize(2 downto 0) => m_axi_gmem_arsize(2 downto 0),
      m_axi_gmem_arvalid => m_axi_gmem_arvalid,
      m_axi_gmem_awaddr(63 downto 0) => m_axi_gmem_awaddr(63 downto 0),
      m_axi_gmem_awburst(1 downto 0) => m_axi_gmem_awburst(1 downto 0),
      m_axi_gmem_awcache(3 downto 0) => m_axi_gmem_awcache(3 downto 0),
      m_axi_gmem_awid(0) => m_axi_gmem_awid(0),
      m_axi_gmem_awlen(7 downto 0) => m_axi_gmem_awlen(7 downto 0),
      m_axi_gmem_awlock(1 downto 0) => m_axi_gmem_awlock(1 downto 0),
      m_axi_gmem_awprot(2 downto 0) => m_axi_gmem_awprot(2 downto 0),
      m_axi_gmem_awqos(3 downto 0) => m_axi_gmem_awqos(3 downto 0),
      m_axi_gmem_awready => m_axi_gmem_awready,
      m_axi_gmem_awregion(3 downto 0) => m_axi_gmem_awregion(3 downto 0),
      m_axi_gmem_awsize(2 downto 0) => m_axi_gmem_awsize(2 downto 0),
      m_axi_gmem_awvalid => m_axi_gmem_awvalid,
      m_axi_gmem_bid(0) => m_axi_gmem_bid(0),
      m_axi_gmem_bready => m_axi_gmem_bready,
      m_axi_gmem_bresp(1 downto 0) => m_axi_gmem_bresp(1 downto 0),
      m_axi_gmem_bvalid => m_axi_gmem_bvalid,
      m_axi_gmem_rdata(31 downto 0) => m_axi_gmem_rdata(31 downto 0),
      m_axi_gmem_rid(0) => m_axi_gmem_rid(0),
      m_axi_gmem_rlast => m_axi_gmem_rlast,
      m_axi_gmem_rready => m_axi_gmem_rready,
      m_axi_gmem_rresp(1 downto 0) => m_axi_gmem_rresp(1 downto 0),
      m_axi_gmem_rvalid => m_axi_gmem_rvalid,
      m_axi_gmem_wdata(31 downto 0) => m_axi_gmem_wdata(31 downto 0),
      m_axi_gmem_wid(0) => m_axi_gmem_wid(0),
      m_axi_gmem_wlast => m_axi_gmem_wlast,
      m_axi_gmem_wready => m_axi_gmem_wready,
      m_axi_gmem_wstrb(3 downto 0) => m_axi_gmem_wstrb(3 downto 0),
      m_axi_gmem_wvalid => m_axi_gmem_wvalid,
      s_axi_control_araddr(5 downto 0) => s_axi_control_araddr(5 downto 0),
      s_axi_control_arready => s_axi_control_arready,
      s_axi_control_arvalid => s_axi_control_arvalid,
      s_axi_control_awaddr(5 downto 0) => s_axi_control_awaddr(5 downto 0),
      s_axi_control_awready => s_axi_control_awready,
      s_axi_control_awvalid => s_axi_control_awvalid,
      s_axi_control_bready => s_axi_control_bready,
      s_axi_control_bresp(1 downto 0) => s_axi_control_bresp(1 downto 0),
      s_axi_control_bvalid => s_axi_control_bvalid,
      s_axi_control_rdata(31 downto 0) => s_axi_control_rdata(31 downto 0),
      s_axi_control_rready => s_axi_control_rready,
      s_axi_control_rresp(1 downto 0) => s_axi_control_rresp(1 downto 0),
      s_axi_control_rvalid => s_axi_control_rvalid,
      s_axi_control_wdata(31 downto 0) => s_axi_control_wdata(31 downto 0),
      s_axi_control_wready => s_axi_control_wready,
      s_axi_control_wstrb(3 downto 0) => s_axi_control_wstrb(3 downto 0),
      s_axi_control_wvalid => s_axi_control_wvalid
    );
end STRUCTURE;
