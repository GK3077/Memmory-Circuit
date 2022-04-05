module Assignment_tb();
reg [1:0] sel;
reg [5:0] memin;
reg clk,ld;
wire [5:0] memout;
Assignment uut(sel,memin,memout,clk,ld);
initial
begin
clk =0;
forever #50 clk =~clk;
end
initial 
begin
ld = 1; sel = 0; memin = 3;
#300 ld =1; sel =1; memin = 4;
#300 ld =1; sel =2; memin = 5;
#300 ld =1; sel =3; memin = 6; 
#300 ld =1; sel =1; memin = 5;
#300 ld =1; sel =2; memin = 2;
#300 ld =1; sel =0; memin = 1;
end
endmodule
