// Code your design here
module controllerReceiver(l_out3, l_out2, l_out1, l_in3, l_in2, l_in1, d1, d2, d3, u_out3, u_out2, u_out1, u_out6, u_out5, u_out4, u_in3, u_in2, u_in1, clk);
  parameter d_len = 99;
  input wire[d_len:0] l_in3, l_in2, l_in1;
  input wire[2*d_len:0] u_in3, u_in2, u_in1;
  input wire d1, d2, d3;
  output reg[d_len:0] l_out3, l_out2, l_out1;
  output reg[d_len:0] u_out6, u_out5, u_out4, u_out3, u_out2, u_out1;
  input wire clk;
  
  integer i1 = 0, j1 = 0, k1 = 0, i2 = 0, j2 = 0, k2 = 0, i3 = 0, j3 = 0, k3 = 0;
  always@(posedge clk) begin
    if(j1<d_len) begin
  		if(d1) begin
  			l_out1[j1] = l_in1[k1];
  			u_out1[i1] = u_in1[k1];
  			k1=k1+1;
      		u_out2[i1] = u_in1[k1];
  			i1=i1+1;
  			j1=j1+1;
  			k1=k1+1;
  		
  		end
  		else if(!d1) begin
      		l_out1[j1] = 0;
  			u_out1[i1] = u_in1[k1];
      		u_out2[i1] = l_in1[k1];
  			k1=k1+1;
  			j1=j1+1;
  			i1=i1+1;
  		end
    end
    if(j2<d_len) begin
      if(d2) begin
        l_out2[j2] = l_in2[k2];
        u_out3[i2] = u_in2[k2];
  		k2=k2+1;
        u_out4[i2] = u_in2[k2];
  		i2=i2+1;
  		j2=j2+1;
  		k2=k2+1;
      end
      else if(!d2) begin
        l_out2[j2] = 0;
        u_out3[i2] = u_in2[k1];
        u_out4[i2] = l_in2[k1];
  		k2=k2+1;
  		j2=j2+1;
  		i2=i2+1;
      end
    end
    if(j3<d_len) begin
      if(d3) begin
        l_out3[j3] = l_in3[k3];
        u_out5[i3] = u_in3[k3];
  		k3=k3+1;
        u_out6[i3] = u_in3[k3];
  		i3=i3+1;
  		j3=j3+1;
  		k3=k3+1;
      end
      else if(!d3) begin
        l_out3[j3] = 0;
        u_out5[i3] = u_in3[k3];
        u_out6[i3] = l_in3[k3];
  		k3=k3+1;
  		j3=j3+1;
  		i3=i3+1;
  		end
    end
  end
endmodule