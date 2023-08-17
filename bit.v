//сумматор 4х разрядных
module bit(
  input A,
  input B,
  input C_i,
  output reg S,
  output reg C_o
  );
  always @(*) begin
    S=A^B^C_i;
    C_o=(A&B)|(B&C_i)|(C_i&A);
  end
endmodule

module adder(
  input [3:0] A,
  input [3:0] B,
  output [3:0] S,
  output  C
);
assign A = 4'b0101 ;
assign B = 4'b0110 ;
wire [2:0] cr;
 
//always @(*)
//begin 
    bit bit1 (.A(A[0]),.B(B[0]),.C_i(1'b0),.S(S[0]),.C_o(cr[0]));
    bit bit2 (.A(A[1]),.B(B[1]),.C_i(cr[0]),.S(S[1]),.C_o(cr[1]));
    bit bit3 (.A(A[2]),.B(B[2]),.C_i(cr[1]),.S(S[2]),.C_o(cr[2]));
    bit bit4 (.A(A[3]),.B(B[3]),.C_i(cr[2]),.S(S[3]),.C_o(C)) ;
//end
/*
endmodule

module btest;
reg [3:0] A,B,S;
reg C;
initial begin
 #10 A = 4'b0101 ;
 #10 B = 4'b0110;
end
adder I (A,B,S,C);

*/
initial begin
$monitor ("S=%b,C=%b",S[3:0],C);
//$monitor ("C=%b",C);
end
endmodule