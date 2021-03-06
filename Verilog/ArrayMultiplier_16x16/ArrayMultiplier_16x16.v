`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 16 x 16 Array Multiplier
//
//  by: Patrick Stockton
//          
//
// 
//////////////////////////////////////////////////////////////////////////////////


module ArrayMultiplier_16x16 (
	input [15:0] A, 
	input [15:0] B, 
	output [31:0] P);
    
    wire [15:0] S0, S1, S2, S3, S4, S5, S6, S7, S8, S9, S10, S11, S12, S13, S14, S15, S16;
    wire [15:0] C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16;
    
    FA FA001 (A[0], B[0], 0, 0, S0[0], C0[0]);
    FA FA002 (A[1], B[0], 0, 0, S0[1], C0[1]);
    FA FA003 (A[2], B[0], 0, 0, S0[2], C0[2]);
    FA FA004 (A[3], B[0], 0, 0, S0[3], C0[3]);
    FA FA005 (A[4], B[0], 0, 0, S0[4], C0[4]);
    FA FA006 (A[5], B[0], 0, 0, S0[5], C0[5]);
    FA FA007 (A[6], B[0], 0, 0, S0[6], C0[6]);
    FA FA008 (A[7], B[0], 0, 0, S0[7], C0[7]);
    FA FA009 (A[8], B[0], 0, 0, S0[8], C0[8]);
    FA FA010 (A[9], B[0], 0, 0, S0[9], C0[9]);
    FA FA011 (A[10], B[0], 0, 0, S0[10], C0[10]);
    FA FA012 (A[11], B[0], 0, 0, S0[11], C0[11]);
    FA FA013 (A[12], B[0], 0, 0, S0[12], C0[12]);
    FA FA014 (A[13], B[0], 0, 0, S0[13], C0[13]);
    FA FA015 (A[14], B[0], 0, 0, S0[14], C0[14]);
    FA FA016 (A[15], B[0], 0, 0, S0[15], C0[15]);
    
    FA FA101 (A[0], B[1], S0[1], C0[0], S1[0], C1[0]);
    FA FA102 (A[1], B[1], S0[2], C0[1], S1[1], C1[1]);
    FA FA103 (A[2], B[1], S0[3], C0[2], S1[2], C1[2]);
    FA FA104 (A[3], B[1], S0[4], C0[3], S1[3], C1[3]);
    FA FA105 (A[4], B[1], S0[5], C0[4], S1[4], C1[4]);
    FA FA106 (A[5], B[1], S0[6], C0[5], S1[5], C1[5]);
    FA FA107 (A[6], B[1], S0[7], C0[6], S1[6], C1[6]);
    FA FA108 (A[7], B[1], S0[8], C0[7], S1[7], C1[7]);
    FA FA109 (A[8], B[1], S0[9], C0[8], S1[8], C1[8]);
    FA FA110 (A[9], B[1], S0[10], C0[9], S1[9], C1[9]);
    FA FA111 (A[10], B[1], S0[11], C0[10], S1[10], C1[10]);
    FA FA112 (A[11], B[1], S0[12], C0[11], S1[11], C1[11]);
    FA FA113 (A[12], B[1], S0[13], C0[12], S1[12], C1[12]);
    FA FA114 (A[13], B[1], S0[14], C0[13], S1[13], C1[13]);
    FA FA115 (A[14], B[1], S0[15], C0[14], S1[14], C1[14]);
    FA FA116 (A[15], B[1], 0, C0[15], S1[15], C1[15]);
    
    FA FA201 (A[0], B[2], S1[1], C1[0], S2[0], C2[0]);
    FA FA202 (A[1], B[2], S1[2], C1[1], S2[1], C2[1]);
    FA FA203 (A[2], B[2], S1[3], C1[2], S2[2], C2[2]);
    FA FA204 (A[3], B[2], S1[4], C1[3], S2[3], C2[3]);
    FA FA205 (A[4], B[2], S1[5], C1[4], S2[4], C2[4]);
    FA FA206 (A[5], B[2], S1[6], C1[5], S2[5], C2[5]);
    FA FA207 (A[6], B[2], S1[7], C1[6], S2[6], C2[6]);
    FA FA208 (A[7], B[2], S1[8], C1[7], S2[7], C2[7]);
    FA FA209 (A[8], B[2], S1[9], C1[8], S2[8], C2[8]);
    FA FA210 (A[9], B[2], S1[10], C1[9], S2[9], C2[9]);
    FA FA211 (A[10], B[2], S1[11], C1[10], S2[10], C2[10]);
    FA FA212 (A[11], B[2], S1[12], C1[11], S2[11], C2[11]);
    FA FA213 (A[12], B[2], S1[13], C1[12], S2[12], C2[12]);
    FA FA214 (A[13], B[2], S1[14], C1[13], S2[13], C2[13]);
    FA FA215 (A[14], B[2], S1[15], C1[14], S2[14], C2[14]);
    FA FA216 (A[15], B[2], 0, C1[15], S2[15], C2[15]);
    
    FA FA301 (A[0], B[3], S2[1], C2[0], S3[0], C3[0]);
    FA FA302 (A[1], B[3], S2[2], C2[1], S3[1], C3[1]);
    FA FA303 (A[2], B[3], S2[3], C2[2], S3[2], C3[2]);
    FA FA304 (A[3], B[3], S2[4], C2[3], S3[3], C3[3]);
    FA FA305 (A[4], B[3], S2[5], C2[4], S3[4], C3[4]);
    FA FA306 (A[5], B[3], S2[6], C2[5], S3[5], C3[5]);
    FA FA307 (A[6], B[3], S2[7], C2[6], S3[6], C3[6]);
    FA FA308 (A[7], B[3], S2[8], C2[7], S3[7], C3[7]);
    FA FA309 (A[8], B[3], S2[9], C2[8], S3[8], C3[8]);
    FA FA310 (A[9], B[3], S2[10], C2[9], S3[9], C3[9]);
    FA FA311 (A[10], B[3], S2[11], C2[10], S3[10], C3[10]);
    FA FA312 (A[11], B[3], S2[12], C2[11], S3[11], C3[11]);
    FA FA313 (A[12], B[3], S2[13], C2[12], S3[12], C3[12]);
    FA FA314 (A[13], B[3], S2[14], C2[13], S3[13], C3[13]);
    FA FA315 (A[14], B[3], S2[15], C2[14], S3[14], C3[14]);
    FA FA316 (A[15], B[3], 0, C2[15], S3[15], C3[15]);
    
    FA FA401 (A[0], B[4], S3[1], C3[0], S4[0], C4[0]);
    FA FA402 (A[1], B[4], S3[2], C3[1], S4[1], C4[1]);
    FA FA403 (A[2], B[4], S3[3], C3[2], S4[2], C4[2]);
    FA FA404 (A[3], B[4], S3[4], C3[3], S4[3], C4[3]);
    FA FA405 (A[4], B[4], S3[5], C3[4], S4[4], C4[4]);
    FA FA406 (A[5], B[4], S3[6], C3[5], S4[5], C4[5]);
    FA FA407 (A[6], B[4], S3[7], C3[6], S4[6], C4[6]);
    FA FA408 (A[7], B[4], S3[8], C3[7], S4[7], C4[7]);
    FA FA409 (A[8], B[4], S3[9], C3[8], S4[8], C4[8]);
    FA FA410 (A[9], B[4], S3[10], C3[9], S4[9], C4[9]);
    FA FA411 (A[10], B[4], S3[11], C3[10], S4[10], C4[10]);
    FA FA412 (A[11], B[4], S3[12], C3[11], S4[11], C4[11]);
    FA FA413 (A[12], B[4], S3[13], C3[12], S4[12], C4[12]);
    FA FA414 (A[13], B[4], S3[14], C3[13], S4[13], C4[13]);
    FA FA415 (A[14], B[4], S3[15], C3[14], S4[14], C4[14]);
    FA FA416 (A[15], B[4], 0, C3[15], S4[15], C4[15]);
    
    FA FA501 (A[0], B[5], S4[1], C4[0], S5[0], C5[0]);
    FA FA502 (A[1], B[5], S4[2], C4[1], S5[1], C5[1]);
    FA FA503 (A[2], B[5], S4[3], C4[2], S5[2], C5[2]);
    FA FA504 (A[3], B[5], S4[4], C4[3], S5[3], C5[3]);
    FA FA505 (A[4], B[5], S4[5], C4[4], S5[4], C5[4]);
    FA FA506 (A[5], B[5], S4[6], C4[5], S5[5], C5[5]);
    FA FA507 (A[6], B[5], S4[7], C4[6], S5[6], C5[6]);
    FA FA508 (A[7], B[5], S4[8], C4[7], S5[7], C5[7]);
    FA FA509 (A[8], B[5], S4[9], C4[8], S5[8], C5[8]);
    FA FA510 (A[9], B[5], S4[10], C4[9], S5[9], C5[9]);
    FA FA511 (A[10], B[5], S4[11], C4[10], S5[10], C5[10]);
    FA FA512 (A[11], B[5], S4[12], C4[11], S5[11], C5[11]);
    FA FA513 (A[12], B[5], S4[13], C4[12], S5[12], C5[12]);
    FA FA514 (A[13], B[5], S4[14], C4[13], S5[13], C5[13]);
    FA FA515 (A[14], B[5], S4[15], C4[14], S5[14], C5[14]);
    FA FA516 (A[15], B[5], 0, C4[15], S5[15], C5[15]);
    
    FA FA601 (A[0], B[6], S5[1], C5[0], S6[0], C6[0]);
    FA FA602 (A[1], B[6], S5[2], C5[1], S6[1], C6[1]);
    FA FA603 (A[2], B[6], S5[3], C5[2], S6[2], C6[2]);
    FA FA604 (A[3], B[6], S5[4], C5[3], S6[3], C6[3]);
    FA FA605 (A[4], B[6], S5[5], C5[4], S6[4], C6[4]);
    FA FA606 (A[5], B[6], S5[6], C5[5], S6[5], C6[5]);
    FA FA607 (A[6], B[6], S5[7], C5[6], S6[6], C6[6]);
    FA FA608 (A[7], B[6], S5[8], C5[7], S6[7], C6[7]);
    FA FA609 (A[8], B[6], S5[9], C5[8], S6[8], C6[8]);
    FA FA610 (A[9], B[6], S5[10], C5[9], S6[9], C6[9]);
    FA FA611 (A[10], B[6], S5[11], C5[10], S6[10], C6[10]);
    FA FA612 (A[11], B[6], S5[12], C5[11], S6[11], C6[11]);
    FA FA613 (A[12], B[6], S5[13], C5[12], S6[12], C6[12]);
    FA FA614 (A[13], B[6], S5[14], C5[13], S6[13], C6[13]);
    FA FA615 (A[14], B[6], S5[15], C5[14], S6[14], C6[14]);
    FA FA616 (A[15], B[6], 0, C5[15], S6[15], C6[15]);
    
    FA FA701 (A[0], B[7], S6[1], C6[0], S7[0], C7[0]);
    FA FA702 (A[1], B[7], S6[2], C6[1], S7[1], C7[1]);
    FA FA703 (A[2], B[7], S6[3], C6[2], S7[2], C7[2]);
    FA FA704 (A[3], B[7], S6[4], C6[3], S7[3], C7[3]);
    FA FA705 (A[4], B[7], S6[5], C6[4], S7[4], C7[4]);
    FA FA706 (A[5], B[7], S6[6], C6[5], S7[5], C7[5]);
    FA FA707 (A[6], B[7], S6[7], C6[6], S7[6], C7[6]);
    FA FA708 (A[7], B[7], S6[8], C6[7], S7[7], C7[7]);
    FA FA709 (A[8], B[7], S6[9], C6[8], S7[8], C7[8]);
    FA FA710 (A[9], B[7], S6[10], C6[9], S7[9], C7[9]);
    FA FA711 (A[10], B[7], S6[11], C6[10], S7[10], C7[10]);
    FA FA712 (A[11], B[7], S6[12], C6[11], S7[11], C7[11]);
    FA FA713 (A[12], B[7], S6[13], C6[12], S7[12], C7[12]);
    FA FA714 (A[13], B[7], S6[14], C6[13], S7[13], C7[13]);
    FA FA715 (A[14], B[7], S6[15], C6[14], S7[14], C7[14]);
    FA FA716 (A[15], B[7], 0, C6[15], S7[15], C7[15]);
    
    FA FA801 (A[0], B[8], S7[1], C7[0], S8[0], C8[0]);
    FA FA802 (A[1], B[8], S7[2], C7[1], S8[1], C8[1]);
    FA FA803 (A[2], B[8], S7[3], C7[2], S8[2], C8[2]);
    FA FA804 (A[3], B[8], S7[4], C7[3], S8[3], C8[3]);
    FA FA805 (A[4], B[8], S7[5], C7[4], S8[4], C8[4]);
    FA FA806 (A[5], B[8], S7[6], C7[5], S8[5], C8[5]);
    FA FA807 (A[6], B[8], S7[7], C7[6], S8[6], C8[6]);
    FA FA808 (A[7], B[8], S7[8], C7[7], S8[7], C8[7]);
    FA FA809 (A[8], B[8], S7[9], C7[8], S8[8], C8[8]);
    FA FA810 (A[9], B[8], S7[10], C7[9], S8[9], C8[9]);
    FA FA811 (A[10], B[8], S7[11], C7[10], S8[10], C8[10]);
    FA FA812 (A[11], B[8], S7[12], C7[11], S8[11], C8[11]);
    FA FA813 (A[12], B[8], S7[13], C7[12], S8[12], C8[12]);
    FA FA814 (A[13], B[8], S7[14], C7[13], S8[13], C8[13]);
    FA FA815 (A[14], B[8], S7[15], C7[14], S8[14], C8[14]);
    FA FA816 (A[15], B[8], 0, C7[15], S8[15], C8[15]);
    
    FA FA901 (A[0], B[9], S8[1], C8[0], S9[0], C9[0]);
    FA FA902 (A[1], B[9], S8[2], C8[1], S9[1], C9[1]);
    FA FA903 (A[2], B[9], S8[3], C8[2], S9[2], C9[2]);
    FA FA904 (A[3], B[9], S8[4], C8[3], S9[3], C9[3]);
    FA FA905 (A[4], B[9], S8[5], C8[4], S9[4], C9[4]);
    FA FA906 (A[5], B[9], S8[6], C8[5], S9[5], C9[5]);
    FA FA907 (A[6], B[9], S8[7], C8[6], S9[6], C9[6]);
    FA FA908 (A[7], B[9], S8[8], C8[7], S9[7], C9[7]);
    FA FA909 (A[8], B[9], S8[9], C8[8], S9[8], C9[8]);
    FA FA910 (A[9], B[9], S8[10], C8[9], S9[9], C9[9]);
    FA FA911 (A[10], B[9], S8[11], C8[10], S9[10], C9[10]);
    FA FA912 (A[11], B[9], S8[12], C8[11], S9[11], C9[11]);
    FA FA913 (A[12], B[9], S8[13], C8[12], S9[12], C9[12]);
    FA FA914 (A[13], B[9], S8[14], C8[13], S9[13], C9[13]);
    FA FA915 (A[14], B[9], S8[15], C8[14], S9[14], C9[14]);
    FA FA916 (A[15], B[9], 0, C8[15], S9[15], C9[15]);
    
    FA FA1001 (A[0], B[10], S9[1], C9[0], S10[0], C10[0]);
    FA FA1002 (A[1], B[10], S9[2], C9[1], S10[1], C10[1]);
    FA FA1003 (A[2], B[10], S9[3], C9[2], S10[2], C10[2]);
    FA FA1004 (A[3], B[10], S9[4], C9[3], S10[3], C10[3]);
    FA FA1005 (A[4], B[10], S9[5], C9[4], S10[4], C10[4]);
    FA FA1006 (A[5], B[10], S9[6], C9[5], S10[5], C10[5]);
    FA FA1007 (A[6], B[10], S9[7], C9[6], S10[6], C10[6]);
    FA FA1008 (A[7], B[10], S9[8], C9[7], S10[7], C10[7]);
    FA FA1009 (A[8], B[10], S9[9], C9[8], S10[8], C10[8]);
    FA FA1010 (A[9], B[10], S9[10], C9[9], S10[9], C10[9]);
    FA FA1011 (A[10], B[10], S9[11], C9[10], S10[10], C10[10]);
    FA FA1012 (A[11], B[10], S9[12], C9[11], S10[11], C10[11]);
    FA FA1013 (A[12], B[10], S9[13], C9[12], S10[12], C10[12]);
    FA FA1014 (A[13], B[10], S9[14], C9[13], S10[13], C10[13]);
    FA FA1015 (A[14], B[10], S9[15], C9[14], S10[14], C10[14]);
    FA FA1016 (A[15], B[10], 0, C9[15], S10[15], C10[15]);
    
    FA FA1101 (A[0], B[11], S10[1], C10[0], S11[0], C11[0]);
    FA FA1102 (A[1], B[11], S10[2], C10[1], S11[1], C11[1]);
    FA FA1103 (A[2], B[11], S10[3], C10[2], S11[2], C11[2]);
    FA FA1104 (A[3], B[11], S10[4], C10[3], S11[3], C11[3]);
    FA FA1105 (A[4], B[11], S10[5], C10[4], S11[4], C11[4]);
    FA FA1106 (A[5], B[11], S10[6], C10[5], S11[5], C11[5]);
    FA FA1107 (A[6], B[11], S10[7], C10[6], S11[6], C11[6]);
    FA FA1108 (A[7], B[11], S10[8], C10[7], S11[7], C11[7]);
    FA FA1109 (A[8], B[11], S10[9], C10[8], S11[8], C11[8]);
    FA FA1110 (A[9], B[11], S10[10], C10[9], S11[9], C11[9]);
    FA FA1111 (A[10], B[11], S10[11], C10[10], S11[10], C11[10]);
    FA FA1112 (A[11], B[11], S10[12], C10[11], S11[11], C11[11]);
    FA FA1113 (A[12], B[11], S10[13], C10[12], S11[12], C11[12]);
    FA FA1114 (A[13], B[11], S10[14], C10[13], S11[13], C11[13]);
    FA FA1115 (A[14], B[11], S10[15], C10[14], S11[14], C11[14]);
    FA FA1116 (A[15], B[11], 0, C10[15], S11[15], C11[15]);
    
    FA FA1201 (A[0], B[12], S11[1], C11[0], S12[0], C12[0]);
    FA FA1202 (A[1], B[12], S11[2], C11[1], S12[1], C12[1]);
    FA FA1203 (A[2], B[12], S11[3], C11[2], S12[2], C12[2]);
    FA FA1204 (A[3], B[12], S11[4], C11[3], S12[3], C12[3]);
    FA FA1205 (A[4], B[12], S11[5], C11[4], S12[4], C12[4]);
    FA FA1206 (A[5], B[12], S11[6], C11[5], S12[5], C12[5]);
    FA FA1207 (A[6], B[12], S11[7], C11[6], S12[6], C12[6]);
    FA FA1208 (A[7], B[12], S11[8], C11[7], S12[7], C12[7]);
    FA FA1209 (A[8], B[12], S11[9], C11[8], S12[8], C12[8]);
    FA FA1210 (A[9], B[12], S11[10], C11[9], S12[9], C12[9]);
    FA FA1211 (A[10], B[12], S11[11], C11[10], S12[10], C12[10]);
    FA FA1212 (A[11], B[12], S11[12], C11[11], S12[11], C12[11]);
    FA FA1213 (A[12], B[12], S11[13], C11[12], S12[12], C12[12]);
    FA FA1214 (A[13], B[12], S11[14], C11[13], S12[13], C12[13]);
    FA FA1215 (A[14], B[12], S11[15], C11[14], S12[14], C12[14]);
    FA FA1216 (A[15], B[12], 0, C11[15], S12[15], C12[15]);
    
    FA FA1301 (A[0], B[13], S12[1], C12[0], S13[0], C13[0]);
    FA FA1302 (A[1], B[13], S12[2], C12[1], S13[1], C13[1]);
    FA FA1303 (A[2], B[13], S12[3], C12[2], S13[2], C13[2]);
    FA FA1304 (A[3], B[13], S12[4], C12[3], S13[3], C13[3]);
    FA FA1305 (A[4], B[13], S12[5], C12[4], S13[4], C13[4]);
    FA FA1306 (A[5], B[13], S12[6], C12[5], S13[5], C13[5]);
    FA FA1307 (A[6], B[13], S12[7], C12[6], S13[6], C13[6]);
    FA FA1308 (A[7], B[13], S12[8], C12[7], S13[7], C13[7]);
    FA FA1309 (A[8], B[13], S12[9], C12[8], S13[8], C13[8]);
    FA FA1310 (A[9], B[13], S12[10], C12[9], S13[9], C13[9]);
    FA FA1311 (A[10], B[13], S12[11], C12[10], S13[10], C13[10]);
    FA FA1312 (A[11], B[13], S12[12], C12[11], S13[11], C13[11]);
    FA FA1313 (A[12], B[13], S12[13], C12[12], S13[12], C13[12]);
    FA FA1314 (A[13], B[13], S12[14], C12[13], S13[13], C13[13]);
    FA FA1315 (A[14], B[13], S12[15], C12[14], S13[14], C13[14]);
    FA FA1316 (A[15], B[13], 0, C12[15], S13[15], C13[15]);
    
    FA FA1401 (A[0], B[14], S13[1], C13[0], S14[0], C14[0]);
    FA FA1402 (A[1], B[14], S13[2], C13[1], S14[1], C14[1]);
    FA FA1403 (A[2], B[14], S13[3], C13[2], S14[2], C14[2]);
    FA FA1404 (A[3], B[14], S13[4], C13[3], S14[3], C14[3]);
    FA FA1405 (A[4], B[14], S13[5], C13[4], S14[4], C14[4]);
    FA FA1406 (A[5], B[14], S13[6], C13[5], S14[5], C14[5]);
    FA FA1407 (A[6], B[14], S13[7], C13[6], S14[6], C14[6]);
    FA FA1408 (A[7], B[14], S13[8], C13[7], S14[7], C14[7]);
    FA FA1409 (A[8], B[14], S13[9], C13[8], S14[8], C14[8]);
    FA FA1410 (A[9], B[14], S13[10], C13[9], S14[9], C14[9]);
    FA FA1411 (A[10], B[14], S13[11], C13[10], S14[10], C14[10]);
    FA FA1412 (A[11], B[14], S13[12], C13[11], S14[11], C14[11]);
    FA FA1413 (A[12], B[14], S13[13], C13[12], S14[12], C14[12]);
    FA FA1414 (A[13], B[14], S13[14], C13[13], S14[13], C14[13]);
    FA FA1415 (A[14], B[14], S13[15], C13[14], S14[14], C14[14]);
    FA FA1416 (A[15], B[14], 0, C13[15], S14[15], C14[15]);
    
    FA FA1501 (A[0], B[15], S14[1], C14[0], S15[0], C15[0]);
    FA FA1502 (A[1], B[15], S14[2], C14[1], S15[1], C15[1]);
    FA FA1503 (A[2], B[15], S14[3], C14[2], S15[2], C15[2]);
    FA FA1504 (A[3], B[15], S14[4], C14[3], S15[3], C15[3]);
    FA FA1505 (A[4], B[15], S14[5], C14[4], S15[4], C15[4]);
    FA FA1506 (A[5], B[15], S14[6], C14[5], S15[5], C15[5]);
    FA FA1507 (A[6], B[15], S14[7], C14[6], S15[6], C15[6]);
    FA FA1508 (A[7], B[15], S14[8], C14[7], S15[7], C15[7]);
    FA FA1509 (A[8], B[15], S14[9], C14[8], S15[8], C15[8]);
    FA FA1510 (A[9], B[15], S14[10], C14[9], S15[9], C15[9]);
    FA FA1511 (A[10], B[15], S14[11], C14[10], S15[10], C15[10]);
    FA FA1512 (A[11], B[15], S14[12], C14[11], S15[11], C15[11]);
    FA FA1513 (A[12], B[15], S14[13], C14[12], S15[12], C15[12]);
    FA FA1514 (A[13], B[15], S14[14], C14[13], S15[13], C15[13]);
    FA FA1515 (A[14], B[15], S14[15], C14[14], S15[14], C15[14]);
    FA FA1516 (A[15], B[15], 0, C14[15], S15[15], C15[15]);
    
    FA FA1601 (1, 0, S15[1], C15[0], S16[0], C16[0]);
    FA FA1602 (1, C16[0], S15[2], C15[1], S16[1], C16[1]);
    FA FA1603 (1, C16[1], S15[3], C15[2], S16[2], C16[2]);
    FA FA1604 (1, C16[2], S15[4], C15[3], S16[3], C16[3]);
    FA FA1605 (1, C16[3], S15[5], C15[4], S16[4], C16[4]);
    FA FA1606 (1, C16[4], S15[6], C15[5], S16[5], C16[5]);
    FA FA1607 (1, C16[5], S15[7], C15[6], S16[6], C16[6]);
    FA FA1608 (1, C16[6], S15[8], C15[7], S16[7], C16[7]);
    FA FA1609 (1, C16[7], S15[9], C15[8], S16[8], C16[8]);
    FA FA1610 (1, C16[8], S15[10], C15[9], S16[9], C16[9]);
    FA FA1611 (1, C16[9], S15[11], C15[10], S16[10], C16[10]);
    FA FA1612 (1, C16[10], S15[12], C15[11], S16[11], C16[11]);
    FA FA1613 (1, C16[11], S15[13], C15[12], S16[12], C16[12]);
    FA FA1614 (1, C16[12], S15[14], C15[13], S16[13], C16[13]);
    FA FA1615 (1, C16[13], S15[15], C15[14], S16[14], C16[14]);
    
    assign P = {C16[14], S16[14], S16[13], S16[12], S16[11], S16[10], S16[9], 
                    S16[8], S16[7], S16[6], S16[5], S16[4], S16[3], S16[2], 
                        S16[1], S16[0], S15[0], S14[0], S13[0], S12[0], S11[0], S10[0], 
                            S9[0], S8[0], S7[0], S6[0], S5[0], S4[0], S3[0], S2[0], S1[0], S0[0]};
    
endmodule

module FA (
	input A, B, Sin, Cin, 
	output Sout, Cout);
    
    assign {Cout, Sout} = (A & B) + Sin + Cin;
    
endmodule