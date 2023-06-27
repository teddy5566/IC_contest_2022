/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : P-2019.03
// Date      : Wed Mar 30 16:55:12 2022
/////////////////////////////////////////////////////////////


module JAM_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  ADDHXL U1_1_14 ( .A(A[14]), .B(carry[14]), .CO(carry[15]), .S(SUM[14]) );
  ADDHXL U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHXL U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHXL U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHXL U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHXL U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHXL U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHXL U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHXL U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHXL U1_1_13 ( .A(A[13]), .B(carry[13]), .CO(carry[14]), .S(SUM[13]) );
  ADDHXL U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHXL U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHXL U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHXL U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  XOR2X1 U1 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module JAM_DW01_add_0 ( A, B, CI, SUM, CO );
  input [9:0] A;
  input [9:0] B;
  output [9:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3;
  wire   [9:1] carry;

  ADDFXL U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFXL U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFXL U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFXL U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFXL U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFXL U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2XL U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
  XNOR2X1 U3 ( .A(B[9]), .B(n3), .Y(SUM[9]) );
  XOR2XL U4 ( .A(B[8]), .B(n2), .Y(SUM[8]) );
  XOR2XL U5 ( .A(B[7]), .B(carry[7]), .Y(SUM[7]) );
  NAND2X1 U6 ( .A(B[8]), .B(n2), .Y(n3) );
  AND2X2 U7 ( .A(B[7]), .B(carry[7]), .Y(n2) );
endmodule


module JAM ( CLK, RST, W, J, Cost, MatchCount, MinCost, Valid );
  output [2:0] W;
  output [2:0] J;
  input [6:0] Cost;
  output [3:0] MatchCount;
  output [9:0] MinCost;
  input CLK, RST;
  output Valid;
  wire   N229, N230, N231, N232, N233, N234, N247, N248, N249, N250, N251,
         N252, N253, N254, N256, N258, n1018, n1019, n1020, n1021, n1022,
         n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032,
         n1033, n1034, n1035, n1036, n1037, n1038, N262, cost_done, next_done,
         change1_done, \w_j[0][2] , \w_j[0][1] , \w_j[0][0] , \w_j[1][2] ,
         \w_j[1][1] , \w_j[1][0] , \w_j[2][2] , \w_j[2][1] , \w_j[2][0] ,
         \w_j[3][2] , \w_j[3][1] , \w_j[3][0] , \w_j[4][2] , \w_j[4][1] ,
         \w_j[4][0] , \w_j[5][2] , \w_j[5][1] , \w_j[5][0] , \w_j[6][2] ,
         \w_j[6][1] , \w_j[6][0] , \w_j[7][2] , \w_j[7][1] , \w_j[7][0] , N294,
         N295, N296, N304, N305, acc_en, N314, N315, N316, N317, N318, N319,
         N320, N321, N322, N323, N324, N325, N326, N327, N328, N329, N330,
         N331, N332, N333, N340, N398, N400, N401, N402, N403, N404, N405,
         N406, N407, N408, N409, N410, N411, N412, N413, N414, N415, N432,
         N433, N434, N435, N436, N437, N438, N439, N440, N441, N442, N443,
         N444, N445, N446, N447, N489, N490, N491, N511, N512, N520, N521,
         N522, N533, N534, N535, N536, N537, N543, N544, N545, N565, N567,
         N587, N588, N589, N610, N611, N620, N621, N622, N655, N688, N689,
         N703, N704, N705, N728, N729, N730, N749, N750, N801, N802, N803,
         N815, N816, N817, N920, n115, n116, n125, n130, n133, n136, n168,
         n173, n174, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282, n283, n284, n285,
         n286, n287, n288, n289, n290, n291, n292, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n325, n326, n327, n328, n329,
         n330, n331, n332, n333, n334, n335, n336, n337, n338, n339, n340,
         n341, n342, n343, n344, n345, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n425, n426, n427, n428, n429, n430, n431,
         n432, n433, n434, n435, n436, n437, n438, n439, n440, n441, n442,
         n443, n444, n445, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n677, n678, n697, n698, n699, n700, n701,
         n702, n703, n704, n705, n706, n707, n708, n709, n710, n711, n712,
         n713, n714, n715, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n735, n736, n737,
         n738, n739, n740, n741, n742, n743, n744, n745, n746, n747, n748,
         n749, n750, n751, n752, n753, n754, n755, n756, n757, n758, n759,
         n760, n761, n762, n763, n764, n765, n766, n767, n768, n769, n770,
         n771, n772, n773, n774, n775, n776, n777, n778, n779, n780, n781,
         n782, n783, n784, n785, n786, n787, n788, n789, n790, n791, n792,
         n793, n794, n795, n796, n797, n798, n799, n800, n801, n802, n803,
         n804, n805, n806, n807, n808, n809, n810, n811, n812, n813, n814,
         n815, n816, n817, n818, n819, n820, n821, n822, n823, n824, n825,
         n826, n827, n828, n829, n830, n831, n832, n833, n834, n835, n836,
         n837, n838, n839, n840, n841, n842, n843, n844, n845, n846, n847,
         n848, n849, n850, n851, n852, n853, n854, n855, n856, n857, n858,
         n859, n860, n861, n862, n863, n864, n865, n866, n867, n868, n869,
         n870, n871, n872, n873, n874, n875, n876, n877, n878, n879, n880,
         n881, n882, n883, n884, n885, n886, n887, n888, n889, n890, n891,
         n892, n893, n894, n895, n896, n897, n898, n899, n900, n901, n902,
         n903, n904, n905, n906, n907, n908, n909, n910, n911, n912, n913,
         n914, n915, n916, n917, n918, n919, n920, n921, n922, n923, n924,
         n925, n926, n927, n928, n929, n930, n931, n932, n933, n934, n935,
         n936, n937, n938, n939, n940, n941, n942, n943, n944, n945, n946,
         n947, n948, n949, n950, n951, n952, n953, n954, n955, n956, n957,
         n958, n959, n960, n961, n962, n963, n964, n965, n966, n967, n968,
         n969, n970, n971, n972, n973, n974, n975, n976, n977, n978, n979,
         n980, n981, n982, n983, n984, n985, n986, n987, n988, n989, n990,
         n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000, n1001,
         n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010, n1011,
         n1012, n1013, n1014, n1015, n1016, n1017;
  wire   [2:0] cs;
  wire   [15:0] cnt;
  wire   [9:0] acc;
  wire   [2:0] m;
  wire   [2:0] compare;
  wire   [2:0] index;
  wire   [2:0] c_last;
  wire   [2:0] c;

  XNOR2X4 U388 ( .A(n173), .B(N232), .Y(N250) );
  JAM_DW01_inc_0 add_175 ( .A(cnt), .SUM({N415, N414, N413, N412, N411, N410, 
        N409, N408, N407, N406, N405, N404, N403, N402, N401, N400}) );
  JAM_DW01_add_0 add_106 ( .A({1'b0, 1'b0, 1'b0, Cost}), .B(acc), .CI(1'b0), 
        .SUM({N323, N322, N321, N320, N319, N318, N317, N316, N315, N314}) );
  DFFQX1 \index_reg[2]  ( .D(n486), .CK(CLK), .Q(index[2]) );
  DFFQX1 \compare_reg[1]  ( .D(N610), .CK(CLK), .Q(compare[1]) );
  DFFQX1 \compare_reg[2]  ( .D(N611), .CK(CLK), .Q(compare[2]) );
  DFFQX1 \acc_reg[9]  ( .D(N333), .CK(CLK), .Q(acc[9]) );
  DFFQX1 \acc_reg[7]  ( .D(N331), .CK(CLK), .Q(acc[7]) );
  DFFQX1 \acc_reg[8]  ( .D(N332), .CK(CLK), .Q(acc[8]) );
  DFFQX1 \acc_reg[5]  ( .D(N329), .CK(CLK), .Q(acc[5]) );
  DFFTRX1 change1_done_reg ( .D(n992), .RN(n725), .CK(CLK), .Q(change1_done)
         );
  DFFTRX1 next_done_reg ( .D(n367), .RN(n362), .CK(CLK), .Q(next_done) );
  DFFQX1 \acc_reg[1]  ( .D(N325), .CK(CLK), .Q(acc[1]) );
  DFFQX1 \acc_reg[2]  ( .D(N326), .CK(CLK), .Q(acc[2]) );
  DFFQX1 \cnt_reg[5]  ( .D(N437), .CK(CLK), .Q(cnt[5]) );
  EDFFTRX1 \c_last_reg[2]  ( .RN(n740), .D(n994), .E(n953), .CK(CLK), .Q(
        c_last[2]), .QN(n174) );
  DFFQX1 \index_reg[1]  ( .D(n488), .CK(CLK), .Q(index[1]) );
  DFFQX1 \c_last_reg[1]  ( .D(N689), .CK(CLK), .Q(c_last[1]) );
  DFFQX1 \c_last_reg[0]  ( .D(N688), .CK(CLK), .Q(c_last[0]) );
  DFFX1 \index_reg[0]  ( .D(n487), .CK(CLK), .QN(n173) );
  DFFQX1 \m_reg[2]  ( .D(N512), .CK(CLK), .Q(m[2]) );
  DFFQX2 \w_j_reg[7][2]  ( .D(n483), .CK(CLK), .Q(\w_j[7][2] ) );
  DFFQX2 \w_j_reg[7][1]  ( .D(n484), .CK(CLK), .Q(\w_j[7][1] ) );
  DFFQX2 \w_j_reg[7][0]  ( .D(n485), .CK(CLK), .Q(\w_j[7][0] ) );
  DFFQX2 \w_j_reg[4][2]  ( .D(n480), .CK(CLK), .Q(\w_j[4][2] ) );
  DFFQX2 \w_j_reg[4][1]  ( .D(n481), .CK(CLK), .Q(\w_j[4][1] ) );
  DFFQX2 \w_j_reg[4][0]  ( .D(n482), .CK(CLK), .Q(\w_j[4][0] ) );
  DFFQX2 \w_j_reg[1][2]  ( .D(n471), .CK(CLK), .Q(\w_j[1][2] ) );
  DFFQX2 \w_j_reg[1][1]  ( .D(n472), .CK(CLK), .Q(\w_j[1][1] ) );
  DFFQX2 \w_j_reg[1][0]  ( .D(n473), .CK(CLK), .Q(\w_j[1][0] ) );
  DFFQX2 \w_j_reg[2][2]  ( .D(n474), .CK(CLK), .Q(\w_j[2][2] ) );
  DFFQX2 \w_j_reg[2][1]  ( .D(n475), .CK(CLK), .Q(\w_j[2][1] ) );
  DFFQX2 \w_j_reg[2][0]  ( .D(n476), .CK(CLK), .Q(\w_j[2][0] ) );
  DFFQX2 \w_j_reg[3][2]  ( .D(n477), .CK(CLK), .Q(\w_j[3][2] ) );
  DFFQX2 \w_j_reg[3][1]  ( .D(n478), .CK(CLK), .Q(\w_j[3][1] ) );
  DFFQX2 \w_j_reg[3][0]  ( .D(n479), .CK(CLK), .Q(\w_j[3][0] ) );
  DFFQX4 \n_reg[0]  ( .D(n504), .CK(CLK), .Q(N232) );
  DFFQX1 \cnt_reg[6]  ( .D(N438), .CK(CLK), .Q(cnt[6]) );
  DFFQX1 \cnt_reg[15]  ( .D(N447), .CK(CLK), .Q(cnt[15]) );
  DFFQX1 \cnt_reg[7]  ( .D(N439), .CK(CLK), .Q(cnt[7]) );
  DFFQX1 \cnt_reg[0]  ( .D(N432), .CK(CLK), .Q(cnt[0]) );
  DFFQX1 \cnt_reg[9]  ( .D(N441), .CK(CLK), .Q(cnt[9]) );
  DFFQX1 \cnt_reg[14]  ( .D(N446), .CK(CLK), .Q(cnt[14]) );
  DFFQX1 \cnt_reg[4]  ( .D(N436), .CK(CLK), .Q(cnt[4]) );
  DFFQX1 \cnt_reg[8]  ( .D(N440), .CK(CLK), .Q(cnt[8]) );
  DFFQX1 \cnt_reg[1]  ( .D(N433), .CK(CLK), .Q(cnt[1]) );
  DFFQX1 \cnt_reg[10]  ( .D(N442), .CK(CLK), .Q(cnt[10]) );
  DFFQX1 \cnt_reg[13]  ( .D(N445), .CK(CLK), .Q(cnt[13]) );
  DFFQX1 \cnt_reg[3]  ( .D(N435), .CK(CLK), .Q(cnt[3]) );
  DFFQX1 \cnt_reg[2]  ( .D(N434), .CK(CLK), .Q(cnt[2]) );
  DFFQX1 \cnt_reg[11]  ( .D(N443), .CK(CLK), .Q(cnt[11]) );
  DFFQX1 \cnt_reg[12]  ( .D(N444), .CK(CLK), .Q(cnt[12]) );
  DFFQX1 \cs_reg[2]  ( .D(N262), .CK(CLK), .Q(cs[2]) );
  DFFQX1 \acc_reg[4]  ( .D(N328), .CK(CLK), .Q(acc[4]) );
  DFFTRX1 \m_reg[0]  ( .D(n725), .RN(n715), .CK(CLK), .Q(m[0]), .QN(n168) );
  EDFFXL \w_j_reg[6][2]  ( .D(n941), .E(n287), .CK(CLK), .Q(\w_j[6][2] ) );
  EDFFXL \w_j_reg[6][0]  ( .D(n950), .E(n287), .CK(CLK), .Q(\w_j[6][0] ) );
  EDFFXL \w_j_reg[0][0]  ( .D(n951), .E(n209), .CK(CLK), .Q(\w_j[0][0] ) );
  EDFFXL \w_j_reg[5][0]  ( .D(n940), .E(n275), .CK(CLK), .Q(\w_j[5][0] ) );
  EDFFXL \w_j_reg[0][2]  ( .D(n947), .E(n209), .CK(CLK), .Q(\w_j[0][2] ) );
  EDFFXL \w_j_reg[0][1]  ( .D(n949), .E(n209), .CK(CLK), .Q(\w_j[0][1] ) );
  EDFFXL \w_j_reg[5][2]  ( .D(n939), .E(n275), .CK(CLK), .Q(\w_j[5][2] ) );
  EDFFXL \w_j_reg[5][1]  ( .D(n948), .E(n275), .CK(CLK), .Q(\w_j[5][1] ) );
  EDFFXL \w_j_reg[6][1]  ( .D(n942), .E(n287), .CK(CLK), .Q(\w_j[6][1] ) );
  DFFQX1 \n_reg[1]  ( .D(n505), .CK(CLK), .Q(N233) );
  DFFTRXL acc_en_reg ( .D(n379), .RN(n955), .CK(CLK), .Q(acc_en) );
  EDFFTRX1 \compare_reg[0]  ( .RN(n725), .D(n973), .E(N537), .CK(CLK), .Q(
        compare[0]) );
  DFFQX1 \MinCost_reg[3]  ( .D(n499), .CK(CLK), .Q(n1034) );
  DFFQX1 \MinCost_reg[1]  ( .D(n501), .CK(CLK), .Q(n1036) );
  DFFQX1 \MinCost_reg[8]  ( .D(n494), .CK(CLK), .Q(n1029) );
  DFFQX1 \MatchCount_reg[0]  ( .D(n492), .CK(CLK), .Q(n1027) );
  DFFQX1 \MinCost_reg[5]  ( .D(n497), .CK(CLK), .Q(n1032) );
  DFFQX1 \MatchCount_reg[2]  ( .D(n490), .CK(CLK), .Q(n1025) );
  DFFQX1 Valid_reg ( .D(N920), .CK(CLK), .Q(n1038) );
  DFFQX1 \MinCost_reg[2]  ( .D(n500), .CK(CLK), .Q(n1035) );
  DFFQX1 \MinCost_reg[9]  ( .D(n493), .CK(CLK), .Q(n1028) );
  DFFQX1 \MinCost_reg[0]  ( .D(n502), .CK(CLK), .Q(n1037) );
  DFFQX1 \MatchCount_reg[1]  ( .D(n491), .CK(CLK), .Q(n1026) );
  DFFQX1 \MinCost_reg[6]  ( .D(n496), .CK(CLK), .Q(n1031) );
  DFFQX1 \MatchCount_reg[3]  ( .D(n489), .CK(CLK), .Q(n1024) );
  DFFQX1 \MinCost_reg[7]  ( .D(n495), .CK(CLK), .Q(n1030) );
  DFFTRX1 \cs_reg[0]  ( .D(n957), .RN(n379), .CK(CLK), .Q(n698), .QN(n116) );
  DFFX1 \i_reg[1]  ( .D(N305), .CK(CLK), .Q(N230), .QN(n758) );
  DFFX1 \c_reg[0]  ( .D(N703), .CK(CLK), .Q(c[0]), .QN(N253) );
  DFFX1 \MinCost_reg[4]  ( .D(n498), .CK(CLK), .Q(n1033), .QN(n136) );
  DFFX1 \acc_reg[0]  ( .D(N324), .CK(CLK), .Q(acc[0]), .QN(n133) );
  DFFX1 \acc_reg[6]  ( .D(N330), .CK(CLK), .Q(acc[6]), .QN(n125) );
  DFFX1 \acc_reg[3]  ( .D(N327), .CK(CLK), .Q(acc[3]), .QN(n130) );
  DFFX1 \i_reg[0]  ( .D(N304), .CK(CLK), .Q(N229), .QN(n759) );
  DFFXL cost_done_reg ( .D(N340), .CK(CLK), .Q(cost_done), .QN(n972) );
  DFFQX2 \c_reg[1]  ( .D(N704), .CK(CLK), .Q(n902) );
  DFFX2 \c_reg[2]  ( .D(N705), .CK(CLK), .Q(c[2]), .QN(n1003) );
  DFFTRX2 \cs_reg[1]  ( .D(n443), .RN(n740), .CK(CLK), .Q(cs[1]), .QN(n115) );
  DFFQX4 \n_reg[2]  ( .D(n503), .CK(CLK), .Q(N234) );
  DFFQX1 \i_reg[2]  ( .D(n956), .CK(CLK), .Q(N231) );
  DFFQX1 \m_reg[1]  ( .D(N511), .CK(CLK), .Q(m[1]) );
  OAI22X1 U648 ( .A0(n814), .A1(n800), .B0(n722), .B1(n799), .Y(N545) );
  NAND2X2 U649 ( .A(n701), .B(n451), .Y(n442) );
  AOI221X1 U650 ( .A0(n190), .A1(n258), .B0(n991), .B1(n192), .C0(n259), .Y(
        n257) );
  AOI221X1 U651 ( .A0(n190), .A1(n246), .B0(n987), .B1(n192), .C0(n247), .Y(
        n245) );
  AOI221X1 U652 ( .A0(n190), .A1(n219), .B0(n985), .B1(n192), .C0(n220), .Y(
        n218) );
  AOI221X1 U653 ( .A0(n190), .A1(n234), .B0(n986), .B1(n192), .C0(n235), .Y(
        n233) );
  NOR2X2 U654 ( .A(n738), .B(m[1]), .Y(n468) );
  OAI2BB1X1 U655 ( .A0N(n980), .A1N(N544), .B0(n412), .Y(n410) );
  CLKINVX1 U656 ( .A(n1031), .Y(n1014) );
  CLKINVX1 U657 ( .A(n1026), .Y(n1016) );
  CLKINVX1 U658 ( .A(n1025), .Y(n1017) );
  NAND2X2 U659 ( .A(n434), .B(n957), .Y(n368) );
  AOI221X1 U660 ( .A0(change1_done), .A1(n116), .B0(n972), .B1(n971), .C0(n450), .Y(n445) );
  CLKBUFX3 U661 ( .A(n429), .Y(n727) );
  OAI221X1 U662 ( .A0(n276), .A1(n954), .B0(n211), .B1(n270), .C0(n277), .Y(
        n275) );
  OAI221X1 U663 ( .A0(n210), .A1(n954), .B0(n211), .B1(n194), .C0(n212), .Y(
        n209) );
  OAI221X1 U664 ( .A0(n288), .A1(n954), .B0(n211), .B1(n282), .C0(n289), .Y(
        n287) );
  OA22X1 U665 ( .A0(n777), .A1(n923), .B0(N232), .B1(n922), .Y(n677) );
  OR3X2 U666 ( .A(compare[1]), .B(compare[0]), .C(compare[2]), .Y(n678) );
  CLKBUFX3 U667 ( .A(N233), .Y(n738) );
  NOR2X2 U668 ( .A(n902), .B(c[0]), .Y(n898) );
  NOR2X2 U669 ( .A(n902), .B(N253), .Y(n899) );
  INVXL U670 ( .A(n902), .Y(N254) );
  OA22XL U671 ( .A0(n867), .A1(n822), .B0(n722), .B1(n821), .Y(n710) );
  INVXL U672 ( .A(n722), .Y(n796) );
  INVX1 U673 ( .A(n722), .Y(n867) );
  OAI22X1 U674 ( .A0(n867), .A1(n857), .B0(n722), .B1(n856), .Y(N621) );
  XOR2X1 U675 ( .A(n1028), .B(acc[9]), .Y(n336) );
  OAI22X1 U676 ( .A0(n814), .A1(n840), .B0(n722), .B1(n839), .Y(N588) );
  XNOR2X1 U677 ( .A(n1034), .B(n130), .Y(n333) );
  OR2X1 U678 ( .A(n368), .B(n759), .Y(n1020) );
  INVX12 U679 ( .A(n1020), .Y(W[0]) );
  BUFX16 U680 ( .A(n1030), .Y(MinCost[7]) );
  XOR2XL U681 ( .A(MinCost[7]), .B(acc[7]), .Y(n329) );
  OAI22X1 U682 ( .A0(n793), .A1(n796), .B0(n722), .B1(n792), .Y(N520) );
  OAI22X1 U683 ( .A0(n993), .A1(n926), .B0(N232), .B1(n925), .Y(N749) );
  OR2X1 U684 ( .A(n757), .B(n368), .Y(n1018) );
  INVX12 U685 ( .A(n1018), .Y(W[2]) );
  BUFX16 U686 ( .A(n1024), .Y(MatchCount[3]) );
  INVX12 U687 ( .A(n1014), .Y(MinCost[6]) );
  INVX12 U688 ( .A(n1016), .Y(MatchCount[1]) );
  BUFX16 U689 ( .A(n1037), .Y(MinCost[0]) );
  BUFX16 U690 ( .A(n1028), .Y(MinCost[9]) );
  BUFX12 U691 ( .A(n1035), .Y(MinCost[2]) );
  XOR2XL U692 ( .A(n1035), .B(acc[2]), .Y(n328) );
  OAI22X1 U693 ( .A0(n796), .A1(n785), .B0(n722), .B1(n784), .Y(N521) );
  BUFX12 U694 ( .A(n1038), .Y(Valid) );
  BUFX12 U695 ( .A(n1033), .Y(MinCost[4]) );
  OAI22X1 U696 ( .A0(n933), .A1(n993), .B0(N232), .B1(n932), .Y(N750) );
  OR2X1 U697 ( .A(n758), .B(n368), .Y(n1019) );
  INVX12 U698 ( .A(n1019), .Y(W[1]) );
  INVX12 U699 ( .A(n1017), .Y(MatchCount[2]) );
  BUFX16 U700 ( .A(n1032), .Y(MinCost[5]) );
  XOR2XL U701 ( .A(MinCost[5]), .B(acc[5]), .Y(n334) );
  INVX12 U702 ( .A(n1015), .Y(MatchCount[0]) );
  INVX3 U703 ( .A(n1027), .Y(n1015) );
  BUFX16 U704 ( .A(n1029), .Y(MinCost[8]) );
  XOR2XL U705 ( .A(MinCost[8]), .B(acc[8]), .Y(n338) );
  BUFX12 U706 ( .A(n1036), .Y(MinCost[1]) );
  XOR2XL U707 ( .A(n1036), .B(acc[1]), .Y(n335) );
  BUFX12 U708 ( .A(n1034), .Y(MinCost[3]) );
  AO21X2 U709 ( .A0(n738), .A1(m[1]), .B0(n468), .Y(n469) );
  OAI21X4 U710 ( .A0(N544), .A1(n980), .B0(n720), .Y(n412) );
  CLKINVX8 U711 ( .A(n409), .Y(n980) );
  CLKINVX1 U712 ( .A(n399), .Y(n974) );
  NAND2BX1 U713 ( .AN(n369), .B(n379), .Y(n378) );
  CLKINVX1 U714 ( .A(n701), .Y(n211) );
  INVX3 U715 ( .A(n705), .Y(N248) );
  NOR2X1 U716 ( .A(n974), .B(n678), .Y(n383) );
  INVX3 U717 ( .A(RST), .Y(n957) );
  CLKINVX1 U718 ( .A(n971), .Y(n697) );
  NAND2X1 U719 ( .A(n699), .B(n344), .Y(n450) );
  OR3X2 U720 ( .A(n702), .B(n703), .C(n704), .Y(n379) );
  NAND3X1 U721 ( .A(n697), .B(n442), .C(n698), .Y(n699) );
  CLKINVX1 U722 ( .A(cs[2]), .Y(n971) );
  NAND2X1 U723 ( .A(n116), .B(n971), .Y(n344) );
  NAND2BXL U724 ( .AN(n369), .B(n379), .Y(n700) );
  NOR2BX4 U725 ( .AN(n431), .B(RST), .Y(n701) );
  NOR2X1 U726 ( .A(n445), .B(cs[1]), .Y(n702) );
  AO22X1 U727 ( .A0(n974), .A1(N589), .B0(n383), .B1(N567), .Y(n401) );
  AO22X1 U728 ( .A0(n974), .A1(n397), .B0(n391), .B1(n383), .Y(n402) );
  INVX3 U729 ( .A(n226), .Y(n954) );
  NOR2X1 U730 ( .A(next_done), .B(n364), .Y(n704) );
  NOR2X1 U731 ( .A(n441), .B(n344), .Y(n703) );
  OAI211XL U732 ( .A0(n228), .A1(N232), .B0(n740), .C0(n229), .Y(n227) );
  OAI211XL U733 ( .A0(n228), .A1(n993), .B0(n740), .C0(n242), .Y(n241) );
  INVXL U734 ( .A(n700), .Y(n953) );
  NAND2XL U735 ( .A(n700), .B(n957), .Y(n377) );
  NOR2X4 U736 ( .A(n378), .B(RST), .Y(n226) );
  OAI22X1 U737 ( .A0(n814), .A1(n804), .B0(n722), .B1(n803), .Y(N544) );
  BUFX2 U738 ( .A(n677), .Y(n719) );
  NOR3X1 U739 ( .A(n711), .B(n712), .C(n713), .Y(n441) );
  AOI221XL U740 ( .A0(compare[0]), .A1(n399), .B0(n401), .B1(n719), .C0(n402), 
        .Y(n400) );
  NOR2BXL U741 ( .AN(N398), .B(n430), .Y(n429) );
  XOR2X1 U742 ( .A(n469), .B(n470), .Y(n705) );
  INVX3 U743 ( .A(N232), .Y(n993) );
  OAI32XL U744 ( .A0(n336), .A1(MinCost[8]), .A2(n1012), .B0(MinCost[9]), .B1(
        n1013), .Y(n345) );
  OA22XL U745 ( .A0(MinCost[7]), .A1(n1011), .B0(n348), .B1(n329), .Y(n708) );
  AOI31XL U746 ( .A0(n213), .A1(n230), .A2(n724), .B0(RST), .Y(n277) );
  AOI31XL U747 ( .A0(n214), .A1(n962), .A2(n724), .B0(RST), .Y(n289) );
  AOI31XL U748 ( .A0(n213), .A1(n961), .A2(n214), .B0(RST), .Y(n212) );
  XOR2XL U749 ( .A(MinCost[0]), .B(n133), .Y(n337) );
  INVX1 U750 ( .A(n279), .Y(n941) );
  INVX1 U751 ( .A(n267), .Y(n939) );
  INVX1 U752 ( .A(n189), .Y(n947) );
  INVX1 U753 ( .A(n285), .Y(n950) );
  INVX1 U754 ( .A(n283), .Y(n942) );
  INVX1 U755 ( .A(n273), .Y(n940) );
  INVX1 U756 ( .A(n271), .Y(n948) );
  INVX1 U757 ( .A(n203), .Y(n951) );
  INVX1 U758 ( .A(n197), .Y(n949) );
  INVXL U759 ( .A(n379), .Y(n952) );
  XOR2XL U760 ( .A(n409), .B(n413), .Y(n407) );
  NOR2BXL U761 ( .AN(N537), .B(n399), .Y(n380) );
  BUFX2 U762 ( .A(n982), .Y(n720) );
  OAI2BB1XL U763 ( .A0N(n981), .A1N(N521), .B0(n417), .Y(n414) );
  AOI22XL U764 ( .A0(n383), .A1(n384), .B0(n974), .B1(n385), .Y(n381) );
  AOI22XL U765 ( .A0(n383), .A1(n394), .B0(n974), .B1(n395), .Y(n393) );
  OAI211XL U766 ( .A0(n998), .A1(n377), .B0(n254), .C0(n228), .Y(N689) );
  OAI2BB1XL U767 ( .A0N(n710), .A1N(n391), .B0(n720), .Y(n392) );
  CLKINVX1 U768 ( .A(n723), .Y(n988) );
  NAND2X1 U769 ( .A(n231), .B(n1003), .Y(n270) );
  NAND3X1 U770 ( .A(n1002), .B(n1003), .C(n739), .Y(n282) );
  INVX1 U771 ( .A(n400), .Y(n973) );
  CLKBUFX3 U772 ( .A(N249), .Y(n722) );
  OAI32XL U773 ( .A0(n168), .A1(n468), .A2(n993), .B0(n995), .B1(n996), .Y(
        n466) );
  NOR2XL U774 ( .A(N234), .B(n738), .Y(n927) );
  XOR2XL U775 ( .A(m[0]), .B(N232), .Y(N247) );
  INVX1 U776 ( .A(m[1]), .Y(n996) );
  AO22XL U777 ( .A0(\w_j[1][1] ), .A1(n807), .B0(n736), .B1(n806), .Y(n802) );
  AO22XL U778 ( .A0(n720), .A1(N490), .B0(N491), .B1(n719), .Y(n426) );
  NAND3XL U779 ( .A(n701), .B(n373), .C(n374), .Y(n371) );
  NAND3XL U780 ( .A(n442), .B(n115), .C(cs[2]), .Y(n439) );
  OAI2BB1XL U781 ( .A0N(N232), .A1N(n362), .B0(n363), .Y(n366) );
  NOR2X1 U782 ( .A(n364), .B(RST), .Y(n362) );
  NOR2XL U783 ( .A(n738), .B(n902), .Y(n458) );
  AOI21XL U784 ( .A0(n168), .A1(n725), .B0(N655), .Y(n422) );
  NOR2XL U785 ( .A(n963), .B(n993), .Y(n460) );
  AO21XL U786 ( .A0(n902), .A1(n738), .B0(n458), .Y(n459) );
  NOR2XL U787 ( .A(n738), .B(index[1]), .Y(n463) );
  AO21XL U788 ( .A0(n738), .A1(index[1]), .B0(n463), .Y(n464) );
  NOR2XL U789 ( .A(n993), .B(n173), .Y(n465) );
  CLKINVX1 U790 ( .A(n902), .Y(n1002) );
  OAI32XL U791 ( .A0(n173), .A1(n463), .A2(n993), .B0(n995), .B1(n1001), .Y(
        n461) );
  OAI32XL U792 ( .A0(n993), .A1(n963), .A2(n458), .B0(n1002), .B1(n995), .Y(
        n456) );
  NAND3X1 U793 ( .A(n698), .B(n971), .C(cs[1]), .Y(n364) );
  INVXL U794 ( .A(N232), .Y(n777) );
  NAND2X1 U795 ( .A(cs[2]), .B(n116), .Y(n369) );
  CLKINVX1 U796 ( .A(compare[1]), .Y(n976) );
  CLKINVX1 U797 ( .A(compare[2]), .Y(n977) );
  NAND3X1 U798 ( .A(n902), .B(c[2]), .C(n739), .Y(n194) );
  CLKINVX1 U799 ( .A(n317), .Y(n943) );
  CLKINVX1 U800 ( .A(n234), .Y(n986) );
  NOR2X2 U801 ( .A(n983), .B(n954), .Y(n192) );
  NOR2X2 U802 ( .A(n720), .B(n954), .Y(n199) );
  CLKAND2X3 U803 ( .A(n430), .B(n957), .Y(n428) );
  NOR2X1 U804 ( .A(n211), .B(N256), .Y(n214) );
  AND2X2 U805 ( .A(N256), .B(n701), .Y(n230) );
  NAND2X1 U806 ( .A(n1004), .B(n957), .Y(n317) );
  CLKINVX1 U807 ( .A(n419), .Y(n981) );
  CLKINVX1 U808 ( .A(n310), .Y(n978) );
  CLKINVX1 U809 ( .A(n397), .Y(n979) );
  CLKINVX1 U810 ( .A(n368), .Y(n955) );
  CLKINVX1 U811 ( .A(n327), .Y(n1004) );
  CLKINVX1 U812 ( .A(N256), .Y(n919) );
  NAND3X1 U813 ( .A(n884), .B(n988), .C(N251), .Y(n234) );
  CLKINVX1 U814 ( .A(n246), .Y(n987) );
  CLKINVX1 U815 ( .A(n258), .Y(n991) );
  CLKINVX1 U816 ( .A(n219), .Y(n985) );
  CLKINVX1 U817 ( .A(n236), .Y(n968) );
  CLKINVX1 U818 ( .A(n293), .Y(n960) );
  CLKINVX1 U819 ( .A(n248), .Y(n959) );
  CLKINVX1 U820 ( .A(n191), .Y(n984) );
  CLKINVX1 U821 ( .A(n268), .Y(n990) );
  CLKINVX1 U822 ( .A(n280), .Y(n989) );
  CLKINVX1 U823 ( .A(n270), .Y(n964) );
  CLKINVX1 U824 ( .A(n282), .Y(n967) );
  CLKINVX1 U825 ( .A(n423), .Y(n992) );
  CLKINVX1 U826 ( .A(n215), .Y(n994) );
  AOI221X4 U827 ( .A0(n701), .A1(n966), .B0(n226), .B1(n991), .C0(n265), .Y(
        n256) );
  OAI211X1 U828 ( .A0(n254), .A1(n993), .B0(n740), .C0(n266), .Y(n265) );
  NAND3X1 U829 ( .A(n724), .B(n214), .C(n213), .Y(n266) );
  AOI221X4 U830 ( .A0(n701), .A1(n968), .B0(n226), .B1(n986), .C0(n241), .Y(
        n232) );
  NAND3X1 U831 ( .A(n214), .B(n962), .C(n961), .Y(n242) );
  NAND3X1 U832 ( .A(n738), .B(n776), .C(n226), .Y(n228) );
  NOR2X2 U833 ( .A(n719), .B(n954), .Y(n205) );
  AND3X2 U834 ( .A(n298), .B(n957), .C(n299), .Y(n290) );
  AOI32X1 U835 ( .A0(n230), .A1(n962), .A2(n724), .B0(n960), .B1(n701), .Y(
        n299) );
  NAND4X1 U836 ( .A(n723), .B(n226), .C(N251), .D(N250), .Y(n298) );
  NAND2X1 U837 ( .A(n952), .B(n431), .Y(n430) );
  OAI2BB2XL U838 ( .B0(n726), .B1(n1007), .A0N(N316), .A1N(n433), .Y(N326) );
  OAI2BB2XL U839 ( .B0(n726), .B1(n1005), .A0N(N315), .A1N(n433), .Y(N325) );
  OAI2BB2XL U840 ( .B0(n726), .B1(n1010), .A0N(N319), .A1N(n433), .Y(N329) );
  OAI2BB2XL U841 ( .B0(n726), .B1(n1008), .A0N(N318), .A1N(n433), .Y(N328) );
  OAI21XL U842 ( .A0(n999), .A1(n377), .B0(n228), .Y(N688) );
  CLKBUFX3 U843 ( .A(n432), .Y(n726) );
  AOI2BB1X1 U844 ( .A0N(n952), .A1N(n435), .B0(n725), .Y(n432) );
  NAND2X1 U845 ( .A(n443), .B(n957), .Y(n435) );
  AOI221XL U846 ( .A0(n204), .A1(n268), .B0(n990), .B1(n205), .C0(n274), .Y(
        n273) );
  OAI221XL U847 ( .A0(n964), .A1(n208), .B0(n207), .B1(n270), .C0(n957), .Y(
        n274) );
  AOI221XL U848 ( .A0(n198), .A1(n268), .B0(n990), .B1(n199), .C0(n272), .Y(
        n271) );
  OAI22XL U849 ( .A0(n201), .A1(n270), .B0(n964), .B1(n202), .Y(n272) );
  AOI221XL U850 ( .A0(n190), .A1(n268), .B0(n990), .B1(n192), .C0(n269), .Y(
        n267) );
  OAI221XL U851 ( .A0(n964), .A1(n196), .B0(n195), .B1(n270), .C0(n957), .Y(
        n269) );
  AOI221XL U852 ( .A0(n204), .A1(n191), .B0(n205), .B1(n984), .C0(n206), .Y(
        n203) );
  OAI22XL U853 ( .A0(n194), .A1(n207), .B0(n969), .B1(n208), .Y(n206) );
  AOI221XL U854 ( .A0(n198), .A1(n191), .B0(n199), .B1(n984), .C0(n200), .Y(
        n197) );
  OAI22XL U855 ( .A0(n194), .A1(n201), .B0(n969), .B1(n202), .Y(n200) );
  AOI221XL U856 ( .A0(n190), .A1(n191), .B0(n984), .B1(n192), .C0(n193), .Y(
        n189) );
  OAI22XL U857 ( .A0(n194), .A1(n195), .B0(n969), .B1(n196), .Y(n193) );
  AOI221XL U858 ( .A0(n204), .A1(n280), .B0(n989), .B1(n205), .C0(n286), .Y(
        n285) );
  OAI22XL U859 ( .A0(n207), .A1(n282), .B0(n967), .B1(n208), .Y(n286) );
  AOI221XL U860 ( .A0(n198), .A1(n280), .B0(n989), .B1(n199), .C0(n284), .Y(
        n283) );
  OAI221XL U861 ( .A0(n967), .A1(n202), .B0(n201), .B1(n282), .C0(n957), .Y(
        n284) );
  AOI221XL U862 ( .A0(n190), .A1(n280), .B0(n989), .B1(n192), .C0(n281), .Y(
        n279) );
  OAI221XL U863 ( .A0(n967), .A1(n196), .B0(n195), .B1(n282), .C0(n957), .Y(
        n281) );
  NOR2X1 U864 ( .A(n719), .B(N545), .Y(n409) );
  XOR2XL U865 ( .A(N749), .B(N544), .Y(n413) );
  XNOR2X1 U866 ( .A(n410), .B(n411), .Y(n408) );
  XOR2XL U867 ( .A(N750), .B(N543), .Y(n411) );
  INVXL U868 ( .A(N749), .Y(n982) );
  OR2X1 U869 ( .A(n408), .B(n977), .Y(n406) );
  INVX1 U870 ( .A(N750), .Y(n983) );
  AO21X1 U871 ( .A0(n719), .A1(N522), .B0(n419), .Y(N533) );
  XOR2X1 U872 ( .A(n981), .B(n418), .Y(N534) );
  OAI22XL U873 ( .A0(N520), .A1(n414), .B0(n415), .B1(n983), .Y(N536) );
  XOR2X1 U874 ( .A(n310), .B(n314), .Y(n308) );
  XOR2XL U875 ( .A(N749), .B(N621), .Y(n314) );
  XOR2XL U876 ( .A(N521), .B(n720), .Y(n418) );
  NOR2X1 U877 ( .A(n719), .B(N622), .Y(n310) );
  OAI21XL U878 ( .A0(N621), .A1(n978), .B0(n720), .Y(n313) );
  XNOR2X1 U879 ( .A(n311), .B(n312), .Y(n309) );
  XOR2XL U880 ( .A(N750), .B(N620), .Y(n312) );
  OAI2BB1XL U881 ( .A0N(n978), .A1N(N621), .B0(n313), .Y(n311) );
  AOI2BB1X1 U882 ( .A0N(n975), .A1N(n958), .B0(n701), .Y(n300) );
  NOR2X1 U883 ( .A(n719), .B(N522), .Y(n419) );
  AOI32X1 U884 ( .A0(n307), .A1(n976), .A2(n308), .B0(n309), .B1(n977), .Y(
        n306) );
  XNOR2X1 U885 ( .A(n414), .B(n416), .Y(N535) );
  XOR2XL U886 ( .A(N750), .B(N520), .Y(n416) );
  OAI211X1 U887 ( .A0(n215), .A1(n359), .B0(n360), .C0(n361), .Y(n503) );
  AOI2BB2X1 U888 ( .B0(n362), .B1(n278), .A0N(n946), .A1N(n934), .Y(n361) );
  OAI211X1 U889 ( .A0(n363), .A1(n993), .B0(n359), .C0(n360), .Y(n504) );
  NAND2X1 U890 ( .A(n975), .B(n725), .Y(n301) );
  NAND3BX1 U891 ( .AN(n367), .B(n993), .C(n362), .Y(n359) );
  OAI21XL U892 ( .A0(N521), .A1(n981), .B0(n720), .Y(n417) );
  NAND2X1 U893 ( .A(N537), .B(n725), .Y(n382) );
  CLKINVX1 U894 ( .A(n725), .Y(n958) );
  OAI22XL U895 ( .A0(n300), .A1(n1001), .B0(n301), .B1(n996), .Y(n488) );
  OAI32X1 U896 ( .A0(n958), .A1(n380), .A2(n976), .B0(n393), .B1(n382), .Y(
        N610) );
  XOR2X1 U897 ( .A(n979), .B(n396), .Y(n395) );
  XNOR2X1 U898 ( .A(n391), .B(n398), .Y(n394) );
  OAI32X1 U899 ( .A0(n958), .A1(n380), .A2(n977), .B0(n381), .B1(n382), .Y(
        N611) );
  XOR2X1 U900 ( .A(n389), .B(n390), .Y(n384) );
  XOR2X1 U901 ( .A(n386), .B(n387), .Y(n385) );
  NAND3X1 U902 ( .A(n364), .B(n957), .C(n365), .Y(n360) );
  CLKINVX1 U903 ( .A(n342), .Y(n945) );
  NOR2X1 U904 ( .A(n371), .B(n739), .Y(N703) );
  AND2XL U905 ( .A(n414), .B(N520), .Y(n415) );
  AND2X2 U906 ( .A(N489), .B(n983), .Y(n425) );
  CLKBUFX3 U907 ( .A(n341), .Y(n728) );
  OAI211X1 U908 ( .A0(n343), .A1(n324), .B0(n321), .C0(n957), .Y(n341) );
  NOR2X1 U909 ( .A(n372), .B(n371), .Y(N704) );
  AOI21X1 U910 ( .A0(n739), .A1(n1002), .B0(n231), .Y(n372) );
  CLKBUFX3 U911 ( .A(n957), .Y(n740) );
  OR2X1 U912 ( .A(n309), .B(n977), .Y(n307) );
  CLKINVX1 U913 ( .A(N248), .Y(n795) );
  CLKINVX1 U914 ( .A(n721), .Y(n866) );
  CLKINVX1 U915 ( .A(n721), .Y(n813) );
  CLKINVX1 U916 ( .A(n721), .Y(n794) );
  AND2X2 U917 ( .A(n365), .B(n706), .Y(n363) );
  NAND2X1 U918 ( .A(n367), .B(n362), .Y(n706) );
  XOR2XL U919 ( .A(n710), .B(N749), .Y(n398) );
  XOR2XL U920 ( .A(N588), .B(n720), .Y(n396) );
  NOR2X1 U921 ( .A(n719), .B(N567), .Y(n391) );
  OAI2BB1XL U922 ( .A0N(n979), .A1N(N588), .B0(n388), .Y(n386) );
  OAI21XL U923 ( .A0(N588), .A1(n979), .B0(n720), .Y(n388) );
  NOR2X1 U924 ( .A(n719), .B(N589), .Y(n397) );
  INVX3 U925 ( .A(n738), .Y(n995) );
  OAI21XL U926 ( .A0(n328), .A1(n333), .B0(n1006), .Y(n351) );
  OAI21XL U927 ( .A0(n391), .A1(n710), .B0(n392), .Y(n389) );
  CLKINVX1 U928 ( .A(n722), .Y(n814) );
  CLKINVX1 U929 ( .A(N248), .Y(n832) );
  CLKINVX1 U930 ( .A(n721), .Y(n831) );
  CLKINVX1 U931 ( .A(n721), .Y(n849) );
  CLKXOR2X2 U932 ( .A(n963), .B(n993), .Y(N256) );
  XOR2X1 U933 ( .A(n999), .B(n739), .Y(n376) );
  CLKINVX1 U934 ( .A(n739), .Y(n963) );
  CLKINVX1 U935 ( .A(n216), .Y(N251) );
  NAND4BBXL U936 ( .AN(n328), .BN(n329), .C(n330), .D(n331), .Y(n327) );
  NOR3X1 U937 ( .A(n338), .B(n339), .C(n340), .Y(n330) );
  NOR4X1 U938 ( .A(n332), .B(n333), .C(n334), .D(n335), .Y(n331) );
  NAND2BX1 U939 ( .AN(n336), .B(n337), .Y(n332) );
  CLKINVX1 U940 ( .A(N250), .Y(n884) );
  NAND3X1 U941 ( .A(N250), .B(n988), .C(N251), .Y(n246) );
  NAND3X1 U942 ( .A(n216), .B(n884), .C(n723), .Y(n258) );
  NAND3X1 U943 ( .A(n216), .B(n988), .C(N250), .Y(n219) );
  CLKINVX1 U944 ( .A(n213), .Y(n962) );
  CLKINVX1 U945 ( .A(n724), .Y(n961) );
  CLKINVX1 U946 ( .A(n723), .Y(n885) );
  CLKINVX1 U947 ( .A(n724), .Y(n920) );
  NAND3X1 U948 ( .A(n216), .B(N250), .C(n723), .Y(n268) );
  NAND3X1 U949 ( .A(n216), .B(n884), .C(n988), .Y(n191) );
  NAND2X1 U950 ( .A(n243), .B(n739), .Y(n236) );
  NAND2X1 U951 ( .A(n243), .B(n963), .Y(n248) );
  NAND3X1 U952 ( .A(N248), .B(n721), .C(n722), .Y(n423) );
  NOR2X1 U953 ( .A(n1002), .B(n739), .Y(n231) );
  NAND3X1 U954 ( .A(n1002), .B(n1003), .C(n963), .Y(n293) );
  CLKINVX1 U955 ( .A(n260), .Y(n966) );
  NAND3X1 U956 ( .A(n884), .B(N251), .C(n723), .Y(n280) );
  CLKINVX1 U957 ( .A(n221), .Y(n965) );
  NOR2X1 U958 ( .A(n776), .B(n995), .Y(n278) );
  NAND2X1 U959 ( .A(n995), .B(n776), .Y(n215) );
  CLKINVX1 U960 ( .A(n194), .Y(n969) );
  AOI221X4 U961 ( .A0(n701), .A1(n959), .B0(n226), .B1(n987), .C0(n253), .Y(
        n244) );
  OAI211X1 U962 ( .A0(n254), .A1(N232), .B0(n740), .C0(n255), .Y(n253) );
  NAND3X1 U963 ( .A(n230), .B(n962), .C(n961), .Y(n255) );
  AOI221X4 U964 ( .A0(n701), .A1(n965), .B0(n226), .B1(n985), .C0(n227), .Y(
        n217) );
  NAND3X1 U965 ( .A(n230), .B(n961), .C(n213), .Y(n229) );
  NAND3X1 U966 ( .A(N234), .B(n995), .C(n226), .Y(n254) );
  OAI2BB2XL U967 ( .B0(n256), .B1(n263), .A0N(\w_j[4][0] ), .A1N(n256), .Y(
        n482) );
  AOI221XL U968 ( .A0(n204), .A1(n258), .B0(n991), .B1(n205), .C0(n264), .Y(
        n263) );
  OAI22XL U969 ( .A0(n207), .A1(n260), .B0(n966), .B1(n208), .Y(n264) );
  OAI2BB2XL U970 ( .B0(n256), .B1(n261), .A0N(\w_j[4][1] ), .A1N(n256), .Y(
        n481) );
  AOI221XL U971 ( .A0(n198), .A1(n258), .B0(n991), .B1(n199), .C0(n262), .Y(
        n261) );
  OAI22XL U972 ( .A0(n201), .A1(n260), .B0(n966), .B1(n202), .Y(n262) );
  OAI2BB2XL U973 ( .B0(n256), .B1(n257), .A0N(\w_j[4][2] ), .A1N(n256), .Y(
        n480) );
  OAI221XL U974 ( .A0(n966), .A1(n196), .B0(n195), .B1(n260), .C0(n957), .Y(
        n259) );
  OAI2BB2XL U975 ( .B0(n244), .B1(n251), .A0N(\w_j[3][0] ), .A1N(n244), .Y(
        n479) );
  AOI221XL U976 ( .A0(n204), .A1(n246), .B0(n987), .B1(n205), .C0(n252), .Y(
        n251) );
  OAI221XL U977 ( .A0(n959), .A1(n208), .B0(n207), .B1(n248), .C0(n740), .Y(
        n252) );
  OAI2BB2XL U978 ( .B0(n244), .B1(n249), .A0N(\w_j[3][1] ), .A1N(n244), .Y(
        n478) );
  AOI221XL U979 ( .A0(n198), .A1(n246), .B0(n987), .B1(n199), .C0(n250), .Y(
        n249) );
  OAI221XL U980 ( .A0(n959), .A1(n202), .B0(n201), .B1(n248), .C0(n740), .Y(
        n250) );
  OAI2BB2XL U981 ( .B0(n244), .B1(n245), .A0N(\w_j[3][2] ), .A1N(n244), .Y(
        n477) );
  OAI22XL U982 ( .A0(n195), .A1(n248), .B0(n959), .B1(n196), .Y(n247) );
  OAI2BB2XL U983 ( .B0(n232), .B1(n239), .A0N(\w_j[2][0] ), .A1N(n232), .Y(
        n476) );
  AOI221XL U984 ( .A0(n204), .A1(n234), .B0(n986), .B1(n205), .C0(n240), .Y(
        n239) );
  OAI22XL U985 ( .A0(n207), .A1(n236), .B0(n968), .B1(n208), .Y(n240) );
  OAI2BB2XL U986 ( .B0(n232), .B1(n237), .A0N(\w_j[2][1] ), .A1N(n232), .Y(
        n475) );
  AOI221XL U987 ( .A0(n198), .A1(n234), .B0(n986), .B1(n199), .C0(n238), .Y(
        n237) );
  OAI221XL U988 ( .A0(n968), .A1(n202), .B0(n201), .B1(n236), .C0(n740), .Y(
        n238) );
  OAI2BB2XL U989 ( .B0(n232), .B1(n233), .A0N(\w_j[2][2] ), .A1N(n232), .Y(
        n474) );
  OAI22XL U990 ( .A0(n195), .A1(n236), .B0(n968), .B1(n196), .Y(n235) );
  OAI2BB2XL U991 ( .B0(n217), .B1(n224), .A0N(\w_j[1][0] ), .A1N(n217), .Y(
        n473) );
  AOI221XL U992 ( .A0(n204), .A1(n219), .B0(n985), .B1(n205), .C0(n225), .Y(
        n224) );
  OAI221XL U993 ( .A0(n965), .A1(n208), .B0(n207), .B1(n221), .C0(n740), .Y(
        n225) );
  OAI2BB2XL U994 ( .B0(n217), .B1(n222), .A0N(\w_j[1][1] ), .A1N(n217), .Y(
        n472) );
  AOI221XL U995 ( .A0(n198), .A1(n219), .B0(n985), .B1(n199), .C0(n223), .Y(
        n222) );
  OAI22XL U996 ( .A0(n201), .A1(n221), .B0(n965), .B1(n202), .Y(n223) );
  OAI2BB2XL U997 ( .B0(n217), .B1(n218), .A0N(\w_j[1][2] ), .A1N(n217), .Y(
        n471) );
  OAI22XL U998 ( .A0(n195), .A1(n221), .B0(n965), .B1(n196), .Y(n220) );
  OAI33X1 U999 ( .A0(c_last[0]), .A1(c_last[2]), .A2(c_last[1]), .B0(n452), 
        .B1(n376), .B2(n453), .Y(n451) );
  XOR2X1 U1000 ( .A(n1003), .B(n455), .Y(n452) );
  XOR2X1 U1001 ( .A(n1002), .B(n454), .Y(n453) );
  AOI21X1 U1002 ( .A0(n278), .A1(N232), .B0(n989), .Y(n288) );
  AOI21X1 U1003 ( .A0(n278), .A1(n993), .B0(n990), .Y(n276) );
  AOI2BB1X1 U1004 ( .A0N(n215), .A1N(n993), .B0(n984), .Y(n210) );
  NOR2BX2 U1005 ( .AN(N730), .B(n954), .Y(n204) );
  NOR2BX2 U1006 ( .AN(N729), .B(n954), .Y(n198) );
  NOR2BX2 U1007 ( .AN(N728), .B(n954), .Y(n190) );
  NOR3X1 U1008 ( .A(cs[1]), .B(cs[2]), .C(n116), .Y(n434) );
  CLKINVX1 U1009 ( .A(n436), .Y(n956) );
  AOI222XL U1010 ( .A0(N231), .A1(N304), .B0(W[1]), .B1(n437), .C0(n758), .C1(
        W[2]), .Y(n436) );
  NOR2X1 U1011 ( .A(n759), .B(N231), .Y(n437) );
  OAI2BB2XL U1012 ( .B0(n726), .B1(n1011), .A0N(N321), .A1N(n433), .Y(N331) );
  OAI2BB2XL U1013 ( .B0(n290), .B1(n291), .A0N(\w_j[7][2] ), .A1N(n290), .Y(
        n483) );
  NOR3X1 U1014 ( .A(n292), .B(RST), .C(n192), .Y(n291) );
  OAI22XL U1015 ( .A0(n195), .A1(n293), .B0(n960), .B1(n196), .Y(n292) );
  OAI2BB2XL U1016 ( .B0(n726), .B1(n1012), .A0N(N322), .A1N(n433), .Y(N332) );
  OAI2BB2XL U1017 ( .B0(n290), .B1(n296), .A0N(\w_j[7][0] ), .A1N(n290), .Y(
        n485) );
  NOR3X1 U1018 ( .A(n297), .B(RST), .C(n205), .Y(n296) );
  OAI22XL U1019 ( .A0(n207), .A1(n293), .B0(n960), .B1(n208), .Y(n297) );
  OAI2BB2XL U1020 ( .B0(n290), .B1(n294), .A0N(\w_j[7][1] ), .A1N(n290), .Y(
        n484) );
  NOR3X1 U1021 ( .A(n295), .B(RST), .C(n199), .Y(n294) );
  OAI22XL U1022 ( .A0(n201), .A1(n293), .B0(n960), .B1(n202), .Y(n295) );
  OAI2BB2XL U1023 ( .B0(n726), .B1(n1013), .A0N(N323), .A1N(n433), .Y(N333) );
  AO22X1 U1024 ( .A0(cnt[15]), .A1(n428), .B0(N415), .B1(n727), .Y(N447) );
  AO22X1 U1025 ( .A0(cnt[12]), .A1(n428), .B0(N412), .B1(n727), .Y(N444) );
  AO22X1 U1026 ( .A0(cnt[11]), .A1(n428), .B0(N411), .B1(n727), .Y(N443) );
  AO22X1 U1027 ( .A0(cnt[2]), .A1(n428), .B0(N402), .B1(n727), .Y(N434) );
  AO22X1 U1028 ( .A0(cnt[1]), .A1(n428), .B0(N401), .B1(n727), .Y(N433) );
  AO22X1 U1029 ( .A0(cnt[3]), .A1(n428), .B0(N403), .B1(n727), .Y(N435) );
  AO22X1 U1030 ( .A0(cnt[4]), .A1(n428), .B0(N404), .B1(n727), .Y(N436) );
  AO22X1 U1031 ( .A0(cnt[5]), .A1(n428), .B0(N405), .B1(n727), .Y(N437) );
  AO22X1 U1032 ( .A0(cnt[6]), .A1(n428), .B0(N406), .B1(n727), .Y(N438) );
  AO22X1 U1033 ( .A0(n428), .A1(cnt[7]), .B0(N407), .B1(n727), .Y(N439) );
  AO22X1 U1034 ( .A0(cnt[8]), .A1(n428), .B0(N408), .B1(n727), .Y(N440) );
  AO22X1 U1035 ( .A0(n428), .A1(cnt[9]), .B0(N409), .B1(n727), .Y(N441) );
  AO22X1 U1036 ( .A0(cnt[10]), .A1(n428), .B0(N410), .B1(n727), .Y(N442) );
  AO22X1 U1037 ( .A0(n428), .A1(cnt[13]), .B0(N413), .B1(n727), .Y(N445) );
  AO22X1 U1038 ( .A0(n428), .A1(cnt[14]), .B0(N414), .B1(n727), .Y(N446) );
  AO22X1 U1039 ( .A0(cnt[0]), .A1(n428), .B0(N400), .B1(n727), .Y(N432) );
  OAI21X2 U1040 ( .A0(n344), .A1(n115), .B0(n957), .Y(n321) );
  NAND2X2 U1041 ( .A(N817), .B(n701), .Y(n207) );
  NAND2X2 U1042 ( .A(N816), .B(n701), .Y(n201) );
  NAND2X2 U1043 ( .A(N815), .B(n701), .Y(n195) );
  NAND2X2 U1044 ( .A(N803), .B(n701), .Y(n208) );
  NAND2X2 U1045 ( .A(N802), .B(n701), .Y(n202) );
  NAND2X2 U1046 ( .A(N801), .B(n701), .Y(n196) );
  AOI211X1 U1047 ( .A0(n1015), .A1(n943), .B0(n323), .C0(n944), .Y(n320) );
  NOR3X1 U1048 ( .A(n1004), .B(RST), .C(n324), .Y(n323) );
  CLKINVX1 U1049 ( .A(n321), .Y(n944) );
  OAI31X1 U1050 ( .A0(n403), .A1(compare[0]), .A2(n404), .B0(n405), .Y(n399)
         );
  AOI21XL U1051 ( .A0(N545), .A1(n719), .B0(n409), .Y(n404) );
  OAI21XL U1052 ( .A0(n976), .A1(n407), .B0(n406), .Y(n403) );
  AOI32X1 U1053 ( .A0(n406), .A1(n976), .A2(n407), .B0(n408), .B1(n977), .Y(
        n405) );
  OA21XL U1054 ( .A0(n1026), .A1(n317), .B0(n320), .Y(n319) );
  CLKINVX1 U1055 ( .A(N231), .Y(n757) );
  OAI2BB2XL U1056 ( .B0(n726), .B1(n130), .A0N(N317), .A1N(n433), .Y(N327) );
  OAI2BB2XL U1057 ( .B0(n726), .B1(n125), .A0N(N320), .A1N(n433), .Y(N330) );
  OAI2BB2XL U1058 ( .B0(n726), .B1(n133), .A0N(N314), .A1N(n433), .Y(N324) );
  OAI2BB1XL U1059 ( .A0N(MatchCount[3]), .A1N(n315), .B0(n316), .Y(n489) );
  OR4XL U1060 ( .A(MatchCount[3]), .B(n1017), .C(n317), .D(n318), .Y(n316) );
  OAI21XL U1061 ( .A0(n1025), .A1(n317), .B0(n319), .Y(n315) );
  NOR2X1 U1062 ( .A(n993), .B(n168), .Y(n470) );
  CLKINVX1 U1063 ( .A(N234), .Y(n934) );
  CLKBUFX3 U1064 ( .A(\w_j[6][1] ), .Y(n730) );
  CLKBUFX3 U1065 ( .A(\w_j[6][2] ), .Y(n731) );
  CLKBUFX3 U1066 ( .A(\w_j[6][0] ), .Y(n729) );
  CLKBUFX3 U1067 ( .A(\w_j[5][1] ), .Y(n733) );
  CLKBUFX3 U1068 ( .A(\w_j[5][2] ), .Y(n734) );
  CLKBUFX3 U1069 ( .A(\w_j[5][0] ), .Y(n732) );
  CLKBUFX3 U1070 ( .A(\w_j[0][0] ), .Y(n735) );
  CLKBUFX3 U1071 ( .A(\w_j[0][1] ), .Y(n736) );
  CLKBUFX3 U1072 ( .A(\w_j[0][2] ), .Y(n737) );
  OAI32XL U1073 ( .A0(n317), .A1(n1025), .A2(n318), .B0(n319), .B1(n1017), .Y(
        n490) );
  NAND3XL U1074 ( .A(n1027), .B(n321), .C(n1026), .Y(n318) );
  OAI32X1 U1075 ( .A0(n420), .A1(m[2]), .A2(n996), .B0(n421), .B1(n997), .Y(
        N512) );
  OA21XL U1076 ( .A0(m[1]), .A1(n958), .B0(n422), .Y(n421) );
  OAI221XL U1077 ( .A0(n738), .A1(n359), .B0(n946), .B1(n995), .C0(n360), .Y(
        n505) );
  OAI22XL U1078 ( .A0(n1015), .A1(n321), .B0(RST), .B1(n325), .Y(n492) );
  AOI32X1 U1079 ( .A0(n321), .A1(n1015), .A2(n1004), .B0(n326), .B1(n327), .Y(
        n325) );
  OAI2BB1X1 U1080 ( .A0N(n321), .A1N(n324), .B0(n1015), .Y(n326) );
  AOI2BB1X1 U1081 ( .A0N(n425), .A1N(n426), .B0(n427), .Y(n367) );
  OAI32XL U1082 ( .A0(n425), .A1(N490), .A2(n720), .B0(n983), .B1(N489), .Y(
        n427) );
  OAI221XL U1083 ( .A0(n739), .A1(n376), .B0(n902), .B1(n998), .C0(n375), .Y(
        n373) );
  AOI32X1 U1084 ( .A0(n902), .A1(n998), .A2(n375), .B0(c[2]), .B1(n174), .Y(
        n374) );
  NAND2X1 U1085 ( .A(c_last[2]), .B(n1003), .Y(n375) );
  AND3X2 U1086 ( .A(acc_en), .B(n434), .C(n957), .Y(n433) );
  AOI31X1 U1087 ( .A0(n439), .A1(n369), .A2(n440), .B0(RST), .Y(N262) );
  AOI32X1 U1088 ( .A0(cs[1]), .A1(n116), .A2(n441), .B0(next_done), .B1(n970), 
        .Y(n440) );
  CLKINVX1 U1089 ( .A(n364), .Y(n970) );
  OAI22XL U1090 ( .A0(n945), .A1(n1014), .B0(n125), .B1(n728), .Y(n496) );
  OAI22XL U1091 ( .A0(n300), .A1(n173), .B0(n301), .B1(n168), .Y(n487) );
  OAI22XL U1092 ( .A0(n422), .A1(n996), .B0(m[1]), .B1(n420), .Y(N511) );
  OAI22XL U1093 ( .A0(n300), .A1(n1000), .B0(n301), .B1(n997), .Y(n486) );
  CLKINVX1 U1094 ( .A(index[2]), .Y(n1000) );
  OAI22XL U1095 ( .A0(n945), .A1(n136), .B0(n1008), .B1(n728), .Y(n498) );
  OAI21XL U1096 ( .A0(n320), .A1(n1016), .B0(n322), .Y(n491) );
  NAND4XL U1097 ( .A(n943), .B(n1027), .C(n321), .D(n1016), .Y(n322) );
  NAND3X1 U1098 ( .A(n957), .B(n115), .C(cs[2]), .Y(n365) );
  NOR2X1 U1099 ( .A(n368), .B(N229), .Y(N304) );
  OAI2BB2XL U1100 ( .B0(n1011), .B1(n728), .A0N(n342), .A1N(MinCost[7]), .Y(
        n495) );
  OAI2BB2XL U1101 ( .B0(n1007), .B1(n728), .A0N(n342), .A1N(MinCost[2]), .Y(
        n500) );
  OAI2BB2XL U1102 ( .B0(n1012), .B1(n728), .A0N(n342), .A1N(MinCost[8]), .Y(
        n494) );
  OAI2BB2XL U1103 ( .B0(n1013), .B1(n728), .A0N(n342), .A1N(MinCost[9]), .Y(
        n493) );
  OAI2BB2XL U1104 ( .B0(n130), .B1(n728), .A0N(n342), .A1N(MinCost[3]), .Y(
        n499) );
  OAI2BB2XL U1105 ( .B0(n1005), .B1(n728), .A0N(n342), .A1N(MinCost[1]), .Y(
        n501) );
  OAI2BB2XL U1106 ( .B0(n133), .B1(n728), .A0N(n342), .A1N(MinCost[0]), .Y(
        n502) );
  OAI2BB2XL U1107 ( .B0(n1010), .B1(n728), .A0N(n342), .A1N(MinCost[5]), .Y(
        n497) );
  OAI2BB2XL U1108 ( .B0(n370), .B1(n371), .A0N(c[2]), .A1N(N703), .Y(N705) );
  NOR2X1 U1109 ( .A(n243), .B(n966), .Y(n370) );
  CLKINVX1 U1110 ( .A(n303), .Y(n975) );
  OAI31XL U1111 ( .A0(n304), .A1(compare[0]), .A2(n305), .B0(n306), .Y(n303)
         );
  AOI21XL U1112 ( .A0(N622), .A1(n719), .B0(n310), .Y(n305) );
  OAI21XL U1113 ( .A0(n308), .A1(n976), .B0(n307), .Y(n304) );
  NOR2X1 U1114 ( .A(n423), .B(n958), .Y(N655) );
  BUFX4 U1115 ( .A(N247), .Y(n721) );
  CLKBUFX3 U1116 ( .A(n302), .Y(n725) );
  NOR3X1 U1117 ( .A(RST), .B(cs[1]), .C(n369), .Y(n302) );
  CLKINVX1 U1118 ( .A(n366), .Y(n946) );
  CLKXOR2X2 U1119 ( .A(n459), .B(n460), .Y(n213) );
  OAI221XL U1120 ( .A0(MinCost[0]), .A1(n335), .B0(n1036), .B1(n1005), .C0(
        n1006), .Y(n352) );
  AO22X1 U1121 ( .A0(n707), .A1(n708), .B0(n709), .B1(n707), .Y(n324) );
  CLKINVX1 U1122 ( .A(n345), .Y(n707) );
  OR2X1 U1123 ( .A(n338), .B(n336), .Y(n709) );
  XOR2X1 U1124 ( .A(n983), .B(N587), .Y(n387) );
  XOR2X1 U1125 ( .A(n983), .B(N565), .Y(n390) );
  CLKINVX1 U1126 ( .A(n353), .Y(n1006) );
  OAI32XL U1127 ( .A0(n333), .A1(n1035), .A2(n1007), .B0(n1034), .B1(n130), 
        .Y(n353) );
  NOR4X1 U1128 ( .A(RST), .B(n757), .C(n758), .D(n759), .Y(N340) );
  NAND3X1 U1129 ( .A(n725), .B(n423), .C(m[0]), .Y(n420) );
  OA22XL U1130 ( .A0(n125), .A1(n1031), .B0(n340), .B1(n349), .Y(n348) );
  OA22XL U1131 ( .A0(MinCost[5]), .A1(n1010), .B0(n350), .B1(n334), .Y(n349)
         );
  AOI32X1 U1132 ( .A0(n351), .A1(n352), .A2(n1009), .B0(acc[4]), .B1(n136), 
        .Y(n350) );
  CLKINVX1 U1133 ( .A(n339), .Y(n1009) );
  NOR3X1 U1134 ( .A(n369), .B(RST), .C(n115), .Y(N920) );
  XOR2X1 U1135 ( .A(n466), .B(n467), .Y(N249) );
  XOR2X1 U1136 ( .A(N234), .B(m[2]), .Y(n467) );
  NOR2X1 U1137 ( .A(n438), .B(n368), .Y(N305) );
  XOR2X1 U1138 ( .A(n758), .B(N229), .Y(n438) );
  CLKXOR2X2 U1139 ( .A(n464), .B(n465), .Y(n216) );
  XOR2X1 U1140 ( .A(n1014), .B(n125), .Y(n340) );
  XOR2X1 U1141 ( .A(c_last[1]), .B(c_last[0]), .Y(n454) );
  NOR3X1 U1142 ( .A(n116), .B(cs[1]), .C(n971), .Y(n431) );
  OAI21XL U1143 ( .A0(c_last[0]), .A1(c_last[1]), .B0(c_last[2]), .Y(n455) );
  CLKINVX1 U1144 ( .A(c_last[0]), .Y(n999) );
  CLKBUFX3 U1145 ( .A(c[0]), .Y(n739) );
  XNOR2X1 U1146 ( .A(n136), .B(acc[4]), .Y(n339) );
  CLKBUFX3 U1147 ( .A(N258), .Y(n724) );
  XOR2X1 U1148 ( .A(n456), .B(n457), .Y(N258) );
  XOR2X1 U1149 ( .A(N234), .B(c[2]), .Y(n457) );
  NOR4X1 U1150 ( .A(cnt[13]), .B(cnt[14]), .C(cnt[7]), .D(cnt[9]), .Y(n355) );
  CLKINVX1 U1151 ( .A(acc[1]), .Y(n1005) );
  CLKINVX1 U1152 ( .A(acc[2]), .Y(n1007) );
  CLKINVX1 U1153 ( .A(N234), .Y(n776) );
  CLKINVX1 U1154 ( .A(index[1]), .Y(n1001) );
  CLKBUFX3 U1155 ( .A(N252), .Y(n723) );
  XOR2X1 U1156 ( .A(n461), .B(n462), .Y(N252) );
  XOR2X1 U1157 ( .A(N234), .B(index[2]), .Y(n462) );
  NAND4X1 U1158 ( .A(n714), .B(cnt[8]), .C(cnt[5]), .D(cnt[6]), .Y(n711) );
  NAND3X1 U1159 ( .A(cnt[1]), .B(cnt[12]), .C(cnt[15]), .Y(n712) );
  NAND4X1 U1160 ( .A(n355), .B(cnt[0]), .C(cnt[10]), .D(cnt[11]), .Y(n713) );
  AND3X2 U1161 ( .A(cnt[3]), .B(cnt[2]), .C(cnt[4]), .Y(n714) );
  NAND2X1 U1162 ( .A(n231), .B(c[2]), .Y(n221) );
  NAND3X1 U1163 ( .A(n902), .B(n1003), .C(n739), .Y(n260) );
  NOR2X1 U1164 ( .A(n1003), .B(n902), .Y(n243) );
  AND4X1 U1165 ( .A(n354), .B(n355), .C(n356), .D(n357), .Y(n343) );
  NOR2X1 U1166 ( .A(cnt[10]), .B(cnt[0]), .Y(n354) );
  NOR3X1 U1167 ( .A(cnt[11]), .B(cnt[15]), .C(cnt[12]), .Y(n356) );
  NOR4X1 U1168 ( .A(n358), .B(cnt[1]), .C(cnt[3]), .D(cnt[2]), .Y(n357) );
  CLKINVX1 U1169 ( .A(acc[7]), .Y(n1011) );
  CLKINVX1 U1170 ( .A(acc[8]), .Y(n1012) );
  CLKINVX1 U1171 ( .A(acc[5]), .Y(n1010) );
  CLKINVX1 U1172 ( .A(acc[9]), .Y(n1013) );
  OR4X1 U1173 ( .A(cnt[4]), .B(cnt[5]), .C(cnt[6]), .D(cnt[8]), .Y(n358) );
  XOR2X1 U1174 ( .A(m[0]), .B(n423), .Y(n715) );
  AO22X1 U1175 ( .A0(n434), .A1(cost_done), .B0(cs[1]), .B1(n444), .Y(n443) );
  OAI21XL U1176 ( .A0(next_done), .A1(cs[2]), .B0(n698), .Y(n444) );
  CLKINVX1 U1177 ( .A(c_last[1]), .Y(n998) );
  CLKINVX1 U1178 ( .A(acc[4]), .Y(n1008) );
  CLKINVX1 U1179 ( .A(m[2]), .Y(n997) );
  BUFX12 U1180 ( .A(n1023), .Y(J[0]) );
  NOR2BX1 U1181 ( .AN(N296), .B(n368), .Y(n1023) );
  BUFX12 U1182 ( .A(n1022), .Y(J[1]) );
  NOR2BX1 U1183 ( .AN(N295), .B(n368), .Y(n1022) );
  BUFX12 U1184 ( .A(n1021), .Y(J[2]) );
  NOR2BX1 U1185 ( .AN(N294), .B(n368), .Y(n1021) );
  OAI31X4 U1186 ( .A0(n324), .A1(RST), .A2(n343), .B0(n321), .Y(n342) );
  NOR2X1 U1187 ( .A(n758), .B(N229), .Y(n754) );
  NOR2X1 U1188 ( .A(n758), .B(n759), .Y(n753) );
  NOR2X1 U1189 ( .A(n759), .B(N230), .Y(n751) );
  NOR2X1 U1190 ( .A(N229), .B(N230), .Y(n750) );
  AO22X1 U1191 ( .A0(n732), .A1(n751), .B0(\w_j[4][0] ), .B1(n750), .Y(n741)
         );
  AOI221XL U1192 ( .A0(n729), .A1(n754), .B0(\w_j[7][0] ), .B1(n753), .C0(n741), .Y(n744) );
  AO22X1 U1193 ( .A0(\w_j[1][0] ), .A1(n751), .B0(n735), .B1(n750), .Y(n742)
         );
  AOI221XL U1194 ( .A0(\w_j[2][0] ), .A1(n754), .B0(\w_j[3][0] ), .B1(n753), 
        .C0(n742), .Y(n743) );
  OAI22XL U1195 ( .A0(n757), .A1(n744), .B0(N231), .B1(n743), .Y(N296) );
  AO22X1 U1196 ( .A0(n733), .A1(n751), .B0(\w_j[4][1] ), .B1(n750), .Y(n745)
         );
  AOI221XL U1197 ( .A0(n730), .A1(n754), .B0(\w_j[7][1] ), .B1(n753), .C0(n745), .Y(n748) );
  AO22X1 U1198 ( .A0(\w_j[1][1] ), .A1(n751), .B0(n736), .B1(n750), .Y(n746)
         );
  AOI221XL U1199 ( .A0(\w_j[2][1] ), .A1(n754), .B0(\w_j[3][1] ), .B1(n753), 
        .C0(n746), .Y(n747) );
  OAI22XL U1200 ( .A0(n757), .A1(n748), .B0(N231), .B1(n747), .Y(N295) );
  AO22X1 U1201 ( .A0(n734), .A1(n751), .B0(\w_j[4][2] ), .B1(n750), .Y(n749)
         );
  AOI221XL U1202 ( .A0(n731), .A1(n754), .B0(\w_j[7][2] ), .B1(n753), .C0(n749), .Y(n756) );
  AO22X1 U1203 ( .A0(\w_j[1][2] ), .A1(n751), .B0(n737), .B1(n750), .Y(n752)
         );
  AOI221XL U1204 ( .A0(\w_j[2][2] ), .A1(n754), .B0(\w_j[3][2] ), .B1(n753), 
        .C0(n752), .Y(n755) );
  OAI22XL U1205 ( .A0(n756), .A1(n757), .B0(N231), .B1(n755), .Y(N294) );
  NOR2X1 U1206 ( .A(n995), .B(N232), .Y(n773) );
  NOR2X1 U1207 ( .A(n995), .B(n777), .Y(n772) );
  NOR2X1 U1208 ( .A(n777), .B(n738), .Y(n770) );
  NOR2X1 U1209 ( .A(N232), .B(n738), .Y(n769) );
  AO22X1 U1210 ( .A0(n732), .A1(n770), .B0(\w_j[4][0] ), .B1(n769), .Y(n760)
         );
  AOI221XL U1211 ( .A0(n729), .A1(n773), .B0(\w_j[7][0] ), .B1(n772), .C0(n760), .Y(n763) );
  AO22X1 U1212 ( .A0(\w_j[1][0] ), .A1(n770), .B0(n735), .B1(n769), .Y(n761)
         );
  AOI221XL U1213 ( .A0(\w_j[2][0] ), .A1(n773), .B0(\w_j[3][0] ), .B1(n772), 
        .C0(n761), .Y(n762) );
  OAI22XL U1214 ( .A0(n776), .A1(n763), .B0(N234), .B1(n762), .Y(N491) );
  AO22X1 U1215 ( .A0(n733), .A1(n770), .B0(\w_j[4][1] ), .B1(n769), .Y(n764)
         );
  AOI221XL U1216 ( .A0(n730), .A1(n773), .B0(\w_j[7][1] ), .B1(n772), .C0(n764), .Y(n767) );
  AO22X1 U1217 ( .A0(\w_j[1][1] ), .A1(n770), .B0(n736), .B1(n769), .Y(n765)
         );
  AOI221XL U1218 ( .A0(\w_j[2][1] ), .A1(n773), .B0(\w_j[3][1] ), .B1(n772), 
        .C0(n765), .Y(n766) );
  OAI22XL U1219 ( .A0(n776), .A1(n767), .B0(N234), .B1(n766), .Y(N490) );
  AO22X1 U1220 ( .A0(n734), .A1(n770), .B0(\w_j[4][2] ), .B1(n769), .Y(n768)
         );
  AOI221XL U1221 ( .A0(n731), .A1(n773), .B0(\w_j[7][2] ), .B1(n772), .C0(n768), .Y(n775) );
  AO22X1 U1222 ( .A0(\w_j[1][2] ), .A1(n770), .B0(n737), .B1(n769), .Y(n771)
         );
  AOI221XL U1223 ( .A0(\w_j[2][2] ), .A1(n773), .B0(\w_j[3][2] ), .B1(n772), 
        .C0(n771), .Y(n774) );
  OAI22XL U1224 ( .A0(n775), .A1(n776), .B0(N234), .B1(n774), .Y(N489) );
  NOR2X1 U1225 ( .A(n795), .B(n721), .Y(n791) );
  NOR2X1 U1226 ( .A(n795), .B(n794), .Y(n790) );
  NOR2X1 U1227 ( .A(n794), .B(N248), .Y(n788) );
  NOR2X1 U1228 ( .A(n721), .B(N248), .Y(n787) );
  AO22X1 U1229 ( .A0(n732), .A1(n788), .B0(\w_j[4][0] ), .B1(n787), .Y(n778)
         );
  AOI221XL U1230 ( .A0(n729), .A1(n791), .B0(\w_j[7][0] ), .B1(n790), .C0(n778), .Y(n781) );
  AO22X1 U1231 ( .A0(\w_j[1][0] ), .A1(n788), .B0(n735), .B1(n787), .Y(n779)
         );
  AOI221XL U1232 ( .A0(\w_j[2][0] ), .A1(n791), .B0(\w_j[3][0] ), .B1(n790), 
        .C0(n779), .Y(n780) );
  OAI22XL U1233 ( .A0(n796), .A1(n781), .B0(n722), .B1(n780), .Y(N522) );
  AO22X1 U1234 ( .A0(n733), .A1(n788), .B0(\w_j[4][1] ), .B1(n787), .Y(n782)
         );
  AOI221XL U1235 ( .A0(n730), .A1(n791), .B0(\w_j[7][1] ), .B1(n790), .C0(n782), .Y(n785) );
  AO22X1 U1236 ( .A0(\w_j[1][1] ), .A1(n788), .B0(n736), .B1(n787), .Y(n783)
         );
  AOI221XL U1237 ( .A0(\w_j[2][1] ), .A1(n791), .B0(\w_j[3][1] ), .B1(n790), 
        .C0(n783), .Y(n784) );
  AO22X1 U1238 ( .A0(n734), .A1(n788), .B0(\w_j[4][2] ), .B1(n787), .Y(n786)
         );
  AOI221XL U1239 ( .A0(n731), .A1(n791), .B0(\w_j[7][2] ), .B1(n790), .C0(n786), .Y(n793) );
  AO22X1 U1240 ( .A0(\w_j[1][2] ), .A1(n788), .B0(n737), .B1(n787), .Y(n789)
         );
  AOI221XL U1241 ( .A0(\w_j[2][2] ), .A1(n791), .B0(\w_j[3][2] ), .B1(n790), 
        .C0(n789), .Y(n792) );
  NOR2X1 U1242 ( .A(n705), .B(n721), .Y(n810) );
  NOR2X1 U1243 ( .A(n705), .B(n813), .Y(n809) );
  NOR2X1 U1244 ( .A(n813), .B(N248), .Y(n807) );
  NOR2X1 U1245 ( .A(n721), .B(N248), .Y(n806) );
  AO22X1 U1246 ( .A0(n732), .A1(n807), .B0(\w_j[4][0] ), .B1(n806), .Y(n797)
         );
  AOI221XL U1247 ( .A0(n729), .A1(n810), .B0(\w_j[7][0] ), .B1(n809), .C0(n797), .Y(n800) );
  AO22X1 U1248 ( .A0(\w_j[1][0] ), .A1(n807), .B0(n735), .B1(n806), .Y(n798)
         );
  AOI221XL U1249 ( .A0(\w_j[2][0] ), .A1(n810), .B0(\w_j[3][0] ), .B1(n809), 
        .C0(n798), .Y(n799) );
  AO22X1 U1250 ( .A0(n733), .A1(n807), .B0(\w_j[4][1] ), .B1(n806), .Y(n801)
         );
  AOI221XL U1251 ( .A0(n730), .A1(n810), .B0(\w_j[7][1] ), .B1(n809), .C0(n801), .Y(n804) );
  AOI221XL U1252 ( .A0(\w_j[2][1] ), .A1(n810), .B0(\w_j[3][1] ), .B1(n809), 
        .C0(n802), .Y(n803) );
  AO22X1 U1253 ( .A0(n734), .A1(n807), .B0(\w_j[4][2] ), .B1(n806), .Y(n805)
         );
  AOI221XL U1254 ( .A0(n731), .A1(n810), .B0(\w_j[7][2] ), .B1(n809), .C0(n805), .Y(n812) );
  AO22X1 U1255 ( .A0(\w_j[1][2] ), .A1(n807), .B0(n737), .B1(n806), .Y(n808)
         );
  AOI221XL U1256 ( .A0(\w_j[2][2] ), .A1(n810), .B0(\w_j[3][2] ), .B1(n809), 
        .C0(n808), .Y(n811) );
  OAI22XL U1257 ( .A0(n812), .A1(n814), .B0(n722), .B1(n811), .Y(N543) );
  NOR2X1 U1258 ( .A(n832), .B(n721), .Y(n828) );
  NOR2X1 U1259 ( .A(n832), .B(n831), .Y(n827) );
  NOR2X1 U1260 ( .A(n831), .B(N248), .Y(n825) );
  NOR2X1 U1261 ( .A(n721), .B(N248), .Y(n824) );
  AO22X1 U1262 ( .A0(n732), .A1(n825), .B0(\w_j[4][0] ), .B1(n824), .Y(n815)
         );
  AOI221XL U1263 ( .A0(n729), .A1(n828), .B0(\w_j[7][0] ), .B1(n827), .C0(n815), .Y(n818) );
  AO22X1 U1264 ( .A0(\w_j[1][0] ), .A1(n825), .B0(n735), .B1(n824), .Y(n816)
         );
  AOI221XL U1265 ( .A0(\w_j[2][0] ), .A1(n828), .B0(\w_j[3][0] ), .B1(n827), 
        .C0(n816), .Y(n817) );
  OAI22XL U1266 ( .A0(n867), .A1(n818), .B0(n722), .B1(n817), .Y(N567) );
  AO22X1 U1267 ( .A0(n733), .A1(n825), .B0(\w_j[4][1] ), .B1(n824), .Y(n819)
         );
  AOI221XL U1268 ( .A0(n730), .A1(n828), .B0(\w_j[7][1] ), .B1(n827), .C0(n819), .Y(n822) );
  AO22X1 U1269 ( .A0(\w_j[1][1] ), .A1(n825), .B0(n736), .B1(n824), .Y(n820)
         );
  AOI221XL U1270 ( .A0(\w_j[2][1] ), .A1(n828), .B0(\w_j[3][1] ), .B1(n827), 
        .C0(n820), .Y(n821) );
  AO22X1 U1271 ( .A0(n734), .A1(n825), .B0(\w_j[4][2] ), .B1(n824), .Y(n823)
         );
  AOI221XL U1272 ( .A0(n731), .A1(n828), .B0(\w_j[7][2] ), .B1(n827), .C0(n823), .Y(n830) );
  AO22X1 U1273 ( .A0(\w_j[1][2] ), .A1(n825), .B0(n737), .B1(n824), .Y(n826)
         );
  AOI221XL U1274 ( .A0(\w_j[2][2] ), .A1(n828), .B0(\w_j[3][2] ), .B1(n827), 
        .C0(n826), .Y(n829) );
  OAI22XL U1275 ( .A0(n830), .A1(n867), .B0(n722), .B1(n829), .Y(N565) );
  NOR2X1 U1276 ( .A(n832), .B(n721), .Y(n846) );
  NOR2X1 U1277 ( .A(n832), .B(n849), .Y(n845) );
  NOR2X1 U1278 ( .A(n849), .B(N248), .Y(n843) );
  NOR2X1 U1279 ( .A(n721), .B(N248), .Y(n842) );
  AO22X1 U1280 ( .A0(n732), .A1(n843), .B0(\w_j[4][0] ), .B1(n842), .Y(n833)
         );
  AOI221XL U1281 ( .A0(n729), .A1(n846), .B0(\w_j[7][0] ), .B1(n845), .C0(n833), .Y(n836) );
  AO22X1 U1282 ( .A0(\w_j[1][0] ), .A1(n843), .B0(n735), .B1(n842), .Y(n834)
         );
  AOI221XL U1283 ( .A0(\w_j[2][0] ), .A1(n846), .B0(\w_j[3][0] ), .B1(n845), 
        .C0(n834), .Y(n835) );
  OAI22XL U1284 ( .A0(n867), .A1(n836), .B0(n722), .B1(n835), .Y(N589) );
  AO22X1 U1285 ( .A0(n733), .A1(n843), .B0(\w_j[4][1] ), .B1(n842), .Y(n837)
         );
  AOI221XL U1286 ( .A0(n730), .A1(n846), .B0(\w_j[7][1] ), .B1(n845), .C0(n837), .Y(n840) );
  AO22X1 U1287 ( .A0(\w_j[1][1] ), .A1(n843), .B0(n736), .B1(n842), .Y(n838)
         );
  AOI221XL U1288 ( .A0(\w_j[2][1] ), .A1(n846), .B0(\w_j[3][1] ), .B1(n845), 
        .C0(n838), .Y(n839) );
  AO22X1 U1289 ( .A0(n734), .A1(n843), .B0(\w_j[4][2] ), .B1(n842), .Y(n841)
         );
  AOI221XL U1290 ( .A0(n731), .A1(n846), .B0(\w_j[7][2] ), .B1(n845), .C0(n841), .Y(n848) );
  AO22X1 U1291 ( .A0(\w_j[1][2] ), .A1(n843), .B0(n737), .B1(n842), .Y(n844)
         );
  AOI221XL U1292 ( .A0(\w_j[2][2] ), .A1(n846), .B0(\w_j[3][2] ), .B1(n845), 
        .C0(n844), .Y(n847) );
  OAI22XL U1293 ( .A0(n848), .A1(n814), .B0(n722), .B1(n847), .Y(N587) );
  NOR2X1 U1294 ( .A(n795), .B(n721), .Y(n863) );
  NOR2X1 U1295 ( .A(n795), .B(n866), .Y(n862) );
  NOR2X1 U1296 ( .A(n866), .B(N248), .Y(n860) );
  NOR2X1 U1297 ( .A(n721), .B(N248), .Y(n859) );
  AO22X1 U1298 ( .A0(n732), .A1(n860), .B0(\w_j[4][0] ), .B1(n859), .Y(n850)
         );
  AOI221XL U1299 ( .A0(n729), .A1(n863), .B0(\w_j[7][0] ), .B1(n862), .C0(n850), .Y(n853) );
  AO22X1 U1300 ( .A0(\w_j[1][0] ), .A1(n860), .B0(n735), .B1(n859), .Y(n851)
         );
  AOI221XL U1301 ( .A0(\w_j[2][0] ), .A1(n863), .B0(\w_j[3][0] ), .B1(n862), 
        .C0(n851), .Y(n852) );
  OAI22XL U1302 ( .A0(n867), .A1(n853), .B0(n722), .B1(n852), .Y(N622) );
  AO22X1 U1303 ( .A0(n733), .A1(n860), .B0(\w_j[4][1] ), .B1(n859), .Y(n854)
         );
  AOI221XL U1304 ( .A0(n730), .A1(n863), .B0(\w_j[7][1] ), .B1(n862), .C0(n854), .Y(n857) );
  AO22X1 U1305 ( .A0(\w_j[1][1] ), .A1(n860), .B0(n736), .B1(n859), .Y(n855)
         );
  AOI221XL U1306 ( .A0(\w_j[2][1] ), .A1(n863), .B0(\w_j[3][1] ), .B1(n862), 
        .C0(n855), .Y(n856) );
  AO22X1 U1307 ( .A0(n734), .A1(n860), .B0(\w_j[4][2] ), .B1(n859), .Y(n858)
         );
  AOI221XL U1308 ( .A0(n731), .A1(n863), .B0(\w_j[7][2] ), .B1(n862), .C0(n858), .Y(n865) );
  AO22X1 U1309 ( .A0(\w_j[1][2] ), .A1(n860), .B0(n737), .B1(n859), .Y(n861)
         );
  AOI221XL U1310 ( .A0(\w_j[2][2] ), .A1(n863), .B0(\w_j[3][2] ), .B1(n862), 
        .C0(n861), .Y(n864) );
  OAI22XL U1311 ( .A0(n865), .A1(n867), .B0(n722), .B1(n864), .Y(N620) );
  NOR2X1 U1312 ( .A(n216), .B(N250), .Y(n881) );
  NOR2X1 U1313 ( .A(n216), .B(n884), .Y(n880) );
  NOR2X1 U1314 ( .A(n884), .B(N251), .Y(n878) );
  NOR2X1 U1315 ( .A(N250), .B(N251), .Y(n877) );
  AO22X1 U1316 ( .A0(n732), .A1(n878), .B0(\w_j[4][0] ), .B1(n877), .Y(n868)
         );
  AOI221XL U1317 ( .A0(n729), .A1(n881), .B0(\w_j[7][0] ), .B1(n880), .C0(n868), .Y(n871) );
  AO22X1 U1318 ( .A0(\w_j[1][0] ), .A1(n878), .B0(n735), .B1(n877), .Y(n869)
         );
  AOI221XL U1319 ( .A0(\w_j[2][0] ), .A1(n881), .B0(\w_j[3][0] ), .B1(n880), 
        .C0(n869), .Y(n870) );
  OAI22XL U1320 ( .A0(n885), .A1(n871), .B0(n723), .B1(n870), .Y(N730) );
  AO22X1 U1321 ( .A0(n733), .A1(n878), .B0(\w_j[4][1] ), .B1(n877), .Y(n872)
         );
  AOI221XL U1322 ( .A0(n730), .A1(n881), .B0(\w_j[7][1] ), .B1(n880), .C0(n872), .Y(n875) );
  AO22X1 U1323 ( .A0(\w_j[1][1] ), .A1(n878), .B0(n736), .B1(n877), .Y(n873)
         );
  AOI221XL U1324 ( .A0(\w_j[2][1] ), .A1(n881), .B0(\w_j[3][1] ), .B1(n880), 
        .C0(n873), .Y(n874) );
  OAI22XL U1325 ( .A0(n885), .A1(n875), .B0(n723), .B1(n874), .Y(N729) );
  AO22X1 U1326 ( .A0(n734), .A1(n878), .B0(\w_j[4][2] ), .B1(n877), .Y(n876)
         );
  AOI221XL U1327 ( .A0(n731), .A1(n881), .B0(\w_j[7][2] ), .B1(n880), .C0(n876), .Y(n883) );
  AO22X1 U1328 ( .A0(\w_j[1][2] ), .A1(n878), .B0(n737), .B1(n877), .Y(n879)
         );
  AOI221XL U1329 ( .A0(\w_j[2][2] ), .A1(n881), .B0(\w_j[3][2] ), .B1(n880), 
        .C0(n879), .Y(n882) );
  OAI22XL U1330 ( .A0(n883), .A1(n885), .B0(n723), .B1(n882), .Y(N728) );
  NOR2X1 U1331 ( .A(c[0]), .B(N254), .Y(n896) );
  NOR2X1 U1332 ( .A(N253), .B(N254), .Y(n895) );
  AO22X1 U1333 ( .A0(n732), .A1(n896), .B0(\w_j[4][0] ), .B1(n895), .Y(n886)
         );
  AOI221XL U1334 ( .A0(n729), .A1(n899), .B0(\w_j[7][0] ), .B1(n898), .C0(n886), .Y(n889) );
  AO22X1 U1335 ( .A0(\w_j[1][0] ), .A1(n896), .B0(n735), .B1(n895), .Y(n887)
         );
  AOI221XL U1336 ( .A0(\w_j[2][0] ), .A1(n899), .B0(\w_j[3][0] ), .B1(n898), 
        .C0(n887), .Y(n888) );
  OAI22XL U1337 ( .A0(c[2]), .A1(n889), .B0(n1003), .B1(n888), .Y(N803) );
  AO22X1 U1338 ( .A0(n733), .A1(n896), .B0(\w_j[4][1] ), .B1(n895), .Y(n890)
         );
  AOI221XL U1339 ( .A0(n730), .A1(n899), .B0(\w_j[7][1] ), .B1(n898), .C0(n890), .Y(n893) );
  AO22X1 U1340 ( .A0(\w_j[1][1] ), .A1(n896), .B0(n736), .B1(n895), .Y(n891)
         );
  AOI221XL U1341 ( .A0(\w_j[2][1] ), .A1(n899), .B0(\w_j[3][1] ), .B1(n898), 
        .C0(n891), .Y(n892) );
  OAI22XL U1342 ( .A0(c[2]), .A1(n893), .B0(n1003), .B1(n892), .Y(N802) );
  AO22X1 U1343 ( .A0(n734), .A1(n896), .B0(\w_j[4][2] ), .B1(n895), .Y(n894)
         );
  AOI221XL U1344 ( .A0(n731), .A1(n899), .B0(\w_j[7][2] ), .B1(n898), .C0(n894), .Y(n901) );
  AO22X1 U1345 ( .A0(\w_j[1][2] ), .A1(n896), .B0(n737), .B1(n895), .Y(n897)
         );
  AOI221XL U1346 ( .A0(\w_j[2][2] ), .A1(n899), .B0(\w_j[3][2] ), .B1(n898), 
        .C0(n897), .Y(n900) );
  OAI22XL U1347 ( .A0(n901), .A1(c[2]), .B0(n1003), .B1(n900), .Y(N801) );
  NOR2X1 U1348 ( .A(n213), .B(N256), .Y(n916) );
  NOR2X1 U1349 ( .A(n213), .B(n919), .Y(n915) );
  NOR2X1 U1350 ( .A(n919), .B(n962), .Y(n913) );
  NOR2X1 U1351 ( .A(N256), .B(n962), .Y(n912) );
  AO22X1 U1352 ( .A0(n732), .A1(n913), .B0(\w_j[4][0] ), .B1(n912), .Y(n903)
         );
  AOI221XL U1353 ( .A0(n729), .A1(n916), .B0(\w_j[7][0] ), .B1(n915), .C0(n903), .Y(n906) );
  AO22X1 U1354 ( .A0(\w_j[1][0] ), .A1(n913), .B0(n735), .B1(n912), .Y(n904)
         );
  AOI221XL U1355 ( .A0(\w_j[2][0] ), .A1(n916), .B0(\w_j[3][0] ), .B1(n915), 
        .C0(n904), .Y(n905) );
  OAI22XL U1356 ( .A0(n920), .A1(n906), .B0(n724), .B1(n905), .Y(N817) );
  AO22X1 U1357 ( .A0(n733), .A1(n913), .B0(\w_j[4][1] ), .B1(n912), .Y(n907)
         );
  AOI221XL U1358 ( .A0(n730), .A1(n916), .B0(\w_j[7][1] ), .B1(n915), .C0(n907), .Y(n910) );
  AO22X1 U1359 ( .A0(\w_j[1][1] ), .A1(n913), .B0(n736), .B1(n912), .Y(n908)
         );
  AOI221XL U1360 ( .A0(\w_j[2][1] ), .A1(n916), .B0(\w_j[3][1] ), .B1(n915), 
        .C0(n908), .Y(n909) );
  OAI22XL U1361 ( .A0(n920), .A1(n910), .B0(n724), .B1(n909), .Y(N816) );
  AO22X1 U1362 ( .A0(n734), .A1(n913), .B0(\w_j[4][2] ), .B1(n912), .Y(n911)
         );
  AOI221XL U1363 ( .A0(n731), .A1(n916), .B0(\w_j[7][2] ), .B1(n915), .C0(n911), .Y(n918) );
  AO22X1 U1364 ( .A0(\w_j[1][2] ), .A1(n913), .B0(n737), .B1(n912), .Y(n914)
         );
  AOI221XL U1365 ( .A0(\w_j[2][2] ), .A1(n916), .B0(\w_j[3][2] ), .B1(n915), 
        .C0(n914), .Y(n917) );
  OAI22XL U1366 ( .A0(n918), .A1(n920), .B0(n724), .B1(n917), .Y(N815) );
  NOR2X1 U1367 ( .A(n995), .B(N234), .Y(n931) );
  NOR2X1 U1368 ( .A(n995), .B(n934), .Y(n930) );
  NOR2X1 U1369 ( .A(n934), .B(n738), .Y(n928) );
  AO22X1 U1370 ( .A0(\w_j[4][0] ), .A1(n928), .B0(n735), .B1(n927), .Y(n921)
         );
  AOI221XL U1371 ( .A0(\w_j[2][0] ), .A1(n931), .B0(n729), .B1(n930), .C0(n921), .Y(n923) );
  AOI222XL U1372 ( .A0(\w_j[3][0] ), .A1(n995), .B0(\w_j[1][0] ), .B1(n931), 
        .C0(n732), .C1(n930), .Y(n922) );
  AO22X1 U1373 ( .A0(\w_j[4][1] ), .A1(n928), .B0(n736), .B1(n927), .Y(n924)
         );
  AOI221XL U1374 ( .A0(\w_j[2][1] ), .A1(n931), .B0(n730), .B1(n930), .C0(n924), .Y(n926) );
  AOI222XL U1375 ( .A0(\w_j[3][1] ), .A1(n995), .B0(\w_j[1][1] ), .B1(n931), 
        .C0(n733), .C1(n930), .Y(n925) );
  AO22X1 U1376 ( .A0(\w_j[4][2] ), .A1(n928), .B0(n737), .B1(n927), .Y(n929)
         );
  AOI221XL U1377 ( .A0(\w_j[2][2] ), .A1(n931), .B0(n731), .B1(n930), .C0(n929), .Y(n933) );
  AOI222XL U1378 ( .A0(\w_j[3][2] ), .A1(n995), .B0(\w_j[1][2] ), .B1(n931), 
        .C0(n734), .C1(n930), .Y(n932) );
  OR4X1 U1379 ( .A(N534), .B(N533), .C(N536), .D(N535), .Y(N537) );
  AO21X1 U1380 ( .A0(cnt[8]), .A1(cnt[7]), .B0(cnt[9]), .Y(n935) );
  AND2X1 U1381 ( .A(cnt[10]), .B(n935), .Y(n937) );
  AOI21X1 U1382 ( .A0(cnt[12]), .A1(cnt[11]), .B0(cnt[13]), .Y(n936) );
  AOI2BB1X1 U1383 ( .A0N(n937), .A1N(cnt[13]), .B0(n936), .Y(n938) );
  OAI21XL U1384 ( .A0(cnt[14]), .A1(n938), .B0(cnt[15]), .Y(N398) );
endmodule

