// Code your design here

`timescale 1ps/1ps

module controllerTransmitter(l_out3, l_out2, l_out1, l_in3, l_in2, l_in1, d1, d2, d3, u_out3, u_out2, u_out1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1, clk);
  parameter d_len = 32; //length of input in bits
  input wire[d_len:0] l_in3, l_in2, l_in1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1; //l_in are the inputs given to lisenced part, u_in are given to unlisenced
  input wire d1, d2, d3;  // These are the control bits, if 1 then there data present in lisensed band, if 0 then data is not there and we can allocate a signal from unlisenced input here.
  output reg[d_len:0] l_out3, l_out2, l_out1; //outputs of lisenced parts
  output reg[2*d_len:0] u_out3, u_out2, u_out1; //output of unlisenced parts
  input clk; //clock input
  
  integer i1 = 0, j1 = 0, k1 = 0, i2 = 0, j2 = 0, k2 = 0, i3 = 0, j3 = 0, k3 = 0; //variables to control loop
  always@(posedge clk) begin            //At every clock edge till parameter j = d_len check if data is there in lisenced part, if it is allocate lisenced input to lisenced output and multiplex two unlisecensed inputs and allocate to one output. (muxing of 1 and 2 goes to output , muxing of 3 and 4 goes to output 2 and so on for unlisenced and as the numbers are for lisenced)
    if(j1<d_len) begin
      if(d1) begin
  		l_out1[j1] = l_in1[k1];
  		u_out1[i1] = u_in1[k1];
  		i1=i1+1;
  		u_out1[i1] = u_in2[k1];
  		i1=i1+1;
  		j1=j1+1;
  		k1=k1+1;
      end
      if(!d1) begin
  		l_out1[j1] = u_in2[k1];
  		u_out1[i1] = u_in1[k1];
  		k1=k1+1;
  		j1=j1+1;
  		i1=i1+1;
      end
  	end
    if(j2<d_len) begin
      if(d2) begin
        l_out2[j2] = l_in2[k2];
        u_out2[i2] = u_in3[k2];
  		i2=i2+1;
        u_out2[i1] = u_in4[k2];
  		i2=i2+1;
  		j2=j2+1;
  		k2=k2+1;
      end
      else if(!d2) begin
        l_out2[j2] = u_in4[k2];
        u_out2[i1] = u_in3[k2];
  		k2=k2+1;
  		j2=j2+1;
  		i2=i2+1;
      end
  	end
    if(j3<d_len) begin
      if(d3) begin
        l_out3[j3] = l_in3[k3];
        u_out3[i3] = u_in5[k3];
  		i3=i3+1;
        u_out3[i3] = u_in6[k3];
  		i3=i3+1;
  		j3=j3+1;
  		k3=k3+1;
      end
      else if(!d3) begin
        l_out3[j3] = u_in6[k3];
        u_out3[i3] = u_in5[k3];
  		k3=k3+1;
  		j3=j3+1;
  		i3=i3+1;
      end
  	end
  end
endmodule