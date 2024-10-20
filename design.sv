module ALU(
    input logic [31:0] a, b,
    input logic [2:0] f,
    output logic [31:0] y,
    output logic z
);
    logic [31:0] b_mux;          
    logic [31:0] add_sub_result; 
    logic [31:0] and_result, or_result;
    logic signed [31:0] signed_a, signed_b;
    logic [31:0] slt_result;     
    logic carry_in;

    assign signed_a = a;
    assign signed_b = b;
    assign b_mux = (f[2]) ? ~b : b;
    assign carry_in = f[2]; 
    assign add_sub_result = a + b_mux + carry_in; 
    assign and_result = a & b;
    assign or_result = a | b;
    assign slt_result = (signed_a < signed_b) ? 32'd1 : 32'd0;
  
    always_comb begin
        case (f[1:0])
            2'b00: y = and_result;        
            2'b01: y = or_result;         
            2'b10: y = add_sub_result;    
            2'b11: y = slt_result;        
            default: y = 32'b0;
        endcase
    end

    assign z = (y == 32'b0);

endmodule
