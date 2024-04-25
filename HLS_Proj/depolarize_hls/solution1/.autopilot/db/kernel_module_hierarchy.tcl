set ModuleHierarchy {[{
"Name" : "depolarize_hls","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_depolarize_hls_Pipeline_read_bwsup_fu_257","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "read_bwsup","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_depolarize_hls_Pipeline_read_Wij_first_read_Wij_second_fu_266","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "read_Wij_first_read_Wij_second","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_depolarize_hls_Pipeline_read_Xi_fu_275","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "read_Xi","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_depolarize_hls_Pipeline_read_Bj_fu_284","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "read_Bj","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_depolarize_hls_Pipeline_store_bwsup_fu_303","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "store_bwsup","ID" : "10","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "computeCol","ID" : "11","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_depolarize_hls_Pipeline_computeRow_fu_293","ID" : "12","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "computeRow","ID" : "13","Type" : "pipeline"},]},]},]
}]}