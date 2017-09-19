##
vlib work
vcom -explicit  -93 "../ULA.vhd"
vcom -explicit  -93 "ULA_tb.vhd"
vsim -t 1ps   -lib work ULA_tb
add wave sim:/ULA_tb/*
#do {wave1.do}
view wave
view structure
view signals
run 1us