`timescale 1 ns/10 ps

module mux_tb;
  
  localparam WIDTH=8; //changing WIDTH
  
  logic [WIDTH-1:0] out;    
  logic [WIDTH-1:0] input_a;   
  logic [WIDTH-1:0] input_b;    
  logic             sel; 
  
  logic [WIDTH-1:0]correct_out;
  
  // Instantiate mux
  Mux #(WIDTH) mux2x1 (.*);
  
  initial begin
    
    $monitor("[%0t] sel= 0x%0h, input_a= 0x%0h, input_b= 0x%0h and output= 0x%0h ", $time,sel,input_a,input_b, out);
    
    sel<=0;
    input_a<=$random; //random input values
    input_b<=$random;
    correct_out = sel ? input_b : input_a; 
    
    if(out!=correct_out)begin
      $display("ERROR at time %0t: 0x%0h instead of 0x%0h.", $realtime, correct_out, out);
    end
    #100 $finish;
  end
  
  always #5 sel=~sel;

endmodule
    
    
    
    
