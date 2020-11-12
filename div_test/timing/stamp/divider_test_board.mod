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
 with speed grade 8_H7, core voltage 1.1V, and temperature 85 Celsius

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
_24.683__24.513__delay:		DELAY 24.683 24.513 ;
_23.075__22.988__delay:		DELAY 23.075 22.988 ;
_20.616__20.585__delay:		DELAY 20.616 20.585 ;
_18.242__18.162__delay:		DELAY 18.242 18.162 ;
_15.293__14.980__delay:		DELAY 15.293 14.980 ;
_12.236__11.989__delay:		DELAY 12.236 11.989 ;
_10.812__delay:		DELAY 10.812  ;
_11.013__delay:		DELAY 11.013  ;
_25.656__25.844__delay:		DELAY 25.656 25.844 ;
_25.276__25.449__delay:		DELAY 25.276 25.449 ;
_25.369__25.434__delay:		DELAY 25.369 25.434 ;
_25.808__26.035__delay:		DELAY 25.808 26.035 ;
_25.269__25.291__delay:		DELAY 25.269 25.291 ;
_25.862__25.998__delay:		DELAY 25.862 25.998 ;
_25.470__25.616__delay:		DELAY 25.470 25.616 ;
_25.746__25.894__delay:		DELAY 25.746 25.894 ;
_24.758__24.588__delay:		DELAY 24.758 24.588 ;
_23.150__23.063__delay:		DELAY 23.150 23.063 ;
_20.691__20.660__delay:		DELAY 20.691 20.660 ;
_18.317__18.237__delay:		DELAY 18.317 18.237 ;
_15.368__15.055__delay:		DELAY 15.368 15.055 ;
_12.259__12.175__delay:		DELAY 12.259 12.175 ;
_11.212__delay:		DELAY 11.212  ;
_11.487__delay:		DELAY 11.487  ;
_25.731__25.919__delay:		DELAY 25.731 25.919 ;
_25.351__25.524__delay:		DELAY 25.351 25.524 ;
_25.444__25.509__delay:		DELAY 25.444 25.509 ;
_25.883__26.110__delay:		DELAY 25.883 26.110 ;
_25.344__25.366__delay:		DELAY 25.344 25.366 ;
_25.937__26.073__delay:		DELAY 25.937 26.073 ;
_25.545__25.691__delay:		DELAY 25.545 25.691 ;
_25.821__25.969__delay:		DELAY 25.821 25.969 ;
_28.602__28.432__delay:		DELAY 28.602 28.432 ;
_26.994__26.907__delay:		DELAY 26.994 26.907 ;
_24.535__24.504__delay:		DELAY 24.535 24.504 ;
_22.161__22.081__delay:		DELAY 22.161 22.081 ;
_19.212__18.899__delay:		DELAY 19.212 18.899 ;
_14.179__16.019__delay:		DELAY 14.179 16.019 ;
_14.932__delay:		DELAY 14.932  ;
_14.873__delay:		DELAY 14.873  ;
_29.575__29.763__delay:		DELAY 29.575 29.763 ;
_29.195__29.368__delay:		DELAY 29.195 29.368 ;
_29.288__29.353__delay:		DELAY 29.288 29.353 ;
_29.727__29.954__delay:		DELAY 29.727 29.954 ;
_29.188__29.210__delay:		DELAY 29.188 29.210 ;
_29.781__29.917__delay:		DELAY 29.781 29.917 ;
_29.389__29.535__delay:		DELAY 29.389 29.535 ;
_29.665__29.813__delay:		DELAY 29.665 29.813 ;
_28.792__28.622__delay:		DELAY 28.792 28.622 ;
_27.184__27.097__delay:		DELAY 27.184 27.097 ;
_24.725__24.694__delay:		DELAY 24.725 24.694 ;
_22.351__22.271__delay:		DELAY 22.351 22.271 ;
_19.402__19.089__delay:		DELAY 19.402 19.089 ;
_14.385__16.209__delay:		DELAY 14.385 16.209 ;
_15.122__delay:		DELAY 15.122  ;
_15.063__delay:		DELAY 15.063  ;
_29.765__29.953__delay:		DELAY 29.765 29.953 ;
_29.385__29.558__delay:		DELAY 29.385 29.558 ;
_29.478__29.543__delay:		DELAY 29.478 29.543 ;
_29.917__30.144__delay:		DELAY 29.917 30.144 ;
_29.378__29.400__delay:		DELAY 29.378 29.400 ;
_29.971__30.107__delay:		DELAY 29.971 30.107 ;
_29.579__29.725__delay:		DELAY 29.579 29.725 ;
_29.855__30.003__delay:		DELAY 29.855 30.003 ;
_28.461__28.291__delay:		DELAY 28.461 28.291 ;
_26.853__26.766__delay:		DELAY 26.853 26.766 ;
_24.394__24.363__delay:		DELAY 24.394 24.363 ;
_22.020__21.940__delay:		DELAY 22.020 21.940 ;
_19.071__18.758__delay:		DELAY 19.071 18.758 ;
_15.191__15.878__delay:		DELAY 15.191 15.878 ;
_14.791__delay:		DELAY 14.791  ;
_14.732__delay:		DELAY 14.732  ;
_29.434__29.622__delay:		DELAY 29.434 29.622 ;
_29.054__29.227__delay:		DELAY 29.054 29.227 ;
_29.147__29.212__delay:		DELAY 29.147 29.212 ;
_29.586__29.813__delay:		DELAY 29.586 29.813 ;
_29.047__29.069__delay:		DELAY 29.047 29.069 ;
_29.640__29.776__delay:		DELAY 29.640 29.776 ;
_29.248__29.394__delay:		DELAY 29.248 29.394 ;
_29.524__29.672__delay:		DELAY 29.524 29.672 ;
_28.087__27.917__delay:		DELAY 28.087 27.917 ;
_26.479__26.392__delay:		DELAY 26.479 26.392 ;
_24.020__23.989__delay:		DELAY 24.020 23.989 ;
_21.646__21.566__delay:		DELAY 21.646 21.566 ;
_18.697__18.384__delay:		DELAY 18.697 18.384 ;
_14.819__15.504__delay:		DELAY 14.819 15.504 ;
_14.417__delay:		DELAY 14.417  ;
_14.358__delay:		DELAY 14.358  ;
_29.060__29.248__delay:		DELAY 29.060 29.248 ;
_28.680__28.853__delay:		DELAY 28.680 28.853 ;
_28.773__28.838__delay:		DELAY 28.773 28.838 ;
_29.212__29.439__delay:		DELAY 29.212 29.439 ;
_28.673__28.695__delay:		DELAY 28.673 28.695 ;
_29.266__29.402__delay:		DELAY 29.266 29.402 ;
_28.874__29.020__delay:		DELAY 28.874 29.020 ;
_29.150__29.298__delay:		DELAY 29.150 29.298 ;
_26.171__26.001__delay:		DELAY 26.171 26.001 ;
_24.563__24.476__delay:		DELAY 24.563 24.476 ;
_22.104__22.073__delay:		DELAY 22.104 22.073 ;
_19.730__19.650__delay:		DELAY 19.730 19.650 ;
_16.781__16.468__delay:		DELAY 16.781 16.468 ;
_12.893__13.588__delay:		DELAY 12.893 13.588 ;
_12.501__delay:		DELAY 12.501  ;
_12.442__delay:		DELAY 12.442  ;
_27.144__27.332__delay:		DELAY 27.144 27.332 ;
_26.764__26.937__delay:		DELAY 26.764 26.937 ;
_26.857__26.922__delay:		DELAY 26.857 26.922 ;
_27.296__27.523__delay:		DELAY 27.296 27.523 ;
_26.757__26.779__delay:		DELAY 26.757 26.779 ;
_27.350__27.486__delay:		DELAY 27.350 27.486 ;
_26.958__27.104__delay:		DELAY 26.958 27.104 ;
_27.234__27.382__delay:		DELAY 27.234 27.382 ;
_28.313__28.143__delay:		DELAY 28.313 28.143 ;
_26.705__26.618__delay:		DELAY 26.705 26.618 ;
_24.246__24.215__delay:		DELAY 24.246 24.215 ;
_21.872__21.792__delay:		DELAY 21.872 21.792 ;
_18.923__18.610__delay:		DELAY 18.923 18.610 ;
_15.031__15.730__delay:		DELAY 15.031 15.730 ;
_14.643__delay:		DELAY 14.643  ;
_14.584__delay:		DELAY 14.584  ;
_29.286__29.474__delay:		DELAY 29.286 29.474 ;
_28.906__29.079__delay:		DELAY 28.906 29.079 ;
_28.999__29.064__delay:		DELAY 28.999 29.064 ;
_29.438__29.665__delay:		DELAY 29.438 29.665 ;
_28.899__28.921__delay:		DELAY 28.899 28.921 ;
_29.492__29.628__delay:		DELAY 29.492 29.628 ;
_29.100__29.246__delay:		DELAY 29.100 29.246 ;
_29.376__29.524__delay:		DELAY 29.376 29.524 ;
_14.029__13.859__delay:		DELAY 14.029 13.859 ;
_15.002__15.190__delay:		DELAY 15.002 15.190 ;
_14.842__15.019__delay:		DELAY 14.842 15.019 ;
_14.715__14.780__delay:		DELAY 14.715 14.780 ;
_15.154__15.381__delay:		DELAY 15.154 15.381 ;
_14.615__14.637__delay:		DELAY 14.615 14.637 ;
_15.208__15.344__delay:		DELAY 15.208 15.344 ;
_14.816__14.962__delay:		DELAY 14.816 14.962 ;
_15.092__15.240__delay:		DELAY 15.092 15.240 ;
_17.022__16.852__delay:		DELAY 17.022 16.852 ;
_15.398__15.299__delay:		DELAY 15.398 15.299 ;
_17.995__18.183__delay:		DELAY 17.995 18.183 ;
_17.615__17.788__delay:		DELAY 17.615 17.788 ;
_17.708__17.773__delay:		DELAY 17.708 17.773 ;
_18.147__18.374__delay:		DELAY 18.147 18.374 ;
_17.608__17.630__delay:		DELAY 17.608 17.630 ;
_18.201__18.337__delay:		DELAY 18.201 18.337 ;
_17.809__17.955__delay:		DELAY 17.809 17.955 ;
_18.085__18.233__delay:		DELAY 18.085 18.233 ;
_16.465__16.295__delay:		DELAY 16.465 16.295 ;
_14.841__14.742__delay:		DELAY 14.841 14.742 ;
_12.506__12.475__delay:		DELAY 12.506 12.475 ;
_17.438__17.626__delay:		DELAY 17.438 17.626 ;
_17.058__17.231__delay:		DELAY 17.058 17.231 ;
_17.151__17.216__delay:		DELAY 17.151 17.216 ;
_17.590__17.817__delay:		DELAY 17.590 17.817 ;
_17.051__17.073__delay:		DELAY 17.051 17.073 ;
_17.644__17.780__delay:		DELAY 17.644 17.780 ;
_17.252__17.398__delay:		DELAY 17.252 17.398 ;
_17.528__17.676__delay:		DELAY 17.528 17.676 ;
_19.224__19.054__delay:		DELAY 19.224 19.054 ;
_17.616__17.529__delay:		DELAY 17.616 17.529 ;
_15.157__15.126__delay:		DELAY 15.157 15.126 ;
_12.770__12.703__delay:		DELAY 12.770 12.703 ;
_20.197__20.385__delay:		DELAY 20.197 20.385 ;
_19.817__19.990__delay:		DELAY 19.817 19.990 ;
_19.910__19.975__delay:		DELAY 19.910 19.975 ;
_20.349__20.576__delay:		DELAY 20.349 20.576 ;
_19.810__19.832__delay:		DELAY 19.810 19.832 ;
_20.403__20.539__delay:		DELAY 20.403 20.539 ;
_20.011__20.157__delay:		DELAY 20.011 20.157 ;
_20.287__20.435__delay:		DELAY 20.287 20.435 ;
_22.876__22.706__delay:		DELAY 22.876 22.706 ;
_21.268__21.181__delay:		DELAY 21.268 21.181 ;
_18.809__18.778__delay:		DELAY 18.809 18.778 ;
_16.435__16.355__delay:		DELAY 16.435 16.355 ;
_13.486__13.173__delay:		DELAY 13.486 13.173 ;
_23.849__24.037__delay:		DELAY 23.849 24.037 ;
_23.469__23.642__delay:		DELAY 23.469 23.642 ;
_23.562__23.627__delay:		DELAY 23.562 23.627 ;
_24.001__24.228__delay:		DELAY 24.001 24.228 ;
_23.462__23.484__delay:		DELAY 23.462 23.484 ;
_24.055__24.191__delay:		DELAY 24.055 24.191 ;
_23.663__23.809__delay:		DELAY 23.663 23.809 ;
_23.939__24.087__delay:		DELAY 23.939 24.087 ;
_23.532__23.362__delay:		DELAY 23.532 23.362 ;
_21.924__21.837__delay:		DELAY 21.924 21.837 ;
_19.465__19.434__delay:		DELAY 19.465 19.434 ;
_17.091__17.011__delay:		DELAY 17.091 17.011 ;
_14.142__13.829__delay:		DELAY 14.142 13.829 ;
___10.919__delay:		DELAY  10.919 ;
_24.505__24.693__delay:		DELAY 24.505 24.693 ;
_24.125__24.298__delay:		DELAY 24.125 24.298 ;
_24.218__24.283__delay:		DELAY 24.218 24.283 ;
_24.657__24.884__delay:		DELAY 24.657 24.884 ;
_24.118__24.140__delay:		DELAY 24.118 24.140 ;
_24.711__24.847__delay:		DELAY 24.711 24.847 ;
_24.319__24.465__delay:		DELAY 24.319 24.465 ;
_24.595__24.743__delay:		DELAY 24.595 24.743 ;
_24.471__24.301__delay:		DELAY 24.471 24.301 ;
_22.863__22.776__delay:		DELAY 22.863 22.776 ;
_20.404__20.373__delay:		DELAY 20.404 20.373 ;
_18.030__17.950__delay:		DELAY 18.030 17.950 ;
_15.081__14.768__delay:		DELAY 15.081 14.768 ;
_11.908__11.858__delay:		DELAY 11.908 11.858 ;
___11.088__delay:		DELAY  11.088 ;
_25.444__25.632__delay:		DELAY 25.444 25.632 ;
_25.064__25.237__delay:		DELAY 25.064 25.237 ;
_25.157__25.222__delay:		DELAY 25.157 25.222 ;
_25.596__25.823__delay:		DELAY 25.596 25.823 ;
_25.057__25.079__delay:		DELAY 25.057 25.079 ;
_25.650__25.786__delay:		DELAY 25.650 25.786 ;
_25.258__25.404__delay:		DELAY 25.258 25.404 ;
_25.534__25.682__delay:		DELAY 25.534 25.682 ;
_24.979__24.809__delay:		DELAY 24.979 24.809 ;
_23.371__23.284__delay:		DELAY 23.371 23.284 ;
_20.912__20.881__delay:		DELAY 20.912 20.881 ;
_18.538__18.458__delay:		DELAY 18.538 18.458 ;
_15.589__15.276__delay:		DELAY 15.589 15.276 ;
_12.326__12.396__delay:		DELAY 12.326 12.396 ;
___11.087__delay:		DELAY  11.087 ;
___11.227__delay:		DELAY  11.227 ;
_25.952__26.140__delay:		DELAY 25.952 26.140 ;
_25.572__25.745__delay:		DELAY 25.572 25.745 ;
_25.665__25.730__delay:		DELAY 25.665 25.730 ;
_26.104__26.331__delay:		DELAY 26.104 26.331 ;
_25.565__25.587__delay:		DELAY 25.565 25.587 ;
_26.158__26.294__delay:		DELAY 26.158 26.294 ;
_25.766__25.912__delay:		DELAY 25.766 25.912 ;
_26.042__26.190__delay:		DELAY 26.042 26.190 ;

ENDMODEL
