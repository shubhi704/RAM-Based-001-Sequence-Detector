

module RAM_test;
 wire sequence_found;
 reg [addr_size-1 : 0]addr;
 wire [ram_width-1:0] data_out; 
 reg [ram_width-1:0] data_in;
 reg en_write, en_read,clk ;

integer k,myseed;
main rtg(en_write, en_read,clk,data_in,addr, data_out,sequence_found );

parameter ram_width = 8,
          addr_size = 5,
          ram_depth = 256 ;
 initial
  begin
   clk = 0;
   forever #1 clk = ~clk ;
  end

 initial
   begin
     for(k=0; k<= 31; k=k+1)
         begin
            data_in = (k)%256;
            addr = (k)%256;
            en_write =1;  en_read=0; #2;
        end
   repeat(20)
      begin
       #2 addr = {$random} ;
       en_write =0; en_read=1;
       $strobe("address: %5d, data: %4d",addr,data_in);
      end
       #20 $finish;
   end
initial myseed = 35;

initial 
 begin
  $dumpfile("sm.vcd");
  $dumpvars;
  
 end
endmodule
