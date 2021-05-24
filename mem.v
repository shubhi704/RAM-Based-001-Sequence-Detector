module ram_single_port(
        input en_write, en_read,clk,
        input [ram_width-1:0] data_in,
        input [addr_size-1 : 0]addr,
        output [ram_width-1:0] data_out, 
        output dout );

 reg [ram_width-1:0]  reg_addr;

 reg [ram_width-1:0] mem [0 : ram_depth-1] ;  

parameter ram_width = 8,
          addr_size = 5,
          ram_depth = 256 ;

assign data_out  = mem[reg_addr];
assign dout =  mem[reg_addr][3] ; 
  always @(posedge clk)
    begin
      if(en_write)
        mem[addr] <= data_in;
       else if(en_read)
         reg_addr <= addr ;
       else
         $strobe("No operation");

     end
endmodule
         