module Mux3to1( data0_i, data1_i, data2_i, select_i, data_o );

parameter size = 16;			   
			
//I/O ports               
input wire	[size-1:0] data0_i;          
input wire	[size-1:0] data1_i;
input wire	[size-1:0] data2_i;
input wire	[2-1:0] select_i;
output wire	[size-1:0] data_o; 

//Main function
assign data_o = ( select_i == 2'b00 ) ? data0_i :
                ( select_i == 2'b01 ) ? data1_i :
                ( select_i == 2'b10 ) ? data2_i :
                16'bxxxxxxxxxxxxxxxx;

endmodule      
