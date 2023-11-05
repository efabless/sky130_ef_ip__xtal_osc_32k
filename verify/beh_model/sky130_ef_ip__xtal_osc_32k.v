/*
	Copyright 2020 Efabless Corp.

	Author: Mohamed Shalan (mshalan@efabless.com)
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:
	http://www.apache.org/licenses/LICENSE-2.0
	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

`timescale          1ns/1ps
`default_nettype    none

module sky130_ef_ip__xtal_osc_32k (
`ifdef USE_POWER_PINS
    input   real    avdd,
    input   real    avss,
    input   real    dvdd,
    input   real    dvss,
`endif
    input   real    in,
    input   wire    ena,
    input   wire    boost,
    output  real    out,
    output  wire    dout
);

    reg clk=0;
    
    // period/2
    real period32 = 15625;
 
    always #period32 clk = (!clk & ena);
    assign dout = clk;

endmodule