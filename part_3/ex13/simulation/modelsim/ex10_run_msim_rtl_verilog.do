transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/New\ folder/ex10/verilog_files {C:/New folder/ex10/verilog_files/spi2dac.v}

