set_global_assignment -entity "clk_controller" -library "lib_clk_controller" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "clk_controller" -library "lib_clk_controller" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "clk_controller" -library "lib_clk_controller" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_clk_controller" -name SPD_FILE [file join $::quartus(sip_path) "clk_controller.spd"]

set_global_assignment -library "lib_clk_controller" -name MISC_FILE [file join $::quartus(sip_path) "clk_controller_sim/clk_controller.vo"]
