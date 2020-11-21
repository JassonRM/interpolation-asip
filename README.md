El código fuente puede encontrarse en el siguiente repositorio https://github.com/JassonRM/interpolation-asip

A continuación se muestra un listado de las herramientas utilizadas para el desarrollo del proyecto.

QuartusPrime version 20.1 - modelacion de hardware

Java jdk 8 - ambiente en el que corre el compilador

Modelsim 2020.1 - simulacion procesador

Intellij Idea - programacion java

Python 3.6 - Guia de desencripcion de imagen

VGA Simulator from https://ericeastwood.com/lab/vga-simulator/

Para la ejecución del proyecto se deben seguir los siguientes pasos:
1. Desde Quartus seleccionar la opción de abrir un proyecto
2. Seleccionar el archivo rsa-asip.qpf
3. Modificar las direcciones de los archivos vram.v, rom_encrypted.v, mide_cpu_test.sv
(Se debe reemplazar la parte C:/ del path por la dirección del proyecto)
4. Seleccionar el archivo mide_cpu_test.sv como top level del proyecto
5. Ejecutar la simulación
6. Ejecutar los siguientes comandos en modelsim:

vsim -L altera_mf_ver -L lpm_ver  work.mide_cpu_test
add wave -position insertpoint  \
sim:/mide_cpu_test/clk \
sim:/mide_cpu_test/gpu_address \
sim:/mide_cpu_test/gpu_clk \
sim:/mide_cpu_test/image_select \
sim:/mide_cpu_test/reset \
sim:/mide_cpu_test/start_button \
sim:/mide_cpu_test/vram_out
add wave -position insertpoint  \
sim:/mide_cpu_test/DUT/MEM/instr_address \
sim:/mide_cpu_test/DUT/MEM/instr_output \
sim:/mide_cpu_test/DUT/MEM/vector_input
add wave -position insertpoint  \
sim:/mide_cpu_test/DUT/EXE/ALUinputA \
sim:/mide_cpu_test/DUT/EXE/ALUinputB \
sim:/mide_cpu_test/DUT/EXE/ALUop \
sim:/mide_cpu_test/DUT/EXE/ALUresult \
sim:/mide_cpu_test/DUT/EXE/VALUinputA \
sim:/mide_cpu_test/DUT/EXE/VALUinputB \
sim:/mide_cpu_test/DUT/EXE/VALUresult \
sim:/mide_cpu_test/DUT/MEM/mem/AddrDecoder/write_enable \
sim:/mide_cpu_test/DUT/MEM/mem/AddrDecoder/address \
sim:/mide_cpu_test/DUT/MEM/mem/AddrDecoder/data_input \
sim:/mide_cpu_test/DUT/MEM/mem/AddrDecoder/data_output
run 160000000

7. Correr la simulación por 2 frames con el comando

run 33.4ms
