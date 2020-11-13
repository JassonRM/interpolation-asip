transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/WPC/Documents/div_test {C:/Users/WPC/Documents/div_test/ram.v}
vlog -sv -work work +incdir+C:/Users/WPC/Documents/div_test {C:/Users/WPC/Documents/div_test/ram_test.sv}

