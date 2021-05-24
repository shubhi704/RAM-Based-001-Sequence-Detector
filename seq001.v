

`timescale 1ns/1ns

//001 sequence

module FSM3state(
     input in,clk,rst,
     output reg sequence_found );
 
  reg [1:0]present_state,next_state;
  parameter state0 = 2'd0, state1 = 2'd1, state2 = 2'd2 ; 
   always @(posedge clk)
     begin
      if(!rst)
       present_state <= state0;
     else
       present_state <= next_state ;
     end
 
  always @(present_state,in)
   begin
     case(present_state) 
       state0: begin
                sequence_found = 0;
                next_state = in ? state0 : state1 ; end

       state1: begin
                sequence_found = 0;
                next_state = in ? state0 : state2 ; end
 
       state2: begin
                sequence_found = in ? 1 : 0 ;
                next_state = in ? state0 : state2; end

      default: next_state =  state0 ;
     endcase
    end

endmodule