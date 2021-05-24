`include "mem.v"

`include "seq001.v"

 module main(
      input en_write, en_read,clk,
      input [ram_width-1:0] data_in,
        input [addr_size-1 : 0]addr,
        output [ram_width-1:0] data_out, 
        output sequence_found );


 parameter ram_width = 8,
          addr_size = 5,
          ram_depth = 256 ;


    ram_single_port rth(en_write, en_read,clk,data_in,addr,data_out,dout );

    FSM3state dfr(dout,clk, en_read,sequence_found); 


 endmodule
          
           