#include<stdio.h>
#include<stdlib.h>
#include <stdint.h>

#include "sprite.c"



/*                   MIF format 
DEPTH = 32; % Memory depth and width are required %
 	% DEPTH is the number of addresses %
WIDTH = 14; % WIDTH is the number of bits of data per word %
			% DEPTH and WIDTH should be entered as decimal numbers %
ADDRESS_RADIX = DEC; % Address and value radixes are required %
DATA_RADIX = DEC; % Enter BIN, DEC, HEX, OCT, or UNS; unless %
 				  % otherwise specified, radixes = HEX %

% -- Specify values for addresses, which can be single address or range

CONTENT
BEGIN
[0..F]: 3FFF; % Range--Every address from 0 to F = 3FFF %
6 : F; % Single address--Address 6 = F %
8 : F E 5; % Range starting from specific address %
-- % Addr[8] = F, Addr[9] = E, Addr[A] = 5 %
END; */

int main(int argc, char const *argv[])
{
	int num;
	FILE *fptr;
	char * out_file = "sprite.mif";
	fptr = fopen(out_file,"w");
	if(fptr == NULL)
	{
	  printf("Error creating file!");   
	  exit(1);             
	}
	//print header
	fprintf(fptr,"DEPTH = %d; \n",SPRITE_FRAME_WIDTH * SPRITE_FRAME_HEIGHT);
	fprintf(fptr,"WIDTH = %d; \n",SPRITE_COLORS);
	fprintf(fptr,"ADDRESS_RADIX = DEC;\n");
	fprintf(fptr,"DATA_RADIX = DEC; \n");
	fprintf(fptr,"CONTENT \nBEGIN \n");
    
	unsigned char data;
	//assemble mif file with data
	for (int i = 0; i < SPRITE_FRAME_WIDTH * SPRITE_FRAME_HEIGHT; ++i){
		data = sprite_data[i];
		fprintf(fptr,"%d :\t%u;\n",i, data);
	}
	fprintf(fptr,"END;\n");
	fclose(fptr);

	return 0;
}