always_ff @ (posedge clk, negedge rst)
  if(!rst)
    dat <= P_INI_DAT;
  else
    if(clr)
      dat <= P_INI_DAT;
    else
      if(en)
        if(a)
          dat <= datA;
        else
          dat <= datB;
