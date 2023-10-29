module am_comp_ohot_mux #(
    parameter type      DTYPE       = logic [7:0],
    parameter           SEL_WIDTH   = 8
)
(
    // Input
    input  logic [SEL_WIDTH-1:0]        sel,
    input  DTYPE [SEL_WIDTH-1:0]        in,

    // Output
    output DTYPE                        out
);
...
endmodule
