module jdc;
  reg clock1,clock2,reset;
  wire [9:0]q;
  JDC uut(q,clock1,clock2,reset);
  initial begin
    clock1=0;
    forever #10 clock1=~clock1;
  end
  initial begin
    clock2=0;
    forever #215 clock2=~clock2;
  end
  initial begin
    reset=1;
    #30
    reset=0;
    #300
    $finish;
  end
endmodule
