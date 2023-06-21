module FIFO_TB();

parameter data_width = 8;

reg                   clk;
reg                   rst_n;
reg                   write_en; 
reg                   read_en;
reg  [data_width-1:0] data_in;

wire [data_width-1:0] data_out;
wire                  full; 
wire                  empty;

always #5 clk = ~clk;

initial begin
clk      = 0;
rst_n    = 0;
write_en = 0;
read_en  = 0;
data_in  = 8'b0;
repeat(1) @(posedge clk);
rst_n    = 1;
repeat(2) @(posedge clk);
write_en = 1;
data_in  = 8'd5;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd10;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd15;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd20;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd25;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd30;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd35;
repeat(2) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
write_en = 1;
data_in  = 8'd45;
repeat(20) @(posedge clk);
write_en = 0;
read_en  = 1;
repeat(2) @(posedge clk);
read_en  = 0;
end

//Monitorizarea semnalelor
always @(posedge clk) begin
$display("clk=%b, rst_n=%b, write_en=%b, read_en=%b, data_in=%h, data_out=%h, full=%b, empty=%b", clk, rst_n, write_en, read_en, data_in, data_out, full, empty);
end

FIFO T(clk, rst_n, write_en, read_en, data_in, data_out, full, empty);

endmodule