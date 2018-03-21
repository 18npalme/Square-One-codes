module Lab2(SW,HEX0,LEDR);
	//module is keyword, displayHex is the module name () contains list of inputs and outputs


	//we restate inputs along with if they are a wire or a reg(register) and size of each input and output.
	input wire [3:0] SW; //first 4 switches
	output wire [6:0] HEX0; //first 7-seg display
	output wire [3:0] LEDR;


	assign LEDR = SW; //this is essentially the equivalent to lab1, connects SW[0] to LEDR[0] etc.

	//HEX0[6:0] are all active-low, which means a 0(low) turns the light segment on and a 1(high) turns them off

	//There are several ways to properly light up the LEDS one is by 
	//creating localparams (constant values) for each value to be displayed
	localparam [6:0] ZERO = 7'b1000000; //all segment but segment6 should be on(0).
	localparam [6:0] ONE  = 7'b1111001; //segment 1 and 2 should be on.
	localparam [6:0] TWO  = 7'b0100100;
	localparam [6:0] THREE  = 7'b0110000;
	localparam [6:0] FOUR  = 7'b0011001;
	localparam [6:0] FIVE  = 7'b0010010;
	localparam [6:0] SIX  = 7'b0000010;
	localparam [6:0] SEVEN  = 7'b1111000;
	localparam [6:0] EIGHT  = 7'b0000000;
	localparam [6:0] NINE  = 7'b0011000;
	localparam [6:0] A  = 7'b0001000;
	localparam [6:0] B  = 7'b0000011;
	localparam [6:0] C  = 7'b1000110;
	localparam [6:0] D  = 7'b0100001;
	localparam [6:0] E  = 7'b0000110;
	localparam [6:0] F  = 7'b0001110;

	//once all of the local params are created we can assign them to HEX0 based on the values of the switches
	// the "?" statment is essentially a multiplexer (selector, or similar to if/else statement)
	// D = C ? A : B;  D gets the value of A if C is 1(True), and it gets the Value of B is C is 0 (False)
	assign HEX0 = (SW == 4'h0) ? ZERO : 
					  (SW == 4'h1) ? ONE : //fill the rest
					  (SW == 4'h2) ? TWO :
					  (SW == 4'h3) ? THREE :
					  (SW == 4'h4) ? FOUR :
					  (SW == 4'h5) ? FIVE :
					  (SW == 4'h6) ? SIX :
					  (SW == 4'h7) ? SEVEN :
					  (SW == 4'h8) ? EIGHT :
					  (SW == 4'h9) ? NINE :
					  (SW == 4'hA) ? A :
					  (SW == 4'hB) ? B :
					  (SW == 4'hC) ? C :
					  (SW == 4'hD) ? D :
					  (SW == 4'hE) ? E :
					  (SW == 4'hF) ? F : 7'b0110110;
endmodule
				  
