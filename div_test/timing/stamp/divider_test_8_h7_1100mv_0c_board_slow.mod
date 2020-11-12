/*
 Copyright (C) 2018  Intel Corporation. All rights reserved.
 Your use of Intel Corporation's design tools, logic functions 
 and other software and tools, and its AMPP partner logic 
 functions, and any output files from any of the foregoing 
 (including device programming or simulation files), and any 
 associated documentation or information are expressly subject 
 to the terms and conditions of the Intel Program License 
 Subscription Agreement, the Intel Quartus Prime License Agreement,
 the Intel FPGA IP License Agreement, or other applicable license
 agreement, including, without limitation, that your use is for
 the sole purpose of programming logic devices manufactured by
 Intel and sold by Intel or its authorized distributors.  Please
 refer to the applicable agreement for further details.
*/
MODEL
/*MODEL HEADER*/
/*
 This file contains Slow Corner delays for the design using part 5CGXFC7C7F23C8
 with speed grade 8_H7, core voltage 1.1V, and temperature 0 Celsius

*/
MODEL_VERSION "1.0";
DESIGN "divider_test";
DATE "11/10/2020 12:45:39";
PROGRAM "Quartus Prime";



INPUT denom[7];
INPUT denom[6];
INPUT denom[5];
INPUT denom[4];
INPUT denom[2];
INPUT denom[3];
INPUT numer[7];
INPUT numer[5];
INPUT denom[1];
INPUT numer[6];
INPUT denom[0];
INPUT numer[4];
INPUT numer[3];
INPUT numer[2];
INPUT numer[1];
INPUT numer[0];
OUTPUT quotient[0];
OUTPUT quotient[1];
OUTPUT quotient[2];
OUTPUT quotient[3];
OUTPUT quotient[4];
OUTPUT quotient[5];
OUTPUT quotient[6];
OUTPUT quotient[7];
OUTPUT remain[0];
OUTPUT remain[1];
OUTPUT remain[2];
OUTPUT remain[3];
OUTPUT remain[4];
OUTPUT remain[5];
OUTPUT remain[6];
OUTPUT remain[7];

