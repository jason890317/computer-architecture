module Shift_Left_one( data_i, data_o );

//I/O ports                    
input  [16-1:0] data_i;
output [16-1:0] data_o;
wire   [16-1:0] data_o;

//shift left
assign data_o = data_i << 1 ;

endmodule
