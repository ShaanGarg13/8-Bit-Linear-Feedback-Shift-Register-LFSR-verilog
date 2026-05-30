module JDC(q,clock1,clock2,reset);
  input clock1,clock2,reset;
  output [9:0]q;
  
  wire [4:0]dq;
  wire [4:0]dqbar;
  wire w1,w2;
  
  assign w1 = clock1 & (~clock2);
  assign w2 = (dq[0] | dq[2]) & dq[1];
  
  DFF d1(dq[0],dqbar[0],dqbar[4],w1,reset);
  DFF d2(dq[1],dqbar[1],dq[0],w1,reset);
  DFF d3(dq[2],dqbar[2],w2,w1,reset);
  DFF d4(dq[3],dqbar[3],dq[2],w1,reset);
  DFF d5(dq[4],dqbar[4],dq[3],w1,reset);
  
  assign q[0] = ~(dq[4] | dq[0]);
  assign q[1] = ~(dq[1] | dqbar[0]);
  assign q[2] = ~(dq[2] | dqbar[1]);
  assign q[3] = ~(dq[3] | dqbar[2]);
  assign q[4] = ~(dq[4] | dqbar[3]);
  assign q[5] = ~(dqbar[4] | dqbar[0]);
  assign q[6] = ~(dq[0] | dqbar[1]);
  assign q[7] = ~(dq[1] | dqbar[2]);  
  assign q[8] = ~(dq[2] | dqbar[3]); 
  assign q[9] = ~(dq[3] | dqbar[4]);
  
endmodule

module DFF(q,qbar,d,clock,reset);
  input d,clock,reset;
  output reg q;
  output wire qbar;
  always @(posedge clock or posedge reset)
    begin
      if(reset==1)
        q<=0;
      else
        q<=d;
    end
  assign qbar=~q;
endmodule