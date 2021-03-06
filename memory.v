//Buffer
module Buff(y,x,op);
input y;
input [5:0] x;
output reg [5:0] op;
always@(y)
if(y == 1)
assign op =x;
endmodule

// 2*4 Decoder
module Dec(a,y);
input [1:0] a;
output  [3:0]y;
assign y[0] = (~a[1])&(~a[0]);
assign y[1] = (~a[1])&(a[0]);
assign y[2] = (a[1])&(~a[0]);
assign y[3] = (a[1])&(a[0]); 
endmodule

//Register
module Register(ld,clk,in,x);
input ld,clk;
input [5:0]in;
output  reg [5:0]x;
always@(posedge clk)
if (ld ==1)
assign x = in;
endmodule

//Main Module
module Assignment(sel,memin,memout,clk,ld);
input[1:0] sel;
input [5:0] memin;
input clk,ld;
output  [5:0] memout;
wire [3:0]y;
wire ald,bld,cld,dld;
wire [5:0] a,b,c,d, aout,bout,cout,dout;
Dec  dc(sel,y);
and(ald,y[0],ld);
and(bld,y[1],ld);
and(cld,y[2],ld);
and(dld,y[3],ld);
Register ra(ald,clk,memin,a);
Register rb(bld,clk,memin,b);
Register rc(cld,clk,memin,c);
Register rd(dld,clk,memin,d);
Buff ba(y[0],a,aout);
Buff bb(y[1],b,bout);
Buff bc(y[2],c,cout);
Buff bd(y[3],d,dout);
assign memout = (aout | bout )|( cout | dout);
endmodule
