`timescale 1ns / 1ps


module moduleName (
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
);

xor (s[0], a[0], b[0], cin);
and (fa1_out1, a[0], b[0]), (fa1_out2, a[0], cin), (fa1_out3, cin, b[0]) ;
or (cout1, fa1_out1, fa1_out2, fa1_out3);

xor (s[1], a[1], b[1], cout1);
and (fa2_out1, a[1], b[1]), (fa2_out2, a[1], cout1), (fa2_out3, cout1, b[0]);
or (cout2, fa2_out1, fa2_out2, fa2_out3);

xor (s[2], a[2], b[2], cout2);
and (fa3_out1, a[2], b[2]), (fa3_out2, a[2], cout1), (fa3_out3, cout1, b[2]);
or (cout3, fa3_out1, fa3_out2, fa3_out3);

xor (s[3], a[3], b[3], cout1);
and (fa4_out1, a[3], b[3]), (fa4_out2, a[3], cout1), (fa4_out3, cout1, b[3]);
or (cout, fa4_out1, fa4_out2, fa4_out3);


    
endmodule