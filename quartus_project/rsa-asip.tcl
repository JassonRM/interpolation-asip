# Copyright (C) 2020  Intel Corporation. All rights reserved.
# Your use of Intel Corporation's design tools, logic functions 
# and other software and tools, and any partner logic 
# functions, and any output files from any of the foregoing 
# (including device programming or simulation files), and any 
# associated documentation or information are expressly subject 
# to the terms and conditions of the Intel Program License 
# Subscription Agreement, the Intel Quartus Prime License Agreement,
# the Intel FPGA IP License Agreement, or other applicable license
# agreement, including, without limitation, that your use is for
# the sole purpose of programming logic devices manufactured by
# Intel and sold by Intel or its authorized distributors.  Please
# refer to the applicable agreement for further details, at
# https://fpgasoftware.intel.com/eula.

# Quartus Prime: Generate Tcl File for Project
# File: rsa-asip.tcl
# Generated on: Wed Jul 15 17:15:31 2020

# Load Quartus Prime Tcl Project package
package require ::quartus::project

set need_to_close_project 0
set make_assignments 1

# Check that the right project is open
if {[is_project_open]} {
	if {[string compare $quartus(project) "rsa-asip"]} {
		puts "Project rsa-asip is not open"
		set make_assignments 0
	}
} else {
	# Only open if not already open
	if {[project_exists rsa-asip]} {
		project_open -revision mide_cpu rsa-asip
	} else {
		project_new -revision mide_cpu rsa-asip
	}
	set need_to_close_project 1
}

# Make assignments
if {$make_assignments} {
	set_global_assignment -name FAMILY "Cyclone V"
	set_global_assignment -name DEVICE 5CSEMA5F31C6
	set_global_assignment -name TOP_LEVEL_ENTITY top
	set_global_assignment -name ORIGINAL_QUARTUS_VERSION 20.1.0
	set_global_assignment -name PROJECT_CREATION_TIME_DATE "16:40:19  JULY 15, 2020"
	set_global_assignment -name LAST_QUARTUS_VERSION "20.1.0 Lite Edition"
	set_global_assignment -name PROJECT_OUTPUT_DIRECTORY output_files
	set_global_assignment -name BOARD "DE1-SoC Board"
	set_global_assignment -name EDA_SIMULATION_TOOL "ModelSim-Altera (SystemVerilog)"
	set_global_assignment -name EDA_OUTPUT_DATA_FORMAT "SYSTEMVERILOG HDL" -section_id eda_simulation
	set_global_assignment -name MIN_CORE_JUNCTION_TEMP 0
	set_global_assignment -name MAX_CORE_JUNCTION_TEMP 85
	set_global_assignment -name POWER_PRESET_COOLING_SOLUTION "23 MM HEAT SINK WITH 200 LFPM AIRFLOW"
	set_global_assignment -name POWER_BOARD_THERMAL_MODEL "NONE (CONSERVATIVE)"
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/clk/clk_controller_test.sv
	set_global_assignment -name VERILOG_FILE ../processor/clk/clk_controller.v
	set_global_assignment -name QIP_FILE ../processor/clk/clk_controller.qip
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/top.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Fetch/Ifetch_testV1.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/VectorALU/vectorALU_unit_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/VectorALU/vectorALU_unit.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/VectorALU/vectorALU_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/VectorALU/vectorALU.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/testbench/testSyncRegister.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/testbench/testBench_vectorial.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/testbench/scalar_registers_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/vectorialRegAddress.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/vectorial_registers.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/top_vectorial_reg.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/syncRegister.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/scalar_registers.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/registers/Decode_Reg.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Fetch/mux_fetch.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Fetch/instruction_mem.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Fetch/instr_fetch.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Fetch/add4.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Decode/SignExtend16.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Decode/instr_decode.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Decode/extend16.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Instruction_Decode/extend5.sv
	set_global_assignment -name VERILOG_FILE ../processor/graphics/submodules/altera_avalon_video_sync_generator.v
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/video_sync_generator_test.sv
	set_global_assignment -name VERILOG_FILE ../processor/graphics/video_sync_generator.v
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/image_controller_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/image_controller.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/graphics_controller_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/graphics_controller.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/display_mem_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/color_decoder_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/graphics/color_decoder.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Execute/execute_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/Execute/execute.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/control/PC_deco.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/control/forwarding_unit_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/control/forwarding_unit.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/control/Control_Unit.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/testbench/testALU.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/sub.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/sRight.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/sLeft.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/or_.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/mux_ALU.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/mul.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/escalar_ALU.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/and_.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/ALU/add.sv
	set_global_assignment -name VERILOG_FILE ../processor/memory/vram_decrypted.v
	set_global_assignment -name QIP_FILE ../processor/memory/vram_decrypted.qip
	set_global_assignment -name VERILOG_FILE ../processor/memory/rom_encrypted.v
	set_global_assignment -name QIP_FILE ../processor/memory/rom_encrypted.qip
	set_global_assignment -name VERILOG_FILE ../processor/memory/ram.v
	set_global_assignment -name QIP_FILE ../processor/memory/ram.qip
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/memory_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/memory.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/iomemory_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/iomemory.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/address_decoder_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/memory/address_decoder.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/mide_cpu_test.sv
	set_global_assignment -name SYSTEMVERILOG_FILE ../processor/mide_cpu.sv
	set_global_assignment -name PARTITION_NETLIST_TYPE SOURCE -section_id Top
	set_global_assignment -name PARTITION_FITTER_PRESERVATION_LEVEL PLACEMENT_AND_ROUTING -section_id Top
	set_global_assignment -name PARTITION_COLOR 16764057 -section_id Top
	set_instance_assignment -name PARTITION_HIERARCHY root_partition -to | -section_id Top

	# Commit assignments
	export_assignments

	# Close project
	if {$need_to_close_project} {
		project_close
	}
}
