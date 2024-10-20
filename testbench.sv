module ALU_tb;
    
    reg [31:0] a, b;       
    reg [2:0] f;           
    wire [31:0] y;        
    wire z;                

    
    ALU uut (
        .a(a),
        .b(b),
        .f(f),
        .y(y),
        .z(z)
    );

    
    initial begin
        
        $monitor("Time=%0t | f=%b | a=%h, b=%h | y=%h, z=%b", 
                 $time, f, a, b, y, z);

        
        f = 3'b010;
        a = 32'h00000000; b = 32'h00000000; #10; // ADD 0 + 0
        a = 32'h00000000; b = 32'hFFFFFFFF; #10; // ADD 0 + (-1)
        a = 32'h00000001; b = 32'hFFFFFFFF; #10; // ADD 1 + (-1)
        a = 32'h000000FF; b = 32'h00000001; #10; // ADD FF + 1

       
        f = 3'b110;
        a = 32'h00000000; b = 32'h00000000; #10; // SUB 0 - 0
        a = 32'h00000000; b = 32'hFFFFFFFF; #10; // SUB 0 - (-1)
        a = 32'h00000001; b = 32'h00000001; #10; // SUB 1 - 1
        a = 32'h00000100; b = 32'h00000001; #10; // SUB 100 - 1

       
        f = 3'b111;
        a = 32'h00000000; b = 32'h00000000; #10; // SLT 0, 0
        a = 32'h00000000; b = 32'h00000001; #10; // SLT 0, 1
        a = 32'h00000000; b = 32'hFFFFFFFF; #10; // SLT 0, -1
        a = 32'h00000001; b = 32'h00000000; #10; // SLT 1, 0
        a = 32'hFFFFFFFF; b = 32'h00000000; #10; // SLT -1, 0

        
        f = 3'b000;
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; #10; // AND FFFFFFFF, FFFFFFFF
        a = 32'hFFFFFFFF; b = 32'h12345678; #10; // AND FFFFFFFF, 12345678
        a = 32'h12345678; b = 32'h87654321; #10; // AND 12345678, 87654321
        a = 32'h00000000; b = 32'hFFFFFFFF; #10; // AND 00000000, FFFFFFFF

        
        f = 3'b001;
        a = 32'hFFFFFFFF; b = 32'hFFFFFFFF; #10; // OR FFFFFFFF, FFFFFFFF
        a = 32'h12345678; b = 32'h87654321; #10; // OR 12345678, 87654321
        a = 32'h00000000; b = 32'hFFFFFFFF; #10; // OR 00000000, FFFFFFFF
        a = 32'h00000000; b = 32'h00000000; #10; // OR 00000000, 00000000

        
        $stop;
    end
endmodule
