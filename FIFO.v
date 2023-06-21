module FIFO (clk, rst_n, write_en, read_en, data_in, data_out, full, empty);

parameter data_width = 8;
parameter depth = 8;

input                       clk;
input                       rst_n;
input                       write_en;
input                       read_en;
input      [data_width-1:0] data_in;

output reg [data_width-1:0] data_out;
output                      full;
output                      empty;

reg [$clog2(depth)-1:0] write;
reg [$clog2(depth)-1:0] read;
reg [$clog2(depth)-1:0] count;
reg [data_width-1:0]    mem[0:depth-1];
reg [data_width-1:0]    data;
    
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        count <= 0;
        read  <= 0;
        write <= 0;
    end
    else begin
        if (write_en && !full) begin
            mem[write] <= data_in;
            write <= write + 1;
            count <= count + 1;
        end
        if (read_en && !empty)begin
            data_out <= mem[read];
            read <= read + 1;
            count <= count - 1;
        end
    end
end


assign full = (count == 8'b00001000);
assign empty = (count == 0);

endmodule