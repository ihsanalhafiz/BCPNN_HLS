# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_control {
d_bwsup { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 16
	offset_end 27
}
d_Wij { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 28
	offset_end 39
}
d_Xi { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 40
	offset_end 51
}
d_Bj { 
	dir I
	width 64
	depth 1
	mode ap_none
	offset 52
	offset_end 63
}
}
dict set axilite_register_dict control $port_control


