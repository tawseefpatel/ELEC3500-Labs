vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2016.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" "+incdir+../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0" \
"../../../../eggtimer_Taweef_saad_final.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_sim_netlist.v" \


vlog -work xil_defaultlib "glbl.v"

