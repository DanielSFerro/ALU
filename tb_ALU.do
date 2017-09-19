##
vlib work
vcom -explicit  -93 "../ALU.vhd"
vcom -explicit  -93 "ALU_tb.vhd"
vsim -t 1ps   -lib work ALU_tb
add wave sim:/ALU_tb/*
#do {wave1.do}
view wave
view structure
view signals
run 1us
