module Mux
  #(parameter WIDTH=2)
  (input logic [WIDTH-1:0]input_a, input logic [WIDTH-1:0]input_b, output logic [WIDTH-1:0]out, input logic sel);
  
always_comb
  begin
    unique case(sel) // using case
      1'b1: out=input_b;
      1'b0: out=input_a;
      default: out='x;
    endcase
  end
endmodule
