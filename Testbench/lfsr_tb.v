module lfsr_tb();
  reg clock,reset,enable,seedload,polyload;
  wire dout;
  reg [7:0]seed;
  reg [7:0]poly;
  wire [7:0]state;
  
  LFSR uut(state,dout,clock,reset,enable,seed,seedload,poly,polyload);
    
  initial begin
    clock=0;
    forever #5 clock=~clock;
  end
  
  initial begin
    seed=0;poly=0;reset=1;enable=0;
    seedload=0;polyload=0;
    
    repeat (2) @(posedge clock);
    reset = 0;
    
    // load seed
	seed =8'h01;
    seedload = 1;
    @(posedge clock);
    seedload = 0;
    
    // load polynomial
    
	poly = 8'hB8;     // taps [7,5,4,3]
    polyload = 1;
    @(posedge clock);
    polyload = 0;
    
    // evaluate feedback
    enable = 1;
    repeat (10) @(posedge clock);
    
    // hold state
    enable = 0;
    repeat (5) @(posedge clock);
    
    // re renable
    enable = 1;
    repeat (10) @(posedge clock);
    
  end
endmodule