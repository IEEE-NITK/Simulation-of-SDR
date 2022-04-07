// Code your testbench here
// or browse Examples

`timescale 1ps/1ps

module tb;  //Testbench
  //declaring variables
  parameter d_len = 32;
  reg clk;
  reg[d_len:0] l_in3, l_in2, l_in1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1;
  wire[d_len:0] l_out3, l_out2, l_out1;
  wire[2*d_len:0] u_out3, u_out2, u_out1;
  reg d1, d2, d3;
  integer fd;
  
  //module instantiation
  controllerTransmitter test(l_out3, l_out2, l_out1, l_in3, l_in2, l_in1, d1, d2, d3, u_out3, u_out2, u_out1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1, clk);
  
  initial begin
    //initially data is there for all lisenced part
    d1 = 1; 
  	d2 = 1;
  	d3 = 1;
    //generate random values for inputs
    {l_in3, l_in2, l_in1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1} = $random;
    //For testing lisenced data in band 1 is stopped, you can check with different cases
    #205 d1 = 0; 
    #325;
    //Generated file with outputs that we can use later for transmission
    fd = $fopen("final.bin", "wb"); 
    $fwriteb(fd, u_out3, u_out2, u_out1, u_in6, u_in5, u_in4, u_in3, u_in2, u_in1);
    $fclose(fd); 
    $finish;
  end
  
  initial 
    $monitor("u_in1 = %b, u_in2 = %b, u_out1 = %b, l_in1 = %b, l_out1 = %b", u_in1, u_in2, u_out1, l_in1, l_out1);
  
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end
endmodule