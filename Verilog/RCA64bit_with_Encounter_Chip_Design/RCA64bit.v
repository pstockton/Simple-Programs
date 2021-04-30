`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 64-Bit Ripple Carry Adder with Encounter implementation
//
// Created: Fall 2014
// 
// By: Patrick Stockton
//  
//////////////////////////////////////////////////////////////////////////////////

    
	//Create a half adder with outputs "sum, C" and inputs "A, B".
    module half_adder(
        output sum, C,
        input A, B
        );
    
    xor(sum, A, B);
    and(C, A, B);
     
    endmodule
    
    // Connect two half adders to make a Full Adder
    module full_adder(
        output sum, Cout,
        input A, B, Cin
        );
        
     wire w1,w2,w3;
     // Create two half adders and connect them
     half_adder HA1(w1, w2, A, B);          // Order of the name must be the same
     half_adder HA2(sum, w3, w1, Cin);
     or OG1(Cout, w2, w3);      // All primitives, outputs come first followed by inputs
    
    endmodule
    
    // Connect 64 Full Adders to make a 4 Bit Adder
    module ripple_adder_64bit(
        output [63:0] Sum,     // Create "sum" as a 4 bit output
        output Cout,          // Carry out bit
        input [63:0] A,B,      // Create 4 bit A and B inputs
        input Cin             // Carry-in input
        );
        
     // Create the wire connections for the various Full Adders   
     wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33,w34,w35,w36,w37,w38,w39,w40,w41,w42,w43,w44,w45,w46,w47,w48,w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59,w60,w61,w62,w63;
     
     // Initiate the 64 Full Adders to create the Ripple Carry Adder
     full_adder FA1(Sum[0], w1, A[0], B[0], Cin),       // Full Adder 1
                FA2(Sum[1], w2, A[1], B[1], w1),        // Full Adder 2
                FA3(Sum[2], w3, A[2], B[2], w2),       // Full Adder 3
                FA4(Sum[3], w4, A[3], B[3], w3),      // Full Adder 4
                FA5(Sum[4], w5, A[4], B[4], w4),
                FA6(Sum[5], w6, A[5], B[5], w5),
                FA7(Sum[6], w7, A[6], B[6], w6),
                FA8(Sum[7], w8, A[7], B[7], w7),
                FA9(Sum[8], w9, A[8], B[8], w8),
                FA10(Sum[9], w10, A[9], B[9], w9),
                FA11(Sum[10], w11, A[10], B[10], w10),
                FA12(Sum[11], w12, A[11], B[11], w11),
                FA13(Sum[12], w13, A[12], B[12], w12),
                FA14(Sum[13], w14, A[13], B[13], w13),
                FA15(Sum[14], w15, A[14], B[14], w14),
                FA16(Sum[15], w16, A[15], B[15], w15),
                FA17(Sum[16], w17, A[16], B[16], w16),
                FA18(Sum[17], w18, A[17], B[17], w17),
                FA19(Sum[18], w19, A[18], B[18], w18),
                FA20(Sum[19], w20, A[19], B[19], w19),
                FA21(Sum[20], w21, A[20], B[20], w20),
                FA22(Sum[21], w22, A[21], B[21], w21),
                FA23(Sum[22], w23, A[22], B[22], w22),
                FA24(Sum[23], w24, A[23], B[23], w23),
                FA25(Sum[24], w25, A[24], B[24], w24),
                FA26(Sum[25], w26, A[25], B[25], w25),
                FA27(Sum[26], w27, A[26], B[26], w26),
                FA28(Sum[27], w28, A[27], B[27], w27),
                FA29(Sum[28], w29, A[28], B[28], w28),
                FA30(Sum[29], w30, A[29], B[29], w29),
                FA31(Sum[30], w31, A[30], B[30], w30),
                FA32(Sum[31], w32, A[31], B[31], w31),
                FA33(Sum[32], w33, A[32], B[32], w32),
                FA34(Sum[33], w34, A[33], B[33], w33),
                FA35(Sum[34], w35, A[34], B[34], w34),
                FA36(Sum[35], w36, A[35], B[35], w35),
                FA37(Sum[36], w37, A[36], B[36], w36),
                FA38(Sum[37], w38, A[37], B[37], w37),
                FA39(Sum[38], w39, A[38], B[38], w38),
                FA40(Sum[39], w40, A[39], B[39], w39),
                FA41(Sum[40], w41, A[40], B[40], w40),
                FA42(Sum[41], w42, A[41], B[41], w41),
                FA43(Sum[42], w43, A[42], B[42], w42),
                FA44(Sum[43], w44, A[43], B[43], w43),
                FA45(Sum[44], w45, A[44], B[44], w44),
                FA46(Sum[45], w46, A[45], B[45], w45),
                FA47(Sum[46], w47, A[46], B[46], w46),
                FA48(Sum[47], w48, A[47], B[47], w47),
                FA49(Sum[48], w49, A[48], B[48], w48),
                FA50(Sum[49], w50, A[49], B[49], w49),
                FA51(Sum[50], w51, A[50], B[50], w50),
                FA52(Sum[51], w52, A[51], B[51], w51),
                FA53(Sum[52], w53, A[52], B[52], w52),
                FA54(Sum[53], w54, A[53], B[53], w53),
                FA55(Sum[54], w55, A[54], B[54], w54),
                FA56(Sum[55], w56, A[55], B[55], w55),
                FA57(Sum[56], w57, A[56], B[56], w56),
                FA58(Sum[57], w58, A[57], B[57], w57),
                FA59(Sum[58], w59, A[58], B[58], w58),
                FA60(Sum[59], w60, A[59], B[59], w59),
                FA61(Sum[60], w61, A[60], B[60], w60),
                FA62(Sum[61], w62, A[61], B[61], w61),
                FA63(Sum[62], w63, A[62], B[62], w62),                
                FA64(Sum[63], Cout, A[63], B[63], w63);
    
    endmodule

