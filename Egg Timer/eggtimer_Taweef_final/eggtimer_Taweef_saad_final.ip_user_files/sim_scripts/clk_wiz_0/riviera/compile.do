vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" \
"../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

