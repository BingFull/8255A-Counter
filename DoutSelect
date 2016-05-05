`timescale 1ns / 1ps

module DoutSelect(
    output[7:0] Dout,
    input[3:0] DoutSelect,
    input[7:0] PAInBuf,
    input[7:0] PAin,
    input[7:0] PBInBuf,
    input[7:0] PBin,
    input[7:0] PCStatus
);

always @(DoutSelect or PAin or PAInBuf or PBin or PBInBuf or PCStatus) begin
  case (DoutSelect) begin
    3'b000: Dout = PAin;
    3'b001: Dout = PAInBuf;
    3'b010: Dout = PBin;
    3'b011: Dout = PBInBuf;
    3'b100: Dout = PCStatus;
    default: Dout = 8'bzzzzzzzz;
  endcase
end

endmodule