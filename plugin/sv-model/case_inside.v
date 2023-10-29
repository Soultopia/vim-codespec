always_comb begin
  case(in) inside
    8'bxxxx_xxx1: out = 3'h0; 
    8'bxxxx_xx10: out = 3'h1; 
    8'bxxxx_x100: out = 3'h2; 
    8'bxxxx_1000: out = 3'h3; 
    8'bxxx1_0000: out = 3'h4; 
    8'bxx10_0000: out = 3'h5; 
    8'bx100_0000: out = 3'h6; 
    8'b1000_0000: out = 3'h7; 
    default:      out = 3'hx; 
  endcase
end
