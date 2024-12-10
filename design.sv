module parity_gen (x, clk, z);
  input x, clk;                     // Input `x` is the data bit, `clk` is the clock signal
  output reg z;                     // Output `z` is the parity bit (1 or 0)
  reg even_odd;                     // Tracks the current parity state (EVEN or ODD)
  parameter EVEN = 0, ODD = 1;      // Parameters representing parity states

  always @ (posedge clk)            // Triggered on the rising edge of the clock
    case (even_odd)
      EVEN: begin                   // If in the EVEN parity state
        z <= x ? 1 : 0;             // Output `z` is 1 if `x` is 1, otherwise 0
        even_odd <= x ? ODD : EVEN; // Transition to ODD if `x` is 1, stay in EVEN otherwise
      end
      ODD: begin                    // If in the ODD parity state
        z <= x ? 0 : 1;             // Output `z` is 0 if `x` is 1, otherwise 1
        even_odd <= x ? EVEN : ODD; // Transition to EVEN if `x` is 1, stay in ODD otherwise
      end
      default: even_odd <= EVEN;    // Default case to reset state to EVEN
    endcase
endmodule