/*Arc definitions start here*/
_25.237__25.084__delay:		DELAY 25.237 25.084 ;
_23.500__23.398__delay:		DELAY 23.500 23.398 ;
_20.755__20.695__delay:		DELAY 20.755 20.695 ;
_18.257__18.182__delay:		DELAY 18.257 18.182 ;
_15.198__14.876__delay:		DELAY 15.198 14.876 ;
_12.081__11.778__delay:		DELAY 12.081 11.778 ;
_10.611__delay:		DELAY 10.611  ;
_10.811__delay:		DELAY 10.811  ;
_26.110__26.411__delay:		DELAY 26.110 26.411 ;
_25.847__26.045__delay:		DELAY 25.847 26.045 ;
_26.034__26.087__delay:		DELAY 26.034 26.087 ;
_26.442__26.650__delay:		DELAY 26.442 26.650 ;
_25.932__25.953__delay:		DELAY 25.932 25.953 ;
_26.478__26.637__delay:		DELAY 26.478 26.637 ;
_26.121__26.238__delay:		DELAY 26.121 26.238 ;
_26.385__26.530__delay:		DELAY 26.385 26.530 ;
_25.366__25.213__delay:		DELAY 25.366 25.213 ;
_23.629__23.527__delay:		DELAY 23.629 23.527 ;
_20.884__20.824__delay:		DELAY 20.884 20.824 ;
_18.386__18.311__delay:		DELAY 18.386 18.311 ;
_15.327__15.005__delay:		DELAY 15.327 15.005 ;
_12.170__12.036__delay:		DELAY 12.170 12.036 ;
_11.079__delay:		DELAY 11.079  ;
_11.362__delay:		DELAY 11.362  ;
_26.239__26.540__delay:		DELAY 26.239 26.540 ;
_25.976__26.174__delay:		DELAY 25.976 26.174 ;
_26.163__26.216__delay:		DELAY 26.163 26.216 ;
_26.571__26.779__delay:		DELAY 26.571 26.779 ;
_26.061__26.082__delay:		DELAY 26.061 26.082 ;
_26.607__26.766__delay:		DELAY 26.607 26.766 ;
_26.250__26.367__delay:		DELAY 26.250 26.367 ;
_26.514__26.659__delay:		DELAY 26.514 26.659 ;
_29.319__29.166__delay:		DELAY 29.319 29.166 ;
_27.582__27.480__delay:		DELAY 27.582 27.480 ;
_24.837__24.777__delay:		DELAY 24.837 24.777 ;
_22.339__22.264__delay:		DELAY 22.339 22.264 ;
_19.280__18.958__delay:		DELAY 19.280 18.958 ;
_14.096__15.989__delay:		DELAY 14.096 15.989 ;
_14.885__delay:		DELAY 14.885  ;
_14.774__delay:		DELAY 14.774  ;
_30.192__30.493__delay:		DELAY 30.192 30.493 ;
_29.929__30.127__delay:		DELAY 29.929 30.127 ;
_30.116__30.169__delay:		DELAY 30.116 30.169 ;
_30.524__30.732__delay:		DELAY 30.524 30.732 ;
_30.014__30.035__delay:		DELAY 30.014 30.035 ;
_30.560__30.719__delay:		DELAY 30.560 30.719 ;
_30.203__30.320__delay:		DELAY 30.203 30.320 ;
_30.467__30.612__delay:		DELAY 30.467 30.612 ;
_29.432__29.279__delay:		DELAY 29.432 29.279 ;
_27.695__27.593__delay:		DELAY 27.695 27.593 ;
_24.950__24.890__delay:		DELAY 24.950 24.890 ;
_22.452__22.377__delay:		DELAY 22.452 22.377 ;
_19.393__19.071__delay:		DELAY 19.393 19.071 ;
_14.299__16.102__delay:		DELAY 14.299 16.102 ;
_14.998__delay:		DELAY 14.998  ;
_14.887__delay:		DELAY 14.887  ;
_30.305__30.606__delay:		DELAY 30.305 30.606 ;
_30.042__30.240__delay:		DELAY 30.042 30.240 ;
_30.229__30.282__delay:		DELAY 30.229 30.282 ;
_30.637__30.845__delay:		DELAY 30.637 30.845 ;
_30.127__30.148__delay:		DELAY 30.127 30.148 ;
_30.673__30.832__delay:		DELAY 30.673 30.832 ;
_30.316__30.433__delay:		DELAY 30.316 30.433 ;
_30.580__30.725__delay:		DELAY 30.580 30.725 ;
_29.158__29.005__delay:		DELAY 29.158 29.005 ;
_27.421__27.319__delay:		DELAY 27.421 27.319 ;
_24.676__24.616__delay:		DELAY 24.676 24.616 ;
_22.178__22.103__delay:		DELAY 22.178 22.103 ;
_19.119__18.797__delay:		DELAY 19.119 18.797 ;
_15.059__15.828__delay:		DELAY 15.059 15.828 ;
_14.724__delay:		DELAY 14.724  ;
_14.613__delay:		DELAY 14.613  ;
_30.031__30.332__delay:		DELAY 30.031 30.332 ;
_29.768__29.966__delay:		DELAY 29.768 29.966 ;
_29.955__30.008__delay:		DELAY 29.955 30.008 ;
_30.363__30.571__delay:		DELAY 30.363 30.571 ;
_29.853__29.874__delay:		DELAY 29.853 29.874 ;
_30.399__30.558__delay:		DELAY 30.399 30.558 ;
_30.042__30.159__delay:		DELAY 30.042 30.159 ;
_30.306__30.451__delay:		DELAY 30.306 30.451 ;
_28.713__28.560__delay:		DELAY 28.713 28.560 ;
_26.976__26.874__delay:		DELAY 26.976 26.874 ;
_24.231__24.171__delay:		DELAY 24.231 24.171 ;
_21.733__21.658__delay:		DELAY 21.733 21.658 ;
_18.674__18.352__delay:		DELAY 18.674 18.352 ;
_14.615__15.383__delay:		DELAY 14.615 15.383 ;
_14.279__delay:		DELAY 14.279  ;
_14.168__delay:		DELAY 14.168  ;
_29.586__29.887__delay:		DELAY 29.586 29.887 ;
_29.323__29.521__delay:		DELAY 29.323 29.521 ;
_29.510__29.563__delay:		DELAY 29.510 29.563 ;
_29.918__30.126__delay:		DELAY 29.918 30.126 ;
_29.408__29.429__delay:		DELAY 29.408 29.429 ;
_29.954__30.113__delay:		DELAY 29.954 30.113 ;
_29.597__29.714__delay:		DELAY 29.597 29.714 ;
_29.861__30.006__delay:		DELAY 29.861 30.006 ;
_26.790__26.637__delay:		DELAY 26.790 26.637 ;
_25.053__24.951__delay:		DELAY 25.053 24.951 ;
_22.308__22.248__delay:		DELAY 22.308 22.248 ;
_19.810__19.735__delay:		DELAY 19.810 19.735 ;
_16.751__16.429__delay:		DELAY 16.751 16.429 ;
_12.680__13.460__delay:		DELAY 12.680 13.460 ;
_12.356__delay:		DELAY 12.356  ;
_12.245__delay:		DELAY 12.245  ;
_27.663__27.964__delay:		DELAY 27.663 27.964 ;
_27.400__27.598__delay:		DELAY 27.400 27.598 ;
_27.587__27.640__delay:		DELAY 27.587 27.640 ;
_27.995__28.203__delay:		DELAY 27.995 28.203 ;
_27.485__27.506__delay:		DELAY 27.485 27.506 ;
_28.031__28.190__delay:		DELAY 28.031 28.190 ;
_27.674__27.791__delay:		DELAY 27.674 27.791 ;
_27.938__28.083__delay:		DELAY 27.938 28.083 ;
_28.920__28.767__delay:		DELAY 28.920 28.767 ;
_27.183__27.081__delay:		DELAY 27.183 27.081 ;
_24.438__24.378__delay:		DELAY 24.438 24.378 ;
_21.940__21.865__delay:		DELAY 21.940 21.865 ;
_18.881__18.559__delay:		DELAY 18.881 18.559 ;
_14.814__15.590__delay:		DELAY 14.814 15.590 ;
_14.486__delay:		DELAY 14.486  ;
_14.375__delay:		DELAY 14.375  ;
_29.793__30.094__delay:		DELAY 29.793 30.094 ;
_29.530__29.728__delay:		DELAY 29.530 29.728 ;
_29.717__29.770__delay:		DELAY 29.717 29.770 ;
_30.125__30.333__delay:		DELAY 30.125 30.333 ;
_29.615__29.636__delay:		DELAY 29.615 29.636 ;
_30.161__30.320__delay:		DELAY 30.161 30.320 ;
_29.804__29.921__delay:		DELAY 29.804 29.921 ;
_30.068__30.213__delay:		DELAY 30.068 30.213 ;
_13.983__13.830__delay:		DELAY 13.983 13.830 ;
_14.856__15.157__delay:		DELAY 14.856 15.157 ;
_14.883__15.085__delay:		DELAY 14.883 15.085 ;
_14.780__14.833__delay:		DELAY 14.780 14.833 ;
_15.188__15.396__delay:		DELAY 15.188 15.396 ;
_14.678__14.699__delay:		DELAY 14.678 14.699 ;
_15.224__15.383__delay:		DELAY 15.224 15.383 ;
_14.867__14.984__delay:		DELAY 14.867 14.984 ;
_15.131__15.276__delay:		DELAY 15.131 15.276 ;
_17.177__17.024__delay:		DELAY 17.177 17.024 ;
_15.428__15.312__delay:		DELAY 15.428 15.312 ;
_18.050__18.351__delay:		DELAY 18.050 18.351 ;
_17.787__17.985__delay:		DELAY 17.787 17.985 ;
_17.974__18.027__delay:		DELAY 17.974 18.027 ;
_18.382__18.590__delay:		DELAY 18.382 18.590 ;
_17.872__17.893__delay:		DELAY 17.872 17.893 ;
_18.418__18.577__delay:		DELAY 18.418 18.577 ;
_18.061__18.178__delay:		DELAY 18.061 18.178 ;
_18.325__18.470__delay:		DELAY 18.325 18.470 ;
_16.734__16.581__delay:		DELAY 16.734 16.581 ;
_14.997__14.895__delay:		DELAY 14.997 14.895 ;
_12.461__12.401__delay:		DELAY 12.461 12.401 ;
_17.607__17.908__delay:		DELAY 17.607 17.908 ;
_17.344__17.542__delay:		DELAY 17.344 17.542 ;
_17.531__17.584__delay:		DELAY 17.531 17.584 ;
_17.939__18.147__delay:		DELAY 17.939 18.147 ;
_17.429__17.450__delay:		DELAY 17.429 17.450 ;
_17.975__18.134__delay:		DELAY 17.975 18.134 ;
_17.618__17.735__delay:		DELAY 17.618 17.735 ;
_17.882__18.027__delay:		DELAY 17.882 18.027 ;
_19.719__19.566__delay:		DELAY 19.719 19.566 ;
_17.982__17.880__delay:		DELAY 17.982 17.880 ;
_15.237__15.177__delay:		DELAY 15.237 15.177 ;
_12.724__12.664__delay:		DELAY 12.724 12.664 ;
_20.592__20.893__delay:		DELAY 20.592 20.893 ;
_20.329__20.527__delay:		DELAY 20.329 20.527 ;
_20.516__20.569__delay:		DELAY 20.516 20.569 ;
_20.924__21.132__delay:		DELAY 20.924 21.132 ;
_20.414__20.435__delay:		DELAY 20.414 20.435 ;
_20.960__21.119__delay:		DELAY 20.960 21.119 ;
_20.603__20.720__delay:		DELAY 20.603 20.720 ;
_20.867__21.012__delay:		DELAY 20.867 21.012 ;
_23.431__23.278__delay:		DELAY 23.431 23.278 ;
_21.694__21.592__delay:		DELAY 21.694 21.592 ;
_18.949__18.889__delay:		DELAY 18.949 18.889 ;
_16.451__16.376__delay:		DELAY 16.451 16.376 ;
_13.392__13.070__delay:		DELAY 13.392 13.070 ;
_24.304__24.605__delay:		DELAY 24.304 24.605 ;
_24.041__24.239__delay:		DELAY 24.041 24.239 ;
_24.228__24.281__delay:		DELAY 24.228 24.281 ;
_24.636__24.844__delay:		DELAY 24.636 24.844 ;
_24.126__24.147__delay:		DELAY 24.126 24.147 ;
_24.672__24.831__delay:		DELAY 24.672 24.831 ;
_24.315__24.432__delay:		DELAY 24.315 24.432 ;
_24.579__24.724__delay:		DELAY 24.579 24.724 ;
_24.079__23.926__delay:		DELAY 24.079 23.926 ;
_22.342__22.240__delay:		DELAY 22.342 22.240 ;
_19.597__19.537__delay:		DELAY 19.597 19.537 ;
_17.099__17.024__delay:		DELAY 17.099 17.024 ;
_14.040__13.718__delay:		DELAY 14.040 13.718 ;
___10.717__delay:		DELAY  10.717 ;
_24.952__25.253__delay:		DELAY 24.952 25.253 ;
_24.689__24.887__delay:		DELAY 24.689 24.887 ;
_24.876__24.929__delay:		DELAY 24.876 24.929 ;
_25.284__25.492__delay:		DELAY 25.284 25.492 ;
_24.774__24.795__delay:		DELAY 24.774 24.795 ;
_25.320__25.479__delay:		DELAY 25.320 25.479 ;
_24.963__25.080__delay:		DELAY 24.963 25.080 ;
_25.227__25.372__delay:		DELAY 25.227 25.372 ;
_25.074__24.921__delay:		DELAY 25.074 24.921 ;
_23.337__23.235__delay:		DELAY 23.337 23.235 ;
_20.592__20.532__delay:		DELAY 20.592 20.532 ;
_18.094__18.019__delay:		DELAY 18.094 18.019 ;
_15.035__14.713__delay:		DELAY 15.035 14.713 ;
_11.780__11.712__delay:		DELAY 11.780 11.712 ;
___10.831__delay:		DELAY  10.831 ;
_25.947__26.248__delay:		DELAY 25.947 26.248 ;
_25.684__25.882__delay:		DELAY 25.684 25.882 ;
_25.871__25.924__delay:		DELAY 25.871 25.924 ;
_26.279__26.487__delay:		DELAY 26.279 26.487 ;
_25.769__25.790__delay:		DELAY 25.769 25.790 ;
_26.315__26.474__delay:		DELAY 26.315 26.474 ;
_25.958__26.075__delay:		DELAY 25.958 26.075 ;
_26.222__26.367__delay:		DELAY 26.222 26.367 ;
_25.583__25.430__delay:		DELAY 25.583 25.430 ;
_23.846__23.744__delay:		DELAY 23.846 23.744 ;
_21.101__21.041__delay:		DELAY 21.101 21.041 ;
_18.603__18.528__delay:		DELAY 18.603 18.528 ;
_15.544__15.222__delay:		DELAY 15.544 15.222 ;
_12.114__12.253__delay:		DELAY 12.114 12.253 ;
___10.941__delay:		DELAY  10.941 ;
___10.978__delay:		DELAY  10.978 ;
_26.456__26.757__delay:		DELAY 26.456 26.757 ;
_26.193__26.391__delay:		DELAY 26.193 26.391 ;
_26.380__26.433__delay:		DELAY 26.380 26.433 ;
_26.788__26.996__delay:		DELAY 26.788 26.996 ;
_26.278__26.299__delay:		DELAY 26.278 26.299 ;
_26.824__26.983__delay:		DELAY 26.824 26.983 ;
_26.467__26.584__delay:		DELAY 26.467 26.584 ;
_26.731__26.876__delay:		DELAY 26.731 26.876 ;

ENDMODEL
