generate
  if (TX_SYNC_STAGE == 2) begin: TX_SYNC_2STAGE
    for (genvar BitID=0; BitID<FIFO_ADDR; BitID++) begin: GEN_RPTR_SYNC_2STAGE
      ali_syncr_2 FIFO_R_PTR_D_SYNC_u (.clk(clk_tx), .rst_n(resetn_tx),
                                       .async_i(rptr_gray_rx[BitID]), .sync_o(rptr_gray_tx[BitID]),
                                       .si(1'b0), .se(1'b0));
    end
  end
  else begin: TX_SYNC_3STAGE
    for (genvar BitID=0; BitID<FIFO_ADDR; BitID++) begin: GEN_RPTR_SYNC_3STAGE
      ali_syncr_3 FIFO_R_PTR_D_SYNC_u (.clk(clk_tx), .rst_n(resetn_tx),
                                       .async_i(rptr_gray_rx[BitID]), .sync_o(rptr_gray_tx[BitID]),
                                       .si(1'b0), .se(1'b0));
    end
  end
endgenerate
