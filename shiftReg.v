
module Shiftregister(data_in,select,data_out,clk,reset,load);

input [7:0] data_in;
input [1:0] select;
input clk;
input reset;
input load;
output reg [7:0]data_out;
reg [7:0]tmp;

initial 
begin
    data_out [7:0] = 8'b00000000;
end

always @(posedge clk)
begin
    if ( reset == 1 || load == 0)
    begin
        data_out [7:0] = 8'b00000000;
    end

    else
    begin
        if(select [1:0]== 2'b00)
        begin
            data_out [7:0] = data_in [7:0];
        end

        else if (select [1:0]== 2'b01)
        begin
            tmp [7:0] = data_in [7:0] >> 1;
            data_out [7:0] = tmp [7:0];
        end

        else if (select [1:0]== 2'b10)
        begin
            tmp [7:0] =data_in [7:0] << 1;
            data_out [7:0] = tmp[7:0];
        end

        else if(select [1:0]== 2'b11)
        begin
            tmp [7:0] = data_in [7:0] +1;
            data_out [7:0] = tmp[7:0];
        end
        
    end

end

endmodule
