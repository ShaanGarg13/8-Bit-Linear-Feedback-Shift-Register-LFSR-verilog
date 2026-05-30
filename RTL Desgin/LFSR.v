module LFSR(state,dout,clock,reset,enable,seed,seedload,poly,polyload);
  output wire dout;
  output [7:0]state;
  input clock,reset,enable,seedload,polyload;
  input [7:0]seed;
  input [7:0]poly;
  
  reg [7:0]poly_reg;
  //reg dout;
  integer i;
  reg [7:0] next_state;
  reg feedback;
  
  always @(posedge clock)
    begin
      if (reset==1)
        begin
          poly_reg <= 8'b0; 
        end
      else if (polyload==1)
        begin
          poly_reg <= poly;
        end
    end
  
  always @(*)
    begin
      feedback=0;
      for(i=1;i<8;i=i+1)
        begin
          if(poly_reg[i]==1)
            begin
              feedback = feedback^state[i];
            end
        end
    end
  
  assign dout=feedback;
         
  always @(*)
    begin
      if (seedload) 
        begin
          next_state = seed;
        end
      else if (enable==1)
        begin
          next_state[7] = state[6];
          next_state[6] = state[5];
          next_state[5] = state[4];
          next_state[4] = state[3];
          next_state[3] = state[2];
          next_state[2] = state[1];
          next_state[1] = state[0];
          next_state[0] = feedback;
        end
      else 
        begin
          next_state = state;
        end
    end
    
  DFF d1(state[0],next_state[0],clock,reset);
  DFF d2(state[1],next_state[1],clock,reset);
  DFF d3(state[2],next_state[2],clock,reset);
  DFF d4(state[3],next_state[3],clock,reset);
  DFF d5(state[4],next_state[4],clock,reset);
  DFF d6(state[5],next_state[5],clock,reset);
  DFF d7(state[6],next_state[6],clock,reset);
  DFF d8(state[7],next_state[7],clock,reset);

endmodule
  

module DFF(q,d,clock,reset);
  input d,clock,reset;
  output reg q;
  always @(posedge clock)
    begin
      if (reset==1)
        begin
          q<=0;
        end
      else
        begin
          q<=d;
        end
    end
endmodule
