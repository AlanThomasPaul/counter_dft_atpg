//***************************************************************************//
//                           VERILOG MAINSIM FILE                            //
//Cadence(R) Modus(TM) DFT Software Solution, Version 20.12-s002_1, built Feb//
//***************************************************************************//
//                                                                           //
//  FILE CREATED..............February 01, 2026 at 13:16:30                  //
//                                                                           //
//  PROJECT NAME..............MODUS_RUN_COUNTER                              //
//                                                                           //
//  TESTMODE..................FULLSCAN                                       //
//                                                                           //
//  INEXPERIMENT..............counter_atpg                                   //
//                                                                           //
//  TDR.......................dummy.tdr                                      //
//                                                                           //
//  TEST PERIOD...............80.000   TEST TIME UNITS...........ns          //
//  TEST PULSE WIDTH..........8.000                                          //
//  TEST STROBE OFFSET........72.000   TEST STROBE TYPE..........edge        //
//  TEST BIDI OFFSET..........0.000                                          //
//  TEST PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//  SCAN FORMAT...............parallel SCAN OVERLAP..............yes         //
//  SCAN PERIOD...............80.000   SCAN TIME UNITS...........ns          //
//  SCAN PULSE WIDTH..........8.000                                          //
//  SCAN STROBE OFFSET........8.000    SCAN STROBE TYPE..........edge        //
//  SCAN BIDI OFFSET..........0.000                                          //
//  SCAN PI OFFSET............0.000    X VALUE...................X           //
//                                                                           //
//                                                                           //
//   Individually set PIs                                                    //
//  "clk_test" (PI # 7)                                                      //
//  TEST OFFSET...............8.000    PULSE WIDTH...............8.000       //
//  SCAN OFFSET...............16.000   PULSE WIDTH...............8.000       //
//                                                                           //
//  Active TESTMODEs TM = 1 ..FULLSCAN                                       //
//                                                                           //
//***************************************************************************//

  `timescale 1 ns / 1 ps

  module MODUS_RUN_COUNTER_FULLSCAN_counter_atpg ;

//***************************************************************************//
//                DEFINE VARIABLES FOR ALL PRIMARY I/O PORTS                 //
//***************************************************************************//

  reg [1:9] stim_PIs;   
  reg [1:9] part_PIs;   

  reg [1:9] stim_CIs;   

  reg [1:5] meas_POs;   

  reg [1:5] scan_POs;   
  wire [1:5] part_POs;   

//***************************************************************************//
//                   DEFINE VARIABLES FOR ALL SHIFT CHAINS                   //
//***************************************************************************//

  reg [1:64] stim_CR_1;   reg [1:64] stim_CR_2;   reg [1:64] stim_CR_3;   reg [1:64] stim_CR_4;   

  reg [1:64] meas_OR_1;   reg [1:64] meas_OR_2;   reg [1:64] meas_OR_3;   reg [1:64] meas_OR_4;   

  reg [1:64] part_S_CR_1_TM_1;   reg [1:64] part_S_CR_2_TM_1;   reg [1:64] part_S_CR_3_TM_1;   reg [1:64] part_S_CR_4_TM_1;   

  wire [1:64] part_M_OR_1_TM_1;   wire [1:64] part_M_OR_2_TM_1;   wire [1:64] part_M_OR_3_TM_1;   wire [1:64] part_M_OR_4_TM_1;   


//***************************************************************************//
//                             OTHER DEFINITIONS                             //
//***************************************************************************//

  integer  CYCLE, SCANCYCLE, SERIALCYCLE, PInum, POnum, ORnum, MODENUM, EXPNUM, SCANOPNUM, SEQNUM, TASKNUM, START, NUM_SHIFTS, MultiShift, maxMultiShifts, MultiShiftsLeft, forcePointStart, forcePoint, SCANNUM ; 
  integer  CMD, DATAID, SAVEID, TID, num_files, rc_read, repeat_depth, repeat_heart, repeat_num, MAX, FAILSETID, DIAG_DATAID; 
  integer  test_num, test_num_prev, failed_test_num, num_tests, num_failed_tests, total_num_tests, total_num_failed_tests, total_cycles, scan_num, overlap; 
  integer  num_repeats [1:15]; 
  reg      [1:8185] name_POs [1:5]; 
  reg      [130:0] good_compares, miscompares, miscompare_limit, total_good_compares, total_miscompares, measure_current; 
  reg      [63:0] start_of_repeat [1:15]; 
  reg      [63:0] start_of_current_line, fseek_offset; 
  reg      [130:0] line_number, save_line_number; 
  reg      sim_trace, sim_heart, sim_range, failset, global_term, sim_debug, sim_more_debug, diag_debug; 
  reg      [1:800] PATTERN, pattern, TESTFILE, INITFILE, SOD, EOD, eventID, DIAG_DEBUG_FILE; 
  reg      [1:8184] DATAFILE, SAVEFILE, COMMENT, FAILSET; 
  reg      [1:4096] PROCESSNAME; 

//***************************************************************************//
//        INSTANTIATE THE STRUCTURE AND CONNECT TO VERILOG VARIABLES         //
//***************************************************************************//

  counter
    counter_inst (
      .clk         ( part_PIs[006] ),      // pinName = clk; testOffset = 0.000000;  scanOffset = 0.000000;  
      .reset       ( part_PIs[008] ),      // pinName = reset;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .out         ( part_POs[005] ),      // pinName = out; 
      .clk_test    ( part_PIs[007] ),      // pinName = clk_test;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
      .TM          ( part_PIs[005] ),      // pinName = TM;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .scan_enable ( part_PIs[009] ),      // pinName = scan_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_sdi_1   ( part_PIs[001] ),      // pinName = DFT_sdi_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_sdo_1   ( part_POs[001] ),      // pinName = DFT_sdo_1;  tf =  SO  ; 
      .DFT_sdi_2   ( part_PIs[002] ),      // pinName = DFT_sdi_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_sdo_2   ( part_POs[002] ),      // pinName = DFT_sdo_2;  tf =  SO1 ; 
      .DFT_sdi_3   ( part_PIs[003] ),      // pinName = DFT_sdi_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_sdo_3   ( part_POs[003] ),      // pinName = DFT_sdo_3;  tf =  SO2 ; 
      .DFT_sdi_4   ( part_PIs[004] ),      // pinName = DFT_sdi_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      .DFT_sdo_4   ( part_POs[004] )     // pinName = DFT_sdo_4;  tf =  SO3 ; 
      );

//***************************************************************************//
//                        MAKE SOME OTHER CONNECTIONS                        //
//***************************************************************************//

  assign ( weak0, weak1 ) // Termination 
    part_POs [1] = global_term,     // pinName = DFT_sdo_1;  tf =  SO  ; 
    part_POs [2] = global_term,     // pinName = DFT_sdo_2;  tf =  SO1 ; 
    part_POs [3] = global_term,     // pinName = DFT_sdo_3;  tf =  SO2 ; 
    part_POs [4] = global_term,     // pinName = DFT_sdo_4;  tf =  SO3 ; 
    part_POs [5] = global_term;      // pinName = out; 


  assign ( supply0, supply1 ) // CR = 1 
    counter_inst.DFT_sdi_1 = part_S_CR_1_TM_1 [64] ,   // CR = 1;  pos = 1;  Pin Index = 0;  Pin Name = DFT_sdi_1;  pinInvFromLatch = no;  Latch Index = 26;  Latch Name = \count_reg[0].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[1] .SI = part_S_CR_1_TM_1 [63] ,   // CR = 1;  pos = 2;  Pin Index = 11784;  Pin Name = \count_reg[1].SI;  pinInvFromLatch = no;  Latch Index = 3911;  Latch Name = \count_reg[1].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[2] .SI = part_S_CR_1_TM_1 [62] ,   // CR = 1;  pos = 3;  Pin Index = 18886;  Pin Name = \count_reg[2].SI;  pinInvFromLatch = no;  Latch Index = 6256;  Latch Name = \count_reg[2].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[3] .SI = part_S_CR_1_TM_1 [61] ,   // CR = 1;  pos = 4;  Pin Index = 20052;  Pin Name = \count_reg[3].SI;  pinInvFromLatch = no;  Latch Index = 6641;  Latch Name = \count_reg[3].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[4] .SI = part_S_CR_1_TM_1 [60] ,   // CR = 1;  pos = 5;  Pin Index = 21218;  Pin Name = \count_reg[4].SI;  pinInvFromLatch = no;  Latch Index = 7026;  Latch Name = \count_reg[4].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[5] .SI = part_S_CR_1_TM_1 [59] ,   // CR = 1;  pos = 6;  Pin Index = 22384;  Pin Name = \count_reg[5].SI;  pinInvFromLatch = no;  Latch Index = 7411;  Latch Name = \count_reg[5].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[6] .SI = part_S_CR_1_TM_1 [58] ,   // CR = 1;  pos = 7;  Pin Index = 23550;  Pin Name = \count_reg[6].SI;  pinInvFromLatch = no;  Latch Index = 7796;  Latch Name = \count_reg[6].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[7] .SI = part_S_CR_1_TM_1 [57] ,   // CR = 1;  pos = 8;  Pin Index = 24716;  Pin Name = \count_reg[7].SI;  pinInvFromLatch = no;  Latch Index = 8181;  Latch Name = \count_reg[7].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[8] .SI = part_S_CR_1_TM_1 [56] ,   // CR = 1;  pos = 9;  Pin Index = 25882;  Pin Name = \count_reg[8].SI;  pinInvFromLatch = no;  Latch Index = 8566;  Latch Name = \count_reg[8].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[9] .SI = part_S_CR_1_TM_1 [55] ,   // CR = 1;  pos = 10;  Pin Index = 27048;  Pin Name = \count_reg[9].SI;  pinInvFromLatch = no;  Latch Index = 8951;  Latch Name = \count_reg[9].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[10] .SI = part_S_CR_1_TM_1 [54] ,   // CR = 1;  pos = 11;  Pin Index = 1184;  Pin Name = \count_reg[10].SI;  pinInvFromLatch = no;  Latch Index = 411;  Latch Name = \count_reg[10].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[11] .SI = part_S_CR_1_TM_1 [53] ,   // CR = 1;  pos = 12;  Pin Index = 2350;  Pin Name = \count_reg[11].SI;  pinInvFromLatch = no;  Latch Index = 796;  Latch Name = \count_reg[11].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[12] .SI = part_S_CR_1_TM_1 [52] ,   // CR = 1;  pos = 13;  Pin Index = 3516;  Pin Name = \count_reg[12].SI;  pinInvFromLatch = no;  Latch Index = 1181;  Latch Name = \count_reg[12].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[13] .SI = part_S_CR_1_TM_1 [51] ,   // CR = 1;  pos = 14;  Pin Index = 4682;  Pin Name = \count_reg[13].SI;  pinInvFromLatch = no;  Latch Index = 1566;  Latch Name = \count_reg[13].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[14] .SI = part_S_CR_1_TM_1 [50] ,   // CR = 1;  pos = 15;  Pin Index = 5848;  Pin Name = \count_reg[14].SI;  pinInvFromLatch = no;  Latch Index = 1951;  Latch Name = \count_reg[14].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[15] .SI = part_S_CR_1_TM_1 [49] ,   // CR = 1;  pos = 16;  Pin Index = 7014;  Pin Name = \count_reg[15].SI;  pinInvFromLatch = no;  Latch Index = 2336;  Latch Name = \count_reg[15].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[16] .SI = part_S_CR_1_TM_1 [48] ,   // CR = 1;  pos = 17;  Pin Index = 8180;  Pin Name = \count_reg[16].SI;  pinInvFromLatch = no;  Latch Index = 2721;  Latch Name = \count_reg[16].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[17] .SI = part_S_CR_1_TM_1 [47] ,   // CR = 1;  pos = 18;  Pin Index = 9346;  Pin Name = \count_reg[17].SI;  pinInvFromLatch = no;  Latch Index = 3106;  Latch Name = \count_reg[17].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[18] .SI = part_S_CR_1_TM_1 [46] ,   // CR = 1;  pos = 19;  Pin Index = 10512;  Pin Name = \count_reg[18].SI;  pinInvFromLatch = no;  Latch Index = 3491;  Latch Name = \count_reg[18].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[19] .SI = part_S_CR_1_TM_1 [45] ,   // CR = 1;  pos = 20;  Pin Index = 11678;  Pin Name = \count_reg[19].SI;  pinInvFromLatch = no;  Latch Index = 3876;  Latch Name = \count_reg[19].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[20] .SI = part_S_CR_1_TM_1 [44] ,   // CR = 1;  pos = 21;  Pin Index = 12950;  Pin Name = \count_reg[20].SI;  pinInvFromLatch = no;  Latch Index = 4296;  Latch Name = \count_reg[20].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[21] .SI = part_S_CR_1_TM_1 [43] ,   // CR = 1;  pos = 22;  Pin Index = 14116;  Pin Name = \count_reg[21].SI;  pinInvFromLatch = no;  Latch Index = 4681;  Latch Name = \count_reg[21].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[22] .SI = part_S_CR_1_TM_1 [42] ,   // CR = 1;  pos = 23;  Pin Index = 15282;  Pin Name = \count_reg[22].SI;  pinInvFromLatch = no;  Latch Index = 5066;  Latch Name = \count_reg[22].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[23] .SI = part_S_CR_1_TM_1 [41] ,   // CR = 1;  pos = 24;  Pin Index = 16448;  Pin Name = \count_reg[23].SI;  pinInvFromLatch = no;  Latch Index = 5451;  Latch Name = \count_reg[23].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[24] .SI = part_S_CR_1_TM_1 [40] ,   // CR = 1;  pos = 25;  Pin Index = 17614;  Pin Name = \count_reg[24].SI;  pinInvFromLatch = no;  Latch Index = 5836;  Latch Name = \count_reg[24].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[25] .SI = part_S_CR_1_TM_1 [39] ,   // CR = 1;  pos = 26;  Pin Index = 18356;  Pin Name = \count_reg[25].SI;  pinInvFromLatch = no;  Latch Index = 6081;  Latch Name = \count_reg[25].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[26] .SI = part_S_CR_1_TM_1 [38] ,   // CR = 1;  pos = 27;  Pin Index = 18462;  Pin Name = \count_reg[26].SI;  pinInvFromLatch = no;  Latch Index = 6116;  Latch Name = \count_reg[26].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[27] .SI = part_S_CR_1_TM_1 [37] ,   // CR = 1;  pos = 28;  Pin Index = 18568;  Pin Name = \count_reg[27].SI;  pinInvFromLatch = no;  Latch Index = 6151;  Latch Name = \count_reg[27].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[28] .SI = part_S_CR_1_TM_1 [36] ,   // CR = 1;  pos = 29;  Pin Index = 18674;  Pin Name = \count_reg[28].SI;  pinInvFromLatch = no;  Latch Index = 6186;  Latch Name = \count_reg[28].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[29] .SI = part_S_CR_1_TM_1 [35] ,   // CR = 1;  pos = 30;  Pin Index = 18780;  Pin Name = \count_reg[29].SI;  pinInvFromLatch = no;  Latch Index = 6221;  Latch Name = \count_reg[29].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[30] .SI = part_S_CR_1_TM_1 [34] ,   // CR = 1;  pos = 31;  Pin Index = 18992;  Pin Name = \count_reg[30].SI;  pinInvFromLatch = no;  Latch Index = 6291;  Latch Name = \count_reg[30].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[31] .SI = part_S_CR_1_TM_1 [33] ,   // CR = 1;  pos = 32;  Pin Index = 19098;  Pin Name = \count_reg[31].SI;  pinInvFromLatch = no;  Latch Index = 6326;  Latch Name = \count_reg[31].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[32] .SI = part_S_CR_1_TM_1 [32] ,   // CR = 1;  pos = 33;  Pin Index = 19204;  Pin Name = \count_reg[32].SI;  pinInvFromLatch = no;  Latch Index = 6361;  Latch Name = \count_reg[32].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[33] .SI = part_S_CR_1_TM_1 [31] ,   // CR = 1;  pos = 34;  Pin Index = 19310;  Pin Name = \count_reg[33].SI;  pinInvFromLatch = no;  Latch Index = 6396;  Latch Name = \count_reg[33].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[34] .SI = part_S_CR_1_TM_1 [30] ,   // CR = 1;  pos = 35;  Pin Index = 19416;  Pin Name = \count_reg[34].SI;  pinInvFromLatch = no;  Latch Index = 6431;  Latch Name = \count_reg[34].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[35] .SI = part_S_CR_1_TM_1 [29] ,   // CR = 1;  pos = 36;  Pin Index = 19522;  Pin Name = \count_reg[35].SI;  pinInvFromLatch = no;  Latch Index = 6466;  Latch Name = \count_reg[35].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[36] .SI = part_S_CR_1_TM_1 [28] ,   // CR = 1;  pos = 37;  Pin Index = 19628;  Pin Name = \count_reg[36].SI;  pinInvFromLatch = no;  Latch Index = 6501;  Latch Name = \count_reg[36].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[37] .SI = part_S_CR_1_TM_1 [27] ,   // CR = 1;  pos = 38;  Pin Index = 19734;  Pin Name = \count_reg[37].SI;  pinInvFromLatch = no;  Latch Index = 6536;  Latch Name = \count_reg[37].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[38] .SI = part_S_CR_1_TM_1 [26] ,   // CR = 1;  pos = 39;  Pin Index = 19840;  Pin Name = \count_reg[38].SI;  pinInvFromLatch = no;  Latch Index = 6571;  Latch Name = \count_reg[38].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[39] .SI = part_S_CR_1_TM_1 [25] ,   // CR = 1;  pos = 40;  Pin Index = 19946;  Pin Name = \count_reg[39].SI;  pinInvFromLatch = no;  Latch Index = 6606;  Latch Name = \count_reg[39].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[40] .SI = part_S_CR_1_TM_1 [24] ,   // CR = 1;  pos = 41;  Pin Index = 20158;  Pin Name = \count_reg[40].SI;  pinInvFromLatch = no;  Latch Index = 6676;  Latch Name = \count_reg[40].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[41] .SI = part_S_CR_1_TM_1 [23] ,   // CR = 1;  pos = 42;  Pin Index = 20264;  Pin Name = \count_reg[41].SI;  pinInvFromLatch = no;  Latch Index = 6711;  Latch Name = \count_reg[41].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[42] .SI = part_S_CR_1_TM_1 [22] ,   // CR = 1;  pos = 43;  Pin Index = 20370;  Pin Name = \count_reg[42].SI;  pinInvFromLatch = no;  Latch Index = 6746;  Latch Name = \count_reg[42].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[43] .SI = part_S_CR_1_TM_1 [21] ,   // CR = 1;  pos = 44;  Pin Index = 20476;  Pin Name = \count_reg[43].SI;  pinInvFromLatch = no;  Latch Index = 6781;  Latch Name = \count_reg[43].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[44] .SI = part_S_CR_1_TM_1 [20] ,   // CR = 1;  pos = 45;  Pin Index = 20582;  Pin Name = \count_reg[44].SI;  pinInvFromLatch = no;  Latch Index = 6816;  Latch Name = \count_reg[44].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[45] .SI = part_S_CR_1_TM_1 [19] ,   // CR = 1;  pos = 46;  Pin Index = 20688;  Pin Name = \count_reg[45].SI;  pinInvFromLatch = no;  Latch Index = 6851;  Latch Name = \count_reg[45].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[46] .SI = part_S_CR_1_TM_1 [18] ,   // CR = 1;  pos = 47;  Pin Index = 20794;  Pin Name = \count_reg[46].SI;  pinInvFromLatch = no;  Latch Index = 6886;  Latch Name = \count_reg[46].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[47] .SI = part_S_CR_1_TM_1 [17] ,   // CR = 1;  pos = 48;  Pin Index = 20900;  Pin Name = \count_reg[47].SI;  pinInvFromLatch = no;  Latch Index = 6921;  Latch Name = \count_reg[47].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[48] .SI = part_S_CR_1_TM_1 [16] ,   // CR = 1;  pos = 49;  Pin Index = 21006;  Pin Name = \count_reg[48].SI;  pinInvFromLatch = no;  Latch Index = 6956;  Latch Name = \count_reg[48].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[49] .SI = part_S_CR_1_TM_1 [15] ,   // CR = 1;  pos = 50;  Pin Index = 21112;  Pin Name = \count_reg[49].SI;  pinInvFromLatch = no;  Latch Index = 6991;  Latch Name = \count_reg[49].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[50] .SI = part_S_CR_1_TM_1 [14] ,   // CR = 1;  pos = 51;  Pin Index = 21324;  Pin Name = \count_reg[50].SI;  pinInvFromLatch = no;  Latch Index = 7061;  Latch Name = \count_reg[50].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[51] .SI = part_S_CR_1_TM_1 [13] ,   // CR = 1;  pos = 52;  Pin Index = 21430;  Pin Name = \count_reg[51].SI;  pinInvFromLatch = no;  Latch Index = 7096;  Latch Name = \count_reg[51].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[52] .SI = part_S_CR_1_TM_1 [12] ,   // CR = 1;  pos = 53;  Pin Index = 21536;  Pin Name = \count_reg[52].SI;  pinInvFromLatch = no;  Latch Index = 7131;  Latch Name = \count_reg[52].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[53] .SI = part_S_CR_1_TM_1 [11] ,   // CR = 1;  pos = 54;  Pin Index = 21642;  Pin Name = \count_reg[53].SI;  pinInvFromLatch = no;  Latch Index = 7166;  Latch Name = \count_reg[53].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[54] .SI = part_S_CR_1_TM_1 [10] ,   // CR = 1;  pos = 55;  Pin Index = 21748;  Pin Name = \count_reg[54].SI;  pinInvFromLatch = no;  Latch Index = 7201;  Latch Name = \count_reg[54].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[55] .SI = part_S_CR_1_TM_1 [9] ,   // CR = 1;  pos = 56;  Pin Index = 21854;  Pin Name = \count_reg[55].SI;  pinInvFromLatch = no;  Latch Index = 7236;  Latch Name = \count_reg[55].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[56] .SI = part_S_CR_1_TM_1 [8] ,   // CR = 1;  pos = 57;  Pin Index = 21960;  Pin Name = \count_reg[56].SI;  pinInvFromLatch = no;  Latch Index = 7271;  Latch Name = \count_reg[56].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[57] .SI = part_S_CR_1_TM_1 [7] ,   // CR = 1;  pos = 58;  Pin Index = 22066;  Pin Name = \count_reg[57].SI;  pinInvFromLatch = no;  Latch Index = 7306;  Latch Name = \count_reg[57].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[58] .SI = part_S_CR_1_TM_1 [6] ,   // CR = 1;  pos = 59;  Pin Index = 22172;  Pin Name = \count_reg[58].SI;  pinInvFromLatch = no;  Latch Index = 7341;  Latch Name = \count_reg[58].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[59] .SI = part_S_CR_1_TM_1 [5] ,   // CR = 1;  pos = 60;  Pin Index = 22278;  Pin Name = \count_reg[59].SI;  pinInvFromLatch = no;  Latch Index = 7376;  Latch Name = \count_reg[59].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[60] .SI = part_S_CR_1_TM_1 [4] ,   // CR = 1;  pos = 61;  Pin Index = 22490;  Pin Name = \count_reg[60].SI;  pinInvFromLatch = no;  Latch Index = 7446;  Latch Name = \count_reg[60].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[61] .SI = part_S_CR_1_TM_1 [3] ,   // CR = 1;  pos = 62;  Pin Index = 22596;  Pin Name = \count_reg[61].SI;  pinInvFromLatch = no;  Latch Index = 7481;  Latch Name = \count_reg[61].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[62] .SI = part_S_CR_1_TM_1 [2] ,   // CR = 1;  pos = 63;  Pin Index = 22702;  Pin Name = \count_reg[62].SI;  pinInvFromLatch = no;  Latch Index = 7516;  Latch Name = \count_reg[62].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[63] .SI = part_S_CR_1_TM_1 [1] ;   // CR = 1;  pos = 64;  Pin Index = 22808;  Pin Name = \count_reg[63].SI;  pinInvFromLatch = no;  Latch Index = 7551;  Latch Name = \count_reg[63].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 2 
    counter_inst.DFT_sdi_2 = part_S_CR_2_TM_1 [64] ,   // CR = 2;  pos = 1;  Pin Index = 1;  Pin Name = DFT_sdi_2;  pinInvFromLatch = no;  Latch Index = 7586;  Latch Name = \count_reg[64].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[65] .SI = part_S_CR_2_TM_1 [63] ,   // CR = 2;  pos = 2;  Pin Index = 23020;  Pin Name = \count_reg[65].SI;  pinInvFromLatch = no;  Latch Index = 7621;  Latch Name = \count_reg[65].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[66] .SI = part_S_CR_2_TM_1 [62] ,   // CR = 2;  pos = 3;  Pin Index = 23126;  Pin Name = \count_reg[66].SI;  pinInvFromLatch = no;  Latch Index = 7656;  Latch Name = \count_reg[66].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[67] .SI = part_S_CR_2_TM_1 [61] ,   // CR = 2;  pos = 4;  Pin Index = 23232;  Pin Name = \count_reg[67].SI;  pinInvFromLatch = no;  Latch Index = 7691;  Latch Name = \count_reg[67].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[68] .SI = part_S_CR_2_TM_1 [60] ,   // CR = 2;  pos = 5;  Pin Index = 23338;  Pin Name = \count_reg[68].SI;  pinInvFromLatch = no;  Latch Index = 7726;  Latch Name = \count_reg[68].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[69] .SI = part_S_CR_2_TM_1 [59] ,   // CR = 2;  pos = 6;  Pin Index = 23444;  Pin Name = \count_reg[69].SI;  pinInvFromLatch = no;  Latch Index = 7761;  Latch Name = \count_reg[69].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[70] .SI = part_S_CR_2_TM_1 [58] ,   // CR = 2;  pos = 7;  Pin Index = 23656;  Pin Name = \count_reg[70].SI;  pinInvFromLatch = no;  Latch Index = 7831;  Latch Name = \count_reg[70].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[71] .SI = part_S_CR_2_TM_1 [57] ,   // CR = 2;  pos = 8;  Pin Index = 23762;  Pin Name = \count_reg[71].SI;  pinInvFromLatch = no;  Latch Index = 7866;  Latch Name = \count_reg[71].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[72] .SI = part_S_CR_2_TM_1 [56] ,   // CR = 2;  pos = 9;  Pin Index = 23868;  Pin Name = \count_reg[72].SI;  pinInvFromLatch = no;  Latch Index = 7901;  Latch Name = \count_reg[72].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[73] .SI = part_S_CR_2_TM_1 [55] ,   // CR = 2;  pos = 10;  Pin Index = 23974;  Pin Name = \count_reg[73].SI;  pinInvFromLatch = no;  Latch Index = 7936;  Latch Name = \count_reg[73].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[74] .SI = part_S_CR_2_TM_1 [54] ,   // CR = 2;  pos = 11;  Pin Index = 24080;  Pin Name = \count_reg[74].SI;  pinInvFromLatch = no;  Latch Index = 7971;  Latch Name = \count_reg[74].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[75] .SI = part_S_CR_2_TM_1 [53] ,   // CR = 2;  pos = 12;  Pin Index = 24186;  Pin Name = \count_reg[75].SI;  pinInvFromLatch = no;  Latch Index = 8006;  Latch Name = \count_reg[75].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[76] .SI = part_S_CR_2_TM_1 [52] ,   // CR = 2;  pos = 13;  Pin Index = 24292;  Pin Name = \count_reg[76].SI;  pinInvFromLatch = no;  Latch Index = 8041;  Latch Name = \count_reg[76].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[77] .SI = part_S_CR_2_TM_1 [51] ,   // CR = 2;  pos = 14;  Pin Index = 24398;  Pin Name = \count_reg[77].SI;  pinInvFromLatch = no;  Latch Index = 8076;  Latch Name = \count_reg[77].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[78] .SI = part_S_CR_2_TM_1 [50] ,   // CR = 2;  pos = 15;  Pin Index = 24504;  Pin Name = \count_reg[78].SI;  pinInvFromLatch = no;  Latch Index = 8111;  Latch Name = \count_reg[78].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[79] .SI = part_S_CR_2_TM_1 [49] ,   // CR = 2;  pos = 16;  Pin Index = 24610;  Pin Name = \count_reg[79].SI;  pinInvFromLatch = no;  Latch Index = 8146;  Latch Name = \count_reg[79].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[80] .SI = part_S_CR_2_TM_1 [48] ,   // CR = 2;  pos = 17;  Pin Index = 24822;  Pin Name = \count_reg[80].SI;  pinInvFromLatch = no;  Latch Index = 8216;  Latch Name = \count_reg[80].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[81] .SI = part_S_CR_2_TM_1 [47] ,   // CR = 2;  pos = 18;  Pin Index = 24928;  Pin Name = \count_reg[81].SI;  pinInvFromLatch = no;  Latch Index = 8251;  Latch Name = \count_reg[81].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[82] .SI = part_S_CR_2_TM_1 [46] ,   // CR = 2;  pos = 19;  Pin Index = 25034;  Pin Name = \count_reg[82].SI;  pinInvFromLatch = no;  Latch Index = 8286;  Latch Name = \count_reg[82].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[83] .SI = part_S_CR_2_TM_1 [45] ,   // CR = 2;  pos = 20;  Pin Index = 25140;  Pin Name = \count_reg[83].SI;  pinInvFromLatch = no;  Latch Index = 8321;  Latch Name = \count_reg[83].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[84] .SI = part_S_CR_2_TM_1 [44] ,   // CR = 2;  pos = 21;  Pin Index = 25246;  Pin Name = \count_reg[84].SI;  pinInvFromLatch = no;  Latch Index = 8356;  Latch Name = \count_reg[84].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[85] .SI = part_S_CR_2_TM_1 [43] ,   // CR = 2;  pos = 22;  Pin Index = 25352;  Pin Name = \count_reg[85].SI;  pinInvFromLatch = no;  Latch Index = 8391;  Latch Name = \count_reg[85].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[86] .SI = part_S_CR_2_TM_1 [42] ,   // CR = 2;  pos = 23;  Pin Index = 25458;  Pin Name = \count_reg[86].SI;  pinInvFromLatch = no;  Latch Index = 8426;  Latch Name = \count_reg[86].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[87] .SI = part_S_CR_2_TM_1 [41] ,   // CR = 2;  pos = 24;  Pin Index = 25564;  Pin Name = \count_reg[87].SI;  pinInvFromLatch = no;  Latch Index = 8461;  Latch Name = \count_reg[87].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[88] .SI = part_S_CR_2_TM_1 [40] ,   // CR = 2;  pos = 25;  Pin Index = 25670;  Pin Name = \count_reg[88].SI;  pinInvFromLatch = no;  Latch Index = 8496;  Latch Name = \count_reg[88].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[89] .SI = part_S_CR_2_TM_1 [39] ,   // CR = 2;  pos = 26;  Pin Index = 25776;  Pin Name = \count_reg[89].SI;  pinInvFromLatch = no;  Latch Index = 8531;  Latch Name = \count_reg[89].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[90] .SI = part_S_CR_2_TM_1 [38] ,   // CR = 2;  pos = 27;  Pin Index = 25988;  Pin Name = \count_reg[90].SI;  pinInvFromLatch = no;  Latch Index = 8601;  Latch Name = \count_reg[90].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[91] .SI = part_S_CR_2_TM_1 [37] ,   // CR = 2;  pos = 28;  Pin Index = 26094;  Pin Name = \count_reg[91].SI;  pinInvFromLatch = no;  Latch Index = 8636;  Latch Name = \count_reg[91].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[92] .SI = part_S_CR_2_TM_1 [36] ,   // CR = 2;  pos = 29;  Pin Index = 26200;  Pin Name = \count_reg[92].SI;  pinInvFromLatch = no;  Latch Index = 8671;  Latch Name = \count_reg[92].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[93] .SI = part_S_CR_2_TM_1 [35] ,   // CR = 2;  pos = 30;  Pin Index = 26306;  Pin Name = \count_reg[93].SI;  pinInvFromLatch = no;  Latch Index = 8706;  Latch Name = \count_reg[93].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[94] .SI = part_S_CR_2_TM_1 [34] ,   // CR = 2;  pos = 31;  Pin Index = 26412;  Pin Name = \count_reg[94].SI;  pinInvFromLatch = no;  Latch Index = 8741;  Latch Name = \count_reg[94].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[95] .SI = part_S_CR_2_TM_1 [33] ,   // CR = 2;  pos = 32;  Pin Index = 26518;  Pin Name = \count_reg[95].SI;  pinInvFromLatch = no;  Latch Index = 8776;  Latch Name = \count_reg[95].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[96] .SI = part_S_CR_2_TM_1 [32] ,   // CR = 2;  pos = 33;  Pin Index = 26624;  Pin Name = \count_reg[96].SI;  pinInvFromLatch = no;  Latch Index = 8811;  Latch Name = \count_reg[96].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[97] .SI = part_S_CR_2_TM_1 [31] ,   // CR = 2;  pos = 34;  Pin Index = 26730;  Pin Name = \count_reg[97].SI;  pinInvFromLatch = no;  Latch Index = 8846;  Latch Name = \count_reg[97].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[98] .SI = part_S_CR_2_TM_1 [30] ,   // CR = 2;  pos = 35;  Pin Index = 26836;  Pin Name = \count_reg[98].SI;  pinInvFromLatch = no;  Latch Index = 8881;  Latch Name = \count_reg[98].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[99] .SI = part_S_CR_2_TM_1 [29] ,   // CR = 2;  pos = 36;  Pin Index = 26942;  Pin Name = \count_reg[99].SI;  pinInvFromLatch = no;  Latch Index = 8916;  Latch Name = \count_reg[99].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[100] .SI = part_S_CR_2_TM_1 [28] ,   // CR = 2;  pos = 37;  Pin Index = 124;  Pin Name = \count_reg[100].SI;  pinInvFromLatch = no;  Latch Index = 61;  Latch Name = \count_reg[100].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[101] .SI = part_S_CR_2_TM_1 [27] ,   // CR = 2;  pos = 38;  Pin Index = 230;  Pin Name = \count_reg[101].SI;  pinInvFromLatch = no;  Latch Index = 96;  Latch Name = \count_reg[101].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[102] .SI = part_S_CR_2_TM_1 [26] ,   // CR = 2;  pos = 39;  Pin Index = 336;  Pin Name = \count_reg[102].SI;  pinInvFromLatch = no;  Latch Index = 131;  Latch Name = \count_reg[102].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[103] .SI = part_S_CR_2_TM_1 [25] ,   // CR = 2;  pos = 40;  Pin Index = 442;  Pin Name = \count_reg[103].SI;  pinInvFromLatch = no;  Latch Index = 166;  Latch Name = \count_reg[103].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[104] .SI = part_S_CR_2_TM_1 [24] ,   // CR = 2;  pos = 41;  Pin Index = 548;  Pin Name = \count_reg[104].SI;  pinInvFromLatch = no;  Latch Index = 201;  Latch Name = \count_reg[104].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[105] .SI = part_S_CR_2_TM_1 [23] ,   // CR = 2;  pos = 42;  Pin Index = 654;  Pin Name = \count_reg[105].SI;  pinInvFromLatch = no;  Latch Index = 236;  Latch Name = \count_reg[105].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[106] .SI = part_S_CR_2_TM_1 [22] ,   // CR = 2;  pos = 43;  Pin Index = 760;  Pin Name = \count_reg[106].SI;  pinInvFromLatch = no;  Latch Index = 271;  Latch Name = \count_reg[106].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[107] .SI = part_S_CR_2_TM_1 [21] ,   // CR = 2;  pos = 44;  Pin Index = 866;  Pin Name = \count_reg[107].SI;  pinInvFromLatch = no;  Latch Index = 306;  Latch Name = \count_reg[107].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[108] .SI = part_S_CR_2_TM_1 [20] ,   // CR = 2;  pos = 45;  Pin Index = 972;  Pin Name = \count_reg[108].SI;  pinInvFromLatch = no;  Latch Index = 341;  Latch Name = \count_reg[108].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[109] .SI = part_S_CR_2_TM_1 [19] ,   // CR = 2;  pos = 46;  Pin Index = 1078;  Pin Name = \count_reg[109].SI;  pinInvFromLatch = no;  Latch Index = 376;  Latch Name = \count_reg[109].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[110] .SI = part_S_CR_2_TM_1 [18] ,   // CR = 2;  pos = 47;  Pin Index = 1290;  Pin Name = \count_reg[110].SI;  pinInvFromLatch = no;  Latch Index = 446;  Latch Name = \count_reg[110].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[111] .SI = part_S_CR_2_TM_1 [17] ,   // CR = 2;  pos = 48;  Pin Index = 1396;  Pin Name = \count_reg[111].SI;  pinInvFromLatch = no;  Latch Index = 481;  Latch Name = \count_reg[111].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[112] .SI = part_S_CR_2_TM_1 [16] ,   // CR = 2;  pos = 49;  Pin Index = 1502;  Pin Name = \count_reg[112].SI;  pinInvFromLatch = no;  Latch Index = 516;  Latch Name = \count_reg[112].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[113] .SI = part_S_CR_2_TM_1 [15] ,   // CR = 2;  pos = 50;  Pin Index = 1608;  Pin Name = \count_reg[113].SI;  pinInvFromLatch = no;  Latch Index = 551;  Latch Name = \count_reg[113].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[114] .SI = part_S_CR_2_TM_1 [14] ,   // CR = 2;  pos = 51;  Pin Index = 1714;  Pin Name = \count_reg[114].SI;  pinInvFromLatch = no;  Latch Index = 586;  Latch Name = \count_reg[114].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[115] .SI = part_S_CR_2_TM_1 [13] ,   // CR = 2;  pos = 52;  Pin Index = 1820;  Pin Name = \count_reg[115].SI;  pinInvFromLatch = no;  Latch Index = 621;  Latch Name = \count_reg[115].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[116] .SI = part_S_CR_2_TM_1 [12] ,   // CR = 2;  pos = 53;  Pin Index = 1926;  Pin Name = \count_reg[116].SI;  pinInvFromLatch = no;  Latch Index = 656;  Latch Name = \count_reg[116].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[117] .SI = part_S_CR_2_TM_1 [11] ,   // CR = 2;  pos = 54;  Pin Index = 2032;  Pin Name = \count_reg[117].SI;  pinInvFromLatch = no;  Latch Index = 691;  Latch Name = \count_reg[117].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[118] .SI = part_S_CR_2_TM_1 [10] ,   // CR = 2;  pos = 55;  Pin Index = 2138;  Pin Name = \count_reg[118].SI;  pinInvFromLatch = no;  Latch Index = 726;  Latch Name = \count_reg[118].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[119] .SI = part_S_CR_2_TM_1 [9] ,   // CR = 2;  pos = 56;  Pin Index = 2244;  Pin Name = \count_reg[119].SI;  pinInvFromLatch = no;  Latch Index = 761;  Latch Name = \count_reg[119].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[120] .SI = part_S_CR_2_TM_1 [8] ,   // CR = 2;  pos = 57;  Pin Index = 2456;  Pin Name = \count_reg[120].SI;  pinInvFromLatch = no;  Latch Index = 831;  Latch Name = \count_reg[120].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[121] .SI = part_S_CR_2_TM_1 [7] ,   // CR = 2;  pos = 58;  Pin Index = 2562;  Pin Name = \count_reg[121].SI;  pinInvFromLatch = no;  Latch Index = 866;  Latch Name = \count_reg[121].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[122] .SI = part_S_CR_2_TM_1 [6] ,   // CR = 2;  pos = 59;  Pin Index = 2668;  Pin Name = \count_reg[122].SI;  pinInvFromLatch = no;  Latch Index = 901;  Latch Name = \count_reg[122].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[123] .SI = part_S_CR_2_TM_1 [5] ,   // CR = 2;  pos = 60;  Pin Index = 2774;  Pin Name = \count_reg[123].SI;  pinInvFromLatch = no;  Latch Index = 936;  Latch Name = \count_reg[123].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[124] .SI = part_S_CR_2_TM_1 [4] ,   // CR = 2;  pos = 61;  Pin Index = 2880;  Pin Name = \count_reg[124].SI;  pinInvFromLatch = no;  Latch Index = 971;  Latch Name = \count_reg[124].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[125] .SI = part_S_CR_2_TM_1 [3] ,   // CR = 2;  pos = 62;  Pin Index = 2986;  Pin Name = \count_reg[125].SI;  pinInvFromLatch = no;  Latch Index = 1006;  Latch Name = \count_reg[125].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[126] .SI = part_S_CR_2_TM_1 [2] ,   // CR = 2;  pos = 63;  Pin Index = 3092;  Pin Name = \count_reg[126].SI;  pinInvFromLatch = no;  Latch Index = 1041;  Latch Name = \count_reg[126].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[127] .SI = part_S_CR_2_TM_1 [1] ;   // CR = 2;  pos = 64;  Pin Index = 3198;  Pin Name = \count_reg[127].SI;  pinInvFromLatch = no;  Latch Index = 1076;  Latch Name = \count_reg[127].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 3 
    counter_inst.DFT_sdi_3 = part_S_CR_3_TM_1 [64] ,   // CR = 3;  pos = 1;  Pin Index = 2;  Pin Name = DFT_sdi_3;  pinInvFromLatch = no;  Latch Index = 1111;  Latch Name = \count_reg[128].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[129] .SI = part_S_CR_3_TM_1 [63] ,   // CR = 3;  pos = 2;  Pin Index = 3410;  Pin Name = \count_reg[129].SI;  pinInvFromLatch = no;  Latch Index = 1146;  Latch Name = \count_reg[129].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[130] .SI = part_S_CR_3_TM_1 [62] ,   // CR = 3;  pos = 3;  Pin Index = 3622;  Pin Name = \count_reg[130].SI;  pinInvFromLatch = no;  Latch Index = 1216;  Latch Name = \count_reg[130].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[131] .SI = part_S_CR_3_TM_1 [61] ,   // CR = 3;  pos = 4;  Pin Index = 3728;  Pin Name = \count_reg[131].SI;  pinInvFromLatch = no;  Latch Index = 1251;  Latch Name = \count_reg[131].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[132] .SI = part_S_CR_3_TM_1 [60] ,   // CR = 3;  pos = 5;  Pin Index = 3834;  Pin Name = \count_reg[132].SI;  pinInvFromLatch = no;  Latch Index = 1286;  Latch Name = \count_reg[132].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[133] .SI = part_S_CR_3_TM_1 [59] ,   // CR = 3;  pos = 6;  Pin Index = 3940;  Pin Name = \count_reg[133].SI;  pinInvFromLatch = no;  Latch Index = 1321;  Latch Name = \count_reg[133].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[134] .SI = part_S_CR_3_TM_1 [58] ,   // CR = 3;  pos = 7;  Pin Index = 4046;  Pin Name = \count_reg[134].SI;  pinInvFromLatch = no;  Latch Index = 1356;  Latch Name = \count_reg[134].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[135] .SI = part_S_CR_3_TM_1 [57] ,   // CR = 3;  pos = 8;  Pin Index = 4152;  Pin Name = \count_reg[135].SI;  pinInvFromLatch = no;  Latch Index = 1391;  Latch Name = \count_reg[135].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[136] .SI = part_S_CR_3_TM_1 [56] ,   // CR = 3;  pos = 9;  Pin Index = 4258;  Pin Name = \count_reg[136].SI;  pinInvFromLatch = no;  Latch Index = 1426;  Latch Name = \count_reg[136].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[137] .SI = part_S_CR_3_TM_1 [55] ,   // CR = 3;  pos = 10;  Pin Index = 4364;  Pin Name = \count_reg[137].SI;  pinInvFromLatch = no;  Latch Index = 1461;  Latch Name = \count_reg[137].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[138] .SI = part_S_CR_3_TM_1 [54] ,   // CR = 3;  pos = 11;  Pin Index = 4470;  Pin Name = \count_reg[138].SI;  pinInvFromLatch = no;  Latch Index = 1496;  Latch Name = \count_reg[138].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[139] .SI = part_S_CR_3_TM_1 [53] ,   // CR = 3;  pos = 12;  Pin Index = 4576;  Pin Name = \count_reg[139].SI;  pinInvFromLatch = no;  Latch Index = 1531;  Latch Name = \count_reg[139].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[140] .SI = part_S_CR_3_TM_1 [52] ,   // CR = 3;  pos = 13;  Pin Index = 4788;  Pin Name = \count_reg[140].SI;  pinInvFromLatch = no;  Latch Index = 1601;  Latch Name = \count_reg[140].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[141] .SI = part_S_CR_3_TM_1 [51] ,   // CR = 3;  pos = 14;  Pin Index = 4894;  Pin Name = \count_reg[141].SI;  pinInvFromLatch = no;  Latch Index = 1636;  Latch Name = \count_reg[141].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[142] .SI = part_S_CR_3_TM_1 [50] ,   // CR = 3;  pos = 15;  Pin Index = 5000;  Pin Name = \count_reg[142].SI;  pinInvFromLatch = no;  Latch Index = 1671;  Latch Name = \count_reg[142].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[143] .SI = part_S_CR_3_TM_1 [49] ,   // CR = 3;  pos = 16;  Pin Index = 5106;  Pin Name = \count_reg[143].SI;  pinInvFromLatch = no;  Latch Index = 1706;  Latch Name = \count_reg[143].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[144] .SI = part_S_CR_3_TM_1 [48] ,   // CR = 3;  pos = 17;  Pin Index = 5212;  Pin Name = \count_reg[144].SI;  pinInvFromLatch = no;  Latch Index = 1741;  Latch Name = \count_reg[144].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[145] .SI = part_S_CR_3_TM_1 [47] ,   // CR = 3;  pos = 18;  Pin Index = 5318;  Pin Name = \count_reg[145].SI;  pinInvFromLatch = no;  Latch Index = 1776;  Latch Name = \count_reg[145].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[146] .SI = part_S_CR_3_TM_1 [46] ,   // CR = 3;  pos = 19;  Pin Index = 5424;  Pin Name = \count_reg[146].SI;  pinInvFromLatch = no;  Latch Index = 1811;  Latch Name = \count_reg[146].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[147] .SI = part_S_CR_3_TM_1 [45] ,   // CR = 3;  pos = 20;  Pin Index = 5530;  Pin Name = \count_reg[147].SI;  pinInvFromLatch = no;  Latch Index = 1846;  Latch Name = \count_reg[147].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[148] .SI = part_S_CR_3_TM_1 [44] ,   // CR = 3;  pos = 21;  Pin Index = 5636;  Pin Name = \count_reg[148].SI;  pinInvFromLatch = no;  Latch Index = 1881;  Latch Name = \count_reg[148].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[149] .SI = part_S_CR_3_TM_1 [43] ,   // CR = 3;  pos = 22;  Pin Index = 5742;  Pin Name = \count_reg[149].SI;  pinInvFromLatch = no;  Latch Index = 1916;  Latch Name = \count_reg[149].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[150] .SI = part_S_CR_3_TM_1 [42] ,   // CR = 3;  pos = 23;  Pin Index = 5954;  Pin Name = \count_reg[150].SI;  pinInvFromLatch = no;  Latch Index = 1986;  Latch Name = \count_reg[150].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[151] .SI = part_S_CR_3_TM_1 [41] ,   // CR = 3;  pos = 24;  Pin Index = 6060;  Pin Name = \count_reg[151].SI;  pinInvFromLatch = no;  Latch Index = 2021;  Latch Name = \count_reg[151].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[152] .SI = part_S_CR_3_TM_1 [40] ,   // CR = 3;  pos = 25;  Pin Index = 6166;  Pin Name = \count_reg[152].SI;  pinInvFromLatch = no;  Latch Index = 2056;  Latch Name = \count_reg[152].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[153] .SI = part_S_CR_3_TM_1 [39] ,   // CR = 3;  pos = 26;  Pin Index = 6272;  Pin Name = \count_reg[153].SI;  pinInvFromLatch = no;  Latch Index = 2091;  Latch Name = \count_reg[153].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[154] .SI = part_S_CR_3_TM_1 [38] ,   // CR = 3;  pos = 27;  Pin Index = 6378;  Pin Name = \count_reg[154].SI;  pinInvFromLatch = no;  Latch Index = 2126;  Latch Name = \count_reg[154].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[155] .SI = part_S_CR_3_TM_1 [37] ,   // CR = 3;  pos = 28;  Pin Index = 6484;  Pin Name = \count_reg[155].SI;  pinInvFromLatch = no;  Latch Index = 2161;  Latch Name = \count_reg[155].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[156] .SI = part_S_CR_3_TM_1 [36] ,   // CR = 3;  pos = 29;  Pin Index = 6590;  Pin Name = \count_reg[156].SI;  pinInvFromLatch = no;  Latch Index = 2196;  Latch Name = \count_reg[156].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[157] .SI = part_S_CR_3_TM_1 [35] ,   // CR = 3;  pos = 30;  Pin Index = 6696;  Pin Name = \count_reg[157].SI;  pinInvFromLatch = no;  Latch Index = 2231;  Latch Name = \count_reg[157].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[158] .SI = part_S_CR_3_TM_1 [34] ,   // CR = 3;  pos = 31;  Pin Index = 6802;  Pin Name = \count_reg[158].SI;  pinInvFromLatch = no;  Latch Index = 2266;  Latch Name = \count_reg[158].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[159] .SI = part_S_CR_3_TM_1 [33] ,   // CR = 3;  pos = 32;  Pin Index = 6908;  Pin Name = \count_reg[159].SI;  pinInvFromLatch = no;  Latch Index = 2301;  Latch Name = \count_reg[159].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[160] .SI = part_S_CR_3_TM_1 [32] ,   // CR = 3;  pos = 33;  Pin Index = 7120;  Pin Name = \count_reg[160].SI;  pinInvFromLatch = no;  Latch Index = 2371;  Latch Name = \count_reg[160].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[161] .SI = part_S_CR_3_TM_1 [31] ,   // CR = 3;  pos = 34;  Pin Index = 7226;  Pin Name = \count_reg[161].SI;  pinInvFromLatch = no;  Latch Index = 2406;  Latch Name = \count_reg[161].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[162] .SI = part_S_CR_3_TM_1 [30] ,   // CR = 3;  pos = 35;  Pin Index = 7332;  Pin Name = \count_reg[162].SI;  pinInvFromLatch = no;  Latch Index = 2441;  Latch Name = \count_reg[162].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[163] .SI = part_S_CR_3_TM_1 [29] ,   // CR = 3;  pos = 36;  Pin Index = 7438;  Pin Name = \count_reg[163].SI;  pinInvFromLatch = no;  Latch Index = 2476;  Latch Name = \count_reg[163].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[164] .SI = part_S_CR_3_TM_1 [28] ,   // CR = 3;  pos = 37;  Pin Index = 7544;  Pin Name = \count_reg[164].SI;  pinInvFromLatch = no;  Latch Index = 2511;  Latch Name = \count_reg[164].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[165] .SI = part_S_CR_3_TM_1 [27] ,   // CR = 3;  pos = 38;  Pin Index = 7650;  Pin Name = \count_reg[165].SI;  pinInvFromLatch = no;  Latch Index = 2546;  Latch Name = \count_reg[165].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[166] .SI = part_S_CR_3_TM_1 [26] ,   // CR = 3;  pos = 39;  Pin Index = 7756;  Pin Name = \count_reg[166].SI;  pinInvFromLatch = no;  Latch Index = 2581;  Latch Name = \count_reg[166].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[167] .SI = part_S_CR_3_TM_1 [25] ,   // CR = 3;  pos = 40;  Pin Index = 7862;  Pin Name = \count_reg[167].SI;  pinInvFromLatch = no;  Latch Index = 2616;  Latch Name = \count_reg[167].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[168] .SI = part_S_CR_3_TM_1 [24] ,   // CR = 3;  pos = 41;  Pin Index = 7968;  Pin Name = \count_reg[168].SI;  pinInvFromLatch = no;  Latch Index = 2651;  Latch Name = \count_reg[168].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[169] .SI = part_S_CR_3_TM_1 [23] ,   // CR = 3;  pos = 42;  Pin Index = 8074;  Pin Name = \count_reg[169].SI;  pinInvFromLatch = no;  Latch Index = 2686;  Latch Name = \count_reg[169].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[170] .SI = part_S_CR_3_TM_1 [22] ,   // CR = 3;  pos = 43;  Pin Index = 8286;  Pin Name = \count_reg[170].SI;  pinInvFromLatch = no;  Latch Index = 2756;  Latch Name = \count_reg[170].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[171] .SI = part_S_CR_3_TM_1 [21] ,   // CR = 3;  pos = 44;  Pin Index = 8392;  Pin Name = \count_reg[171].SI;  pinInvFromLatch = no;  Latch Index = 2791;  Latch Name = \count_reg[171].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[172] .SI = part_S_CR_3_TM_1 [20] ,   // CR = 3;  pos = 45;  Pin Index = 8498;  Pin Name = \count_reg[172].SI;  pinInvFromLatch = no;  Latch Index = 2826;  Latch Name = \count_reg[172].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[173] .SI = part_S_CR_3_TM_1 [19] ,   // CR = 3;  pos = 46;  Pin Index = 8604;  Pin Name = \count_reg[173].SI;  pinInvFromLatch = no;  Latch Index = 2861;  Latch Name = \count_reg[173].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[174] .SI = part_S_CR_3_TM_1 [18] ,   // CR = 3;  pos = 47;  Pin Index = 8710;  Pin Name = \count_reg[174].SI;  pinInvFromLatch = no;  Latch Index = 2896;  Latch Name = \count_reg[174].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[175] .SI = part_S_CR_3_TM_1 [17] ,   // CR = 3;  pos = 48;  Pin Index = 8816;  Pin Name = \count_reg[175].SI;  pinInvFromLatch = no;  Latch Index = 2931;  Latch Name = \count_reg[175].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[176] .SI = part_S_CR_3_TM_1 [16] ,   // CR = 3;  pos = 49;  Pin Index = 8922;  Pin Name = \count_reg[176].SI;  pinInvFromLatch = no;  Latch Index = 2966;  Latch Name = \count_reg[176].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[177] .SI = part_S_CR_3_TM_1 [15] ,   // CR = 3;  pos = 50;  Pin Index = 9028;  Pin Name = \count_reg[177].SI;  pinInvFromLatch = no;  Latch Index = 3001;  Latch Name = \count_reg[177].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[178] .SI = part_S_CR_3_TM_1 [14] ,   // CR = 3;  pos = 51;  Pin Index = 9134;  Pin Name = \count_reg[178].SI;  pinInvFromLatch = no;  Latch Index = 3036;  Latch Name = \count_reg[178].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[179] .SI = part_S_CR_3_TM_1 [13] ,   // CR = 3;  pos = 52;  Pin Index = 9240;  Pin Name = \count_reg[179].SI;  pinInvFromLatch = no;  Latch Index = 3071;  Latch Name = \count_reg[179].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[180] .SI = part_S_CR_3_TM_1 [12] ,   // CR = 3;  pos = 53;  Pin Index = 9452;  Pin Name = \count_reg[180].SI;  pinInvFromLatch = no;  Latch Index = 3141;  Latch Name = \count_reg[180].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[181] .SI = part_S_CR_3_TM_1 [11] ,   // CR = 3;  pos = 54;  Pin Index = 9558;  Pin Name = \count_reg[181].SI;  pinInvFromLatch = no;  Latch Index = 3176;  Latch Name = \count_reg[181].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[182] .SI = part_S_CR_3_TM_1 [10] ,   // CR = 3;  pos = 55;  Pin Index = 9664;  Pin Name = \count_reg[182].SI;  pinInvFromLatch = no;  Latch Index = 3211;  Latch Name = \count_reg[182].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[183] .SI = part_S_CR_3_TM_1 [9] ,   // CR = 3;  pos = 56;  Pin Index = 9770;  Pin Name = \count_reg[183].SI;  pinInvFromLatch = no;  Latch Index = 3246;  Latch Name = \count_reg[183].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[184] .SI = part_S_CR_3_TM_1 [8] ,   // CR = 3;  pos = 57;  Pin Index = 9876;  Pin Name = \count_reg[184].SI;  pinInvFromLatch = no;  Latch Index = 3281;  Latch Name = \count_reg[184].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[185] .SI = part_S_CR_3_TM_1 [7] ,   // CR = 3;  pos = 58;  Pin Index = 9982;  Pin Name = \count_reg[185].SI;  pinInvFromLatch = no;  Latch Index = 3316;  Latch Name = \count_reg[185].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[186] .SI = part_S_CR_3_TM_1 [6] ,   // CR = 3;  pos = 59;  Pin Index = 10088;  Pin Name = \count_reg[186].SI;  pinInvFromLatch = no;  Latch Index = 3351;  Latch Name = \count_reg[186].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[187] .SI = part_S_CR_3_TM_1 [5] ,   // CR = 3;  pos = 60;  Pin Index = 10194;  Pin Name = \count_reg[187].SI;  pinInvFromLatch = no;  Latch Index = 3386;  Latch Name = \count_reg[187].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[188] .SI = part_S_CR_3_TM_1 [4] ,   // CR = 3;  pos = 61;  Pin Index = 10300;  Pin Name = \count_reg[188].SI;  pinInvFromLatch = no;  Latch Index = 3421;  Latch Name = \count_reg[188].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[189] .SI = part_S_CR_3_TM_1 [3] ,   // CR = 3;  pos = 62;  Pin Index = 10406;  Pin Name = \count_reg[189].SI;  pinInvFromLatch = no;  Latch Index = 3456;  Latch Name = \count_reg[189].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[190] .SI = part_S_CR_3_TM_1 [2] ,   // CR = 3;  pos = 63;  Pin Index = 10618;  Pin Name = \count_reg[190].SI;  pinInvFromLatch = no;  Latch Index = 3526;  Latch Name = \count_reg[190].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[191] .SI = part_S_CR_3_TM_1 [1] ;   // CR = 3;  pos = 64;  Pin Index = 10724;  Pin Name = \count_reg[191].SI;  pinInvFromLatch = no;  Latch Index = 3561;  Latch Name = \count_reg[191].__iNsT2.dff_primitive;   

  assign ( supply0, supply1 ) // CR = 4 
    counter_inst.DFT_sdi_4 = part_S_CR_4_TM_1 [64] ,   // CR = 4;  pos = 1;  Pin Index = 3;  Pin Name = DFT_sdi_4;  pinInvFromLatch = no;  Latch Index = 3596;  Latch Name = \count_reg[192].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[193] .SI = part_S_CR_4_TM_1 [63] ,   // CR = 4;  pos = 2;  Pin Index = 10936;  Pin Name = \count_reg[193].SI;  pinInvFromLatch = no;  Latch Index = 3631;  Latch Name = \count_reg[193].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[194] .SI = part_S_CR_4_TM_1 [62] ,   // CR = 4;  pos = 3;  Pin Index = 11042;  Pin Name = \count_reg[194].SI;  pinInvFromLatch = no;  Latch Index = 3666;  Latch Name = \count_reg[194].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[195] .SI = part_S_CR_4_TM_1 [61] ,   // CR = 4;  pos = 4;  Pin Index = 11148;  Pin Name = \count_reg[195].SI;  pinInvFromLatch = no;  Latch Index = 3701;  Latch Name = \count_reg[195].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[196] .SI = part_S_CR_4_TM_1 [60] ,   // CR = 4;  pos = 5;  Pin Index = 11254;  Pin Name = \count_reg[196].SI;  pinInvFromLatch = no;  Latch Index = 3736;  Latch Name = \count_reg[196].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[197] .SI = part_S_CR_4_TM_1 [59] ,   // CR = 4;  pos = 6;  Pin Index = 11360;  Pin Name = \count_reg[197].SI;  pinInvFromLatch = no;  Latch Index = 3771;  Latch Name = \count_reg[197].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[198] .SI = part_S_CR_4_TM_1 [58] ,   // CR = 4;  pos = 7;  Pin Index = 11466;  Pin Name = \count_reg[198].SI;  pinInvFromLatch = no;  Latch Index = 3806;  Latch Name = \count_reg[198].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[199] .SI = part_S_CR_4_TM_1 [57] ,   // CR = 4;  pos = 8;  Pin Index = 11572;  Pin Name = \count_reg[199].SI;  pinInvFromLatch = no;  Latch Index = 3841;  Latch Name = \count_reg[199].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[200] .SI = part_S_CR_4_TM_1 [56] ,   // CR = 4;  pos = 9;  Pin Index = 11890;  Pin Name = \count_reg[200].SI;  pinInvFromLatch = no;  Latch Index = 3946;  Latch Name = \count_reg[200].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[201] .SI = part_S_CR_4_TM_1 [55] ,   // CR = 4;  pos = 10;  Pin Index = 11996;  Pin Name = \count_reg[201].SI;  pinInvFromLatch = no;  Latch Index = 3981;  Latch Name = \count_reg[201].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[202] .SI = part_S_CR_4_TM_1 [54] ,   // CR = 4;  pos = 11;  Pin Index = 12102;  Pin Name = \count_reg[202].SI;  pinInvFromLatch = no;  Latch Index = 4016;  Latch Name = \count_reg[202].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[203] .SI = part_S_CR_4_TM_1 [53] ,   // CR = 4;  pos = 12;  Pin Index = 12208;  Pin Name = \count_reg[203].SI;  pinInvFromLatch = no;  Latch Index = 4051;  Latch Name = \count_reg[203].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[204] .SI = part_S_CR_4_TM_1 [52] ,   // CR = 4;  pos = 13;  Pin Index = 12314;  Pin Name = \count_reg[204].SI;  pinInvFromLatch = no;  Latch Index = 4086;  Latch Name = \count_reg[204].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[205] .SI = part_S_CR_4_TM_1 [51] ,   // CR = 4;  pos = 14;  Pin Index = 12420;  Pin Name = \count_reg[205].SI;  pinInvFromLatch = no;  Latch Index = 4121;  Latch Name = \count_reg[205].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[206] .SI = part_S_CR_4_TM_1 [50] ,   // CR = 4;  pos = 15;  Pin Index = 12526;  Pin Name = \count_reg[206].SI;  pinInvFromLatch = no;  Latch Index = 4156;  Latch Name = \count_reg[206].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[207] .SI = part_S_CR_4_TM_1 [49] ,   // CR = 4;  pos = 16;  Pin Index = 12632;  Pin Name = \count_reg[207].SI;  pinInvFromLatch = no;  Latch Index = 4191;  Latch Name = \count_reg[207].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[208] .SI = part_S_CR_4_TM_1 [48] ,   // CR = 4;  pos = 17;  Pin Index = 12738;  Pin Name = \count_reg[208].SI;  pinInvFromLatch = no;  Latch Index = 4226;  Latch Name = \count_reg[208].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[209] .SI = part_S_CR_4_TM_1 [47] ,   // CR = 4;  pos = 18;  Pin Index = 12844;  Pin Name = \count_reg[209].SI;  pinInvFromLatch = no;  Latch Index = 4261;  Latch Name = \count_reg[209].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[210] .SI = part_S_CR_4_TM_1 [46] ,   // CR = 4;  pos = 19;  Pin Index = 13056;  Pin Name = \count_reg[210].SI;  pinInvFromLatch = no;  Latch Index = 4331;  Latch Name = \count_reg[210].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[211] .SI = part_S_CR_4_TM_1 [45] ,   // CR = 4;  pos = 20;  Pin Index = 13162;  Pin Name = \count_reg[211].SI;  pinInvFromLatch = no;  Latch Index = 4366;  Latch Name = \count_reg[211].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[212] .SI = part_S_CR_4_TM_1 [44] ,   // CR = 4;  pos = 21;  Pin Index = 13268;  Pin Name = \count_reg[212].SI;  pinInvFromLatch = no;  Latch Index = 4401;  Latch Name = \count_reg[212].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[213] .SI = part_S_CR_4_TM_1 [43] ,   // CR = 4;  pos = 22;  Pin Index = 13374;  Pin Name = \count_reg[213].SI;  pinInvFromLatch = no;  Latch Index = 4436;  Latch Name = \count_reg[213].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[214] .SI = part_S_CR_4_TM_1 [42] ,   // CR = 4;  pos = 23;  Pin Index = 13480;  Pin Name = \count_reg[214].SI;  pinInvFromLatch = no;  Latch Index = 4471;  Latch Name = \count_reg[214].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[215] .SI = part_S_CR_4_TM_1 [41] ,   // CR = 4;  pos = 24;  Pin Index = 13586;  Pin Name = \count_reg[215].SI;  pinInvFromLatch = no;  Latch Index = 4506;  Latch Name = \count_reg[215].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[216] .SI = part_S_CR_4_TM_1 [40] ,   // CR = 4;  pos = 25;  Pin Index = 13692;  Pin Name = \count_reg[216].SI;  pinInvFromLatch = no;  Latch Index = 4541;  Latch Name = \count_reg[216].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[217] .SI = part_S_CR_4_TM_1 [39] ,   // CR = 4;  pos = 26;  Pin Index = 13798;  Pin Name = \count_reg[217].SI;  pinInvFromLatch = no;  Latch Index = 4576;  Latch Name = \count_reg[217].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[218] .SI = part_S_CR_4_TM_1 [38] ,   // CR = 4;  pos = 27;  Pin Index = 13904;  Pin Name = \count_reg[218].SI;  pinInvFromLatch = no;  Latch Index = 4611;  Latch Name = \count_reg[218].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[219] .SI = part_S_CR_4_TM_1 [37] ,   // CR = 4;  pos = 28;  Pin Index = 14010;  Pin Name = \count_reg[219].SI;  pinInvFromLatch = no;  Latch Index = 4646;  Latch Name = \count_reg[219].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[220] .SI = part_S_CR_4_TM_1 [36] ,   // CR = 4;  pos = 29;  Pin Index = 14222;  Pin Name = \count_reg[220].SI;  pinInvFromLatch = no;  Latch Index = 4716;  Latch Name = \count_reg[220].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[221] .SI = part_S_CR_4_TM_1 [35] ,   // CR = 4;  pos = 30;  Pin Index = 14328;  Pin Name = \count_reg[221].SI;  pinInvFromLatch = no;  Latch Index = 4751;  Latch Name = \count_reg[221].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[222] .SI = part_S_CR_4_TM_1 [34] ,   // CR = 4;  pos = 31;  Pin Index = 14434;  Pin Name = \count_reg[222].SI;  pinInvFromLatch = no;  Latch Index = 4786;  Latch Name = \count_reg[222].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[223] .SI = part_S_CR_4_TM_1 [33] ,   // CR = 4;  pos = 32;  Pin Index = 14540;  Pin Name = \count_reg[223].SI;  pinInvFromLatch = no;  Latch Index = 4821;  Latch Name = \count_reg[223].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[224] .SI = part_S_CR_4_TM_1 [32] ,   // CR = 4;  pos = 33;  Pin Index = 14646;  Pin Name = \count_reg[224].SI;  pinInvFromLatch = no;  Latch Index = 4856;  Latch Name = \count_reg[224].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[225] .SI = part_S_CR_4_TM_1 [31] ,   // CR = 4;  pos = 34;  Pin Index = 14752;  Pin Name = \count_reg[225].SI;  pinInvFromLatch = no;  Latch Index = 4891;  Latch Name = \count_reg[225].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[226] .SI = part_S_CR_4_TM_1 [30] ,   // CR = 4;  pos = 35;  Pin Index = 14858;  Pin Name = \count_reg[226].SI;  pinInvFromLatch = no;  Latch Index = 4926;  Latch Name = \count_reg[226].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[227] .SI = part_S_CR_4_TM_1 [29] ,   // CR = 4;  pos = 36;  Pin Index = 14964;  Pin Name = \count_reg[227].SI;  pinInvFromLatch = no;  Latch Index = 4961;  Latch Name = \count_reg[227].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[228] .SI = part_S_CR_4_TM_1 [28] ,   // CR = 4;  pos = 37;  Pin Index = 15070;  Pin Name = \count_reg[228].SI;  pinInvFromLatch = no;  Latch Index = 4996;  Latch Name = \count_reg[228].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[229] .SI = part_S_CR_4_TM_1 [27] ,   // CR = 4;  pos = 38;  Pin Index = 15176;  Pin Name = \count_reg[229].SI;  pinInvFromLatch = no;  Latch Index = 5031;  Latch Name = \count_reg[229].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[230] .SI = part_S_CR_4_TM_1 [26] ,   // CR = 4;  pos = 39;  Pin Index = 15388;  Pin Name = \count_reg[230].SI;  pinInvFromLatch = no;  Latch Index = 5101;  Latch Name = \count_reg[230].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[231] .SI = part_S_CR_4_TM_1 [25] ,   // CR = 4;  pos = 40;  Pin Index = 15494;  Pin Name = \count_reg[231].SI;  pinInvFromLatch = no;  Latch Index = 5136;  Latch Name = \count_reg[231].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[232] .SI = part_S_CR_4_TM_1 [24] ,   // CR = 4;  pos = 41;  Pin Index = 15600;  Pin Name = \count_reg[232].SI;  pinInvFromLatch = no;  Latch Index = 5171;  Latch Name = \count_reg[232].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[233] .SI = part_S_CR_4_TM_1 [23] ,   // CR = 4;  pos = 42;  Pin Index = 15706;  Pin Name = \count_reg[233].SI;  pinInvFromLatch = no;  Latch Index = 5206;  Latch Name = \count_reg[233].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[234] .SI = part_S_CR_4_TM_1 [22] ,   // CR = 4;  pos = 43;  Pin Index = 15812;  Pin Name = \count_reg[234].SI;  pinInvFromLatch = no;  Latch Index = 5241;  Latch Name = \count_reg[234].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[235] .SI = part_S_CR_4_TM_1 [21] ,   // CR = 4;  pos = 44;  Pin Index = 15918;  Pin Name = \count_reg[235].SI;  pinInvFromLatch = no;  Latch Index = 5276;  Latch Name = \count_reg[235].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[236] .SI = part_S_CR_4_TM_1 [20] ,   // CR = 4;  pos = 45;  Pin Index = 16024;  Pin Name = \count_reg[236].SI;  pinInvFromLatch = no;  Latch Index = 5311;  Latch Name = \count_reg[236].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[237] .SI = part_S_CR_4_TM_1 [19] ,   // CR = 4;  pos = 46;  Pin Index = 16130;  Pin Name = \count_reg[237].SI;  pinInvFromLatch = no;  Latch Index = 5346;  Latch Name = \count_reg[237].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[238] .SI = part_S_CR_4_TM_1 [18] ,   // CR = 4;  pos = 47;  Pin Index = 16236;  Pin Name = \count_reg[238].SI;  pinInvFromLatch = no;  Latch Index = 5381;  Latch Name = \count_reg[238].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[239] .SI = part_S_CR_4_TM_1 [17] ,   // CR = 4;  pos = 48;  Pin Index = 16342;  Pin Name = \count_reg[239].SI;  pinInvFromLatch = no;  Latch Index = 5416;  Latch Name = \count_reg[239].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[240] .SI = part_S_CR_4_TM_1 [16] ,   // CR = 4;  pos = 49;  Pin Index = 16554;  Pin Name = \count_reg[240].SI;  pinInvFromLatch = no;  Latch Index = 5486;  Latch Name = \count_reg[240].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[241] .SI = part_S_CR_4_TM_1 [15] ,   // CR = 4;  pos = 50;  Pin Index = 16660;  Pin Name = \count_reg[241].SI;  pinInvFromLatch = no;  Latch Index = 5521;  Latch Name = \count_reg[241].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[242] .SI = part_S_CR_4_TM_1 [14] ,   // CR = 4;  pos = 51;  Pin Index = 16766;  Pin Name = \count_reg[242].SI;  pinInvFromLatch = no;  Latch Index = 5556;  Latch Name = \count_reg[242].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[243] .SI = part_S_CR_4_TM_1 [13] ,   // CR = 4;  pos = 52;  Pin Index = 16872;  Pin Name = \count_reg[243].SI;  pinInvFromLatch = no;  Latch Index = 5591;  Latch Name = \count_reg[243].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[244] .SI = part_S_CR_4_TM_1 [12] ,   // CR = 4;  pos = 53;  Pin Index = 16978;  Pin Name = \count_reg[244].SI;  pinInvFromLatch = no;  Latch Index = 5626;  Latch Name = \count_reg[244].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[245] .SI = part_S_CR_4_TM_1 [11] ,   // CR = 4;  pos = 54;  Pin Index = 17084;  Pin Name = \count_reg[245].SI;  pinInvFromLatch = no;  Latch Index = 5661;  Latch Name = \count_reg[245].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[246] .SI = part_S_CR_4_TM_1 [10] ,   // CR = 4;  pos = 55;  Pin Index = 17190;  Pin Name = \count_reg[246].SI;  pinInvFromLatch = no;  Latch Index = 5696;  Latch Name = \count_reg[246].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[247] .SI = part_S_CR_4_TM_1 [9] ,   // CR = 4;  pos = 56;  Pin Index = 17296;  Pin Name = \count_reg[247].SI;  pinInvFromLatch = no;  Latch Index = 5731;  Latch Name = \count_reg[247].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[248] .SI = part_S_CR_4_TM_1 [8] ,   // CR = 4;  pos = 57;  Pin Index = 17402;  Pin Name = \count_reg[248].SI;  pinInvFromLatch = no;  Latch Index = 5766;  Latch Name = \count_reg[248].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[249] .SI = part_S_CR_4_TM_1 [7] ,   // CR = 4;  pos = 58;  Pin Index = 17508;  Pin Name = \count_reg[249].SI;  pinInvFromLatch = no;  Latch Index = 5801;  Latch Name = \count_reg[249].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[250] .SI = part_S_CR_4_TM_1 [6] ,   // CR = 4;  pos = 59;  Pin Index = 17720;  Pin Name = \count_reg[250].SI;  pinInvFromLatch = no;  Latch Index = 5871;  Latch Name = \count_reg[250].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[251] .SI = part_S_CR_4_TM_1 [5] ,   // CR = 4;  pos = 60;  Pin Index = 17826;  Pin Name = \count_reg[251].SI;  pinInvFromLatch = no;  Latch Index = 5906;  Latch Name = \count_reg[251].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[252] .SI = part_S_CR_4_TM_1 [4] ,   // CR = 4;  pos = 61;  Pin Index = 17932;  Pin Name = \count_reg[252].SI;  pinInvFromLatch = no;  Latch Index = 5941;  Latch Name = \count_reg[252].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[253] .SI = part_S_CR_4_TM_1 [3] ,   // CR = 4;  pos = 62;  Pin Index = 18038;  Pin Name = \count_reg[253].SI;  pinInvFromLatch = no;  Latch Index = 5976;  Latch Name = \count_reg[253].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[254] .SI = part_S_CR_4_TM_1 [2] ,   // CR = 4;  pos = 63;  Pin Index = 18144;  Pin Name = \count_reg[254].SI;  pinInvFromLatch = no;  Latch Index = 6011;  Latch Name = \count_reg[254].__iNsT2.dff_primitive;   
    counter_inst.\count_reg[255] .SI = part_S_CR_4_TM_1 [1] ;   // CR = 4;  pos = 64;  Pin Index = 18250;  Pin Name = \count_reg[255].SI;  pinInvFromLatch = no;  Latch Index = 6046;  Latch Name = \count_reg[255].__iNsT2.dff_primitive;   

  assign // OR = 1 
    part_M_OR_1_TM_1 [1] =  counter_inst.DFT_sdo_1 ,   // OR = 1;  pos = 1;  Pin Index = 9;  Pin Name = DFT_sdo_1;  pinInvFromLatch = no;  Latch Index = 7551;  Latch Name = \count_reg[63].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [2] =  counter_inst.\count_reg[62] .Q ,   // OR = 1;  pos = 2;  Pin Index = 22703;  Pin Name = \count_reg[62].Q;  pinInvFromLatch = no;  Latch Index = 7516;  Latch Name = \count_reg[62].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [3] =  counter_inst.\count_reg[61] .Q ,   // OR = 1;  pos = 3;  Pin Index = 22597;  Pin Name = \count_reg[61].Q;  pinInvFromLatch = no;  Latch Index = 7481;  Latch Name = \count_reg[61].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [4] =  counter_inst.\count_reg[60] .Q ,   // OR = 1;  pos = 4;  Pin Index = 22491;  Pin Name = \count_reg[60].Q;  pinInvFromLatch = no;  Latch Index = 7446;  Latch Name = \count_reg[60].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [5] =  counter_inst.\count_reg[59] .Q ,   // OR = 1;  pos = 5;  Pin Index = 22279;  Pin Name = \count_reg[59].Q;  pinInvFromLatch = no;  Latch Index = 7376;  Latch Name = \count_reg[59].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [6] =  counter_inst.\count_reg[58] .Q ,   // OR = 1;  pos = 6;  Pin Index = 22173;  Pin Name = \count_reg[58].Q;  pinInvFromLatch = no;  Latch Index = 7341;  Latch Name = \count_reg[58].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [7] =  counter_inst.\count_reg[57] .Q ,   // OR = 1;  pos = 7;  Pin Index = 22067;  Pin Name = \count_reg[57].Q;  pinInvFromLatch = no;  Latch Index = 7306;  Latch Name = \count_reg[57].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [8] =  counter_inst.\count_reg[56] .Q ,   // OR = 1;  pos = 8;  Pin Index = 21961;  Pin Name = \count_reg[56].Q;  pinInvFromLatch = no;  Latch Index = 7271;  Latch Name = \count_reg[56].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [9] =  counter_inst.\count_reg[55] .Q ,   // OR = 1;  pos = 9;  Pin Index = 21855;  Pin Name = \count_reg[55].Q;  pinInvFromLatch = no;  Latch Index = 7236;  Latch Name = \count_reg[55].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [10] =  counter_inst.\count_reg[54] .Q ,   // OR = 1;  pos = 10;  Pin Index = 21749;  Pin Name = \count_reg[54].Q;  pinInvFromLatch = no;  Latch Index = 7201;  Latch Name = \count_reg[54].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [11] =  counter_inst.\count_reg[53] .Q ,   // OR = 1;  pos = 11;  Pin Index = 21643;  Pin Name = \count_reg[53].Q;  pinInvFromLatch = no;  Latch Index = 7166;  Latch Name = \count_reg[53].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [12] =  counter_inst.\count_reg[52] .Q ,   // OR = 1;  pos = 12;  Pin Index = 21537;  Pin Name = \count_reg[52].Q;  pinInvFromLatch = no;  Latch Index = 7131;  Latch Name = \count_reg[52].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [13] =  counter_inst.\count_reg[51] .Q ,   // OR = 1;  pos = 13;  Pin Index = 21431;  Pin Name = \count_reg[51].Q;  pinInvFromLatch = no;  Latch Index = 7096;  Latch Name = \count_reg[51].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [14] =  counter_inst.\count_reg[50] .Q ,   // OR = 1;  pos = 14;  Pin Index = 21325;  Pin Name = \count_reg[50].Q;  pinInvFromLatch = no;  Latch Index = 7061;  Latch Name = \count_reg[50].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [15] =  counter_inst.\count_reg[49] .Q ,   // OR = 1;  pos = 15;  Pin Index = 21113;  Pin Name = \count_reg[49].Q;  pinInvFromLatch = no;  Latch Index = 6991;  Latch Name = \count_reg[49].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [16] =  counter_inst.\count_reg[48] .Q ,   // OR = 1;  pos = 16;  Pin Index = 21007;  Pin Name = \count_reg[48].Q;  pinInvFromLatch = no;  Latch Index = 6956;  Latch Name = \count_reg[48].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [17] =  counter_inst.\count_reg[47] .Q ,   // OR = 1;  pos = 17;  Pin Index = 20901;  Pin Name = \count_reg[47].Q;  pinInvFromLatch = no;  Latch Index = 6921;  Latch Name = \count_reg[47].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [18] =  counter_inst.\count_reg[46] .Q ,   // OR = 1;  pos = 18;  Pin Index = 20795;  Pin Name = \count_reg[46].Q;  pinInvFromLatch = no;  Latch Index = 6886;  Latch Name = \count_reg[46].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [19] =  counter_inst.\count_reg[45] .Q ,   // OR = 1;  pos = 19;  Pin Index = 20689;  Pin Name = \count_reg[45].Q;  pinInvFromLatch = no;  Latch Index = 6851;  Latch Name = \count_reg[45].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [20] =  counter_inst.\count_reg[44] .Q ,   // OR = 1;  pos = 20;  Pin Index = 20583;  Pin Name = \count_reg[44].Q;  pinInvFromLatch = no;  Latch Index = 6816;  Latch Name = \count_reg[44].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [21] =  counter_inst.\count_reg[43] .Q ,   // OR = 1;  pos = 21;  Pin Index = 20477;  Pin Name = \count_reg[43].Q;  pinInvFromLatch = no;  Latch Index = 6781;  Latch Name = \count_reg[43].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [22] =  counter_inst.\count_reg[42] .Q ,   // OR = 1;  pos = 22;  Pin Index = 20371;  Pin Name = \count_reg[42].Q;  pinInvFromLatch = no;  Latch Index = 6746;  Latch Name = \count_reg[42].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [23] =  counter_inst.\count_reg[41] .Q ,   // OR = 1;  pos = 23;  Pin Index = 20265;  Pin Name = \count_reg[41].Q;  pinInvFromLatch = no;  Latch Index = 6711;  Latch Name = \count_reg[41].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [24] =  counter_inst.\count_reg[40] .Q ,   // OR = 1;  pos = 24;  Pin Index = 20159;  Pin Name = \count_reg[40].Q;  pinInvFromLatch = no;  Latch Index = 6676;  Latch Name = \count_reg[40].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [25] =  counter_inst.\count_reg[39] .Q ,   // OR = 1;  pos = 25;  Pin Index = 19947;  Pin Name = \count_reg[39].Q;  pinInvFromLatch = no;  Latch Index = 6606;  Latch Name = \count_reg[39].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [26] =  counter_inst.\count_reg[38] .Q ,   // OR = 1;  pos = 26;  Pin Index = 19841;  Pin Name = \count_reg[38].Q;  pinInvFromLatch = no;  Latch Index = 6571;  Latch Name = \count_reg[38].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [27] =  counter_inst.\count_reg[37] .Q ,   // OR = 1;  pos = 27;  Pin Index = 19735;  Pin Name = \count_reg[37].Q;  pinInvFromLatch = no;  Latch Index = 6536;  Latch Name = \count_reg[37].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [28] =  counter_inst.\count_reg[36] .Q ,   // OR = 1;  pos = 28;  Pin Index = 19629;  Pin Name = \count_reg[36].Q;  pinInvFromLatch = no;  Latch Index = 6501;  Latch Name = \count_reg[36].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [29] =  counter_inst.\count_reg[35] .Q ,   // OR = 1;  pos = 29;  Pin Index = 19523;  Pin Name = \count_reg[35].Q;  pinInvFromLatch = no;  Latch Index = 6466;  Latch Name = \count_reg[35].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [30] =  counter_inst.\count_reg[34] .Q ,   // OR = 1;  pos = 30;  Pin Index = 19417;  Pin Name = \count_reg[34].Q;  pinInvFromLatch = no;  Latch Index = 6431;  Latch Name = \count_reg[34].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [31] =  counter_inst.\count_reg[33] .Q ,   // OR = 1;  pos = 31;  Pin Index = 19311;  Pin Name = \count_reg[33].Q;  pinInvFromLatch = no;  Latch Index = 6396;  Latch Name = \count_reg[33].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [32] =  counter_inst.\count_reg[32] .Q ,   // OR = 1;  pos = 32;  Pin Index = 19205;  Pin Name = \count_reg[32].Q;  pinInvFromLatch = no;  Latch Index = 6361;  Latch Name = \count_reg[32].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [33] =  counter_inst.\count_reg[31] .Q ,   // OR = 1;  pos = 33;  Pin Index = 19099;  Pin Name = \count_reg[31].Q;  pinInvFromLatch = no;  Latch Index = 6326;  Latch Name = \count_reg[31].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [34] =  counter_inst.\count_reg[30] .Q ,   // OR = 1;  pos = 34;  Pin Index = 18993;  Pin Name = \count_reg[30].Q;  pinInvFromLatch = no;  Latch Index = 6291;  Latch Name = \count_reg[30].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [35] =  counter_inst.\count_reg[29] .Q ,   // OR = 1;  pos = 35;  Pin Index = 18781;  Pin Name = \count_reg[29].Q;  pinInvFromLatch = no;  Latch Index = 6221;  Latch Name = \count_reg[29].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [36] =  counter_inst.\count_reg[28] .Q ,   // OR = 1;  pos = 36;  Pin Index = 18675;  Pin Name = \count_reg[28].Q;  pinInvFromLatch = no;  Latch Index = 6186;  Latch Name = \count_reg[28].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [37] =  counter_inst.\count_reg[27] .Q ,   // OR = 1;  pos = 37;  Pin Index = 18569;  Pin Name = \count_reg[27].Q;  pinInvFromLatch = no;  Latch Index = 6151;  Latch Name = \count_reg[27].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [38] =  counter_inst.\count_reg[26] .Q ,   // OR = 1;  pos = 38;  Pin Index = 18463;  Pin Name = \count_reg[26].Q;  pinInvFromLatch = no;  Latch Index = 6116;  Latch Name = \count_reg[26].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [39] =  counter_inst.\count_reg[25] .Q ,   // OR = 1;  pos = 39;  Pin Index = 18357;  Pin Name = \count_reg[25].Q;  pinInvFromLatch = no;  Latch Index = 6081;  Latch Name = \count_reg[25].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [40] =  counter_inst.\count_reg[24] .Q ,   // OR = 1;  pos = 40;  Pin Index = 17615;  Pin Name = \count_reg[24].Q;  pinInvFromLatch = no;  Latch Index = 5836;  Latch Name = \count_reg[24].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [41] =  counter_inst.\count_reg[23] .Q ,   // OR = 1;  pos = 41;  Pin Index = 16449;  Pin Name = \count_reg[23].Q;  pinInvFromLatch = no;  Latch Index = 5451;  Latch Name = \count_reg[23].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [42] =  counter_inst.\count_reg[22] .Q ,   // OR = 1;  pos = 42;  Pin Index = 15283;  Pin Name = \count_reg[22].Q;  pinInvFromLatch = no;  Latch Index = 5066;  Latch Name = \count_reg[22].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [43] =  counter_inst.\count_reg[21] .Q ,   // OR = 1;  pos = 43;  Pin Index = 14117;  Pin Name = \count_reg[21].Q;  pinInvFromLatch = no;  Latch Index = 4681;  Latch Name = \count_reg[21].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [44] =  counter_inst.\count_reg[20] .Q ,   // OR = 1;  pos = 44;  Pin Index = 12951;  Pin Name = \count_reg[20].Q;  pinInvFromLatch = no;  Latch Index = 4296;  Latch Name = \count_reg[20].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [45] =  counter_inst.\count_reg[19] .Q ,   // OR = 1;  pos = 45;  Pin Index = 11679;  Pin Name = \count_reg[19].Q;  pinInvFromLatch = no;  Latch Index = 3876;  Latch Name = \count_reg[19].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [46] =  counter_inst.\count_reg[18] .Q ,   // OR = 1;  pos = 46;  Pin Index = 10513;  Pin Name = \count_reg[18].Q;  pinInvFromLatch = no;  Latch Index = 3491;  Latch Name = \count_reg[18].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [47] =  counter_inst.\count_reg[17] .Q ,   // OR = 1;  pos = 47;  Pin Index = 9347;  Pin Name = \count_reg[17].Q;  pinInvFromLatch = no;  Latch Index = 3106;  Latch Name = \count_reg[17].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [48] =  counter_inst.\count_reg[16] .Q ,   // OR = 1;  pos = 48;  Pin Index = 8181;  Pin Name = \count_reg[16].Q;  pinInvFromLatch = no;  Latch Index = 2721;  Latch Name = \count_reg[16].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [49] =  counter_inst.\count_reg[15] .Q ,   // OR = 1;  pos = 49;  Pin Index = 7015;  Pin Name = \count_reg[15].Q;  pinInvFromLatch = no;  Latch Index = 2336;  Latch Name = \count_reg[15].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [50] =  counter_inst.\count_reg[14] .Q ,   // OR = 1;  pos = 50;  Pin Index = 5849;  Pin Name = \count_reg[14].Q;  pinInvFromLatch = no;  Latch Index = 1951;  Latch Name = \count_reg[14].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [51] =  counter_inst.\count_reg[13] .Q ,   // OR = 1;  pos = 51;  Pin Index = 4683;  Pin Name = \count_reg[13].Q;  pinInvFromLatch = no;  Latch Index = 1566;  Latch Name = \count_reg[13].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [52] =  counter_inst.\count_reg[12] .Q ,   // OR = 1;  pos = 52;  Pin Index = 3517;  Pin Name = \count_reg[12].Q;  pinInvFromLatch = no;  Latch Index = 1181;  Latch Name = \count_reg[12].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [53] =  counter_inst.\count_reg[11] .Q ,   // OR = 1;  pos = 53;  Pin Index = 2351;  Pin Name = \count_reg[11].Q;  pinInvFromLatch = no;  Latch Index = 796;  Latch Name = \count_reg[11].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [54] =  counter_inst.\count_reg[10] .Q ,   // OR = 1;  pos = 54;  Pin Index = 1185;  Pin Name = \count_reg[10].Q;  pinInvFromLatch = no;  Latch Index = 411;  Latch Name = \count_reg[10].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [55] =  counter_inst.\count_reg[9] .Q ,   // OR = 1;  pos = 55;  Pin Index = 27049;  Pin Name = \count_reg[9].Q;  pinInvFromLatch = no;  Latch Index = 8951;  Latch Name = \count_reg[9].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [56] =  counter_inst.\count_reg[8] .Q ,   // OR = 1;  pos = 56;  Pin Index = 25883;  Pin Name = \count_reg[8].Q;  pinInvFromLatch = no;  Latch Index = 8566;  Latch Name = \count_reg[8].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [57] =  counter_inst.\count_reg[7] .Q ,   // OR = 1;  pos = 57;  Pin Index = 24717;  Pin Name = \count_reg[7].Q;  pinInvFromLatch = no;  Latch Index = 8181;  Latch Name = \count_reg[7].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [58] =  counter_inst.\count_reg[6] .Q ,   // OR = 1;  pos = 58;  Pin Index = 23551;  Pin Name = \count_reg[6].Q;  pinInvFromLatch = no;  Latch Index = 7796;  Latch Name = \count_reg[6].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [59] =  counter_inst.\count_reg[5] .Q ,   // OR = 1;  pos = 59;  Pin Index = 22385;  Pin Name = \count_reg[5].Q;  pinInvFromLatch = no;  Latch Index = 7411;  Latch Name = \count_reg[5].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [60] =  counter_inst.\count_reg[4] .Q ,   // OR = 1;  pos = 60;  Pin Index = 21219;  Pin Name = \count_reg[4].Q;  pinInvFromLatch = no;  Latch Index = 7026;  Latch Name = \count_reg[4].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [61] =  counter_inst.\count_reg[3] .Q ,   // OR = 1;  pos = 61;  Pin Index = 20053;  Pin Name = \count_reg[3].Q;  pinInvFromLatch = no;  Latch Index = 6641;  Latch Name = \count_reg[3].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [62] =  counter_inst.\count_reg[2] .Q ,   // OR = 1;  pos = 62;  Pin Index = 18887;  Pin Name = \count_reg[2].Q;  pinInvFromLatch = no;  Latch Index = 6256;  Latch Name = \count_reg[2].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [63] =  counter_inst.\count_reg[1] .Q ,   // OR = 1;  pos = 63;  Pin Index = 11785;  Pin Name = \count_reg[1].Q;  pinInvFromLatch = no;  Latch Index = 3911;  Latch Name = \count_reg[1].__iNsT2.dff_primitive;   
    part_M_OR_1_TM_1 [64] =  counter_inst.\count_reg[0] .Q ;   // OR = 1;  pos = 64;  Pin Index = 19;  Pin Name = \count_reg[0].Q;  pinInvFromLatch = no;  Latch Index = 26;  Latch Name = \count_reg[0].__iNsT2.dff_primitive;   

  assign // OR = 2 
    part_M_OR_2_TM_1 [1] =  counter_inst.DFT_sdo_2 ,   // OR = 2;  pos = 1;  Pin Index = 10;  Pin Name = DFT_sdo_2;  pinInvFromLatch = no;  Latch Index = 1076;  Latch Name = \count_reg[127].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [2] =  counter_inst.\count_reg[126] .Q ,   // OR = 2;  pos = 2;  Pin Index = 3093;  Pin Name = \count_reg[126].Q;  pinInvFromLatch = no;  Latch Index = 1041;  Latch Name = \count_reg[126].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [3] =  counter_inst.\count_reg[125] .Q ,   // OR = 2;  pos = 3;  Pin Index = 2987;  Pin Name = \count_reg[125].Q;  pinInvFromLatch = no;  Latch Index = 1006;  Latch Name = \count_reg[125].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [4] =  counter_inst.\count_reg[124] .Q ,   // OR = 2;  pos = 4;  Pin Index = 2881;  Pin Name = \count_reg[124].Q;  pinInvFromLatch = no;  Latch Index = 971;  Latch Name = \count_reg[124].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [5] =  counter_inst.\count_reg[123] .Q ,   // OR = 2;  pos = 5;  Pin Index = 2775;  Pin Name = \count_reg[123].Q;  pinInvFromLatch = no;  Latch Index = 936;  Latch Name = \count_reg[123].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [6] =  counter_inst.\count_reg[122] .Q ,   // OR = 2;  pos = 6;  Pin Index = 2669;  Pin Name = \count_reg[122].Q;  pinInvFromLatch = no;  Latch Index = 901;  Latch Name = \count_reg[122].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [7] =  counter_inst.\count_reg[121] .Q ,   // OR = 2;  pos = 7;  Pin Index = 2563;  Pin Name = \count_reg[121].Q;  pinInvFromLatch = no;  Latch Index = 866;  Latch Name = \count_reg[121].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [8] =  counter_inst.\count_reg[120] .Q ,   // OR = 2;  pos = 8;  Pin Index = 2457;  Pin Name = \count_reg[120].Q;  pinInvFromLatch = no;  Latch Index = 831;  Latch Name = \count_reg[120].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [9] =  counter_inst.\count_reg[119] .Q ,   // OR = 2;  pos = 9;  Pin Index = 2245;  Pin Name = \count_reg[119].Q;  pinInvFromLatch = no;  Latch Index = 761;  Latch Name = \count_reg[119].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [10] =  counter_inst.\count_reg[118] .Q ,   // OR = 2;  pos = 10;  Pin Index = 2139;  Pin Name = \count_reg[118].Q;  pinInvFromLatch = no;  Latch Index = 726;  Latch Name = \count_reg[118].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [11] =  counter_inst.\count_reg[117] .Q ,   // OR = 2;  pos = 11;  Pin Index = 2033;  Pin Name = \count_reg[117].Q;  pinInvFromLatch = no;  Latch Index = 691;  Latch Name = \count_reg[117].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [12] =  counter_inst.\count_reg[116] .Q ,   // OR = 2;  pos = 12;  Pin Index = 1927;  Pin Name = \count_reg[116].Q;  pinInvFromLatch = no;  Latch Index = 656;  Latch Name = \count_reg[116].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [13] =  counter_inst.\count_reg[115] .Q ,   // OR = 2;  pos = 13;  Pin Index = 1821;  Pin Name = \count_reg[115].Q;  pinInvFromLatch = no;  Latch Index = 621;  Latch Name = \count_reg[115].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [14] =  counter_inst.\count_reg[114] .Q ,   // OR = 2;  pos = 14;  Pin Index = 1715;  Pin Name = \count_reg[114].Q;  pinInvFromLatch = no;  Latch Index = 586;  Latch Name = \count_reg[114].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [15] =  counter_inst.\count_reg[113] .Q ,   // OR = 2;  pos = 15;  Pin Index = 1609;  Pin Name = \count_reg[113].Q;  pinInvFromLatch = no;  Latch Index = 551;  Latch Name = \count_reg[113].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [16] =  counter_inst.\count_reg[112] .Q ,   // OR = 2;  pos = 16;  Pin Index = 1503;  Pin Name = \count_reg[112].Q;  pinInvFromLatch = no;  Latch Index = 516;  Latch Name = \count_reg[112].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [17] =  counter_inst.\count_reg[111] .Q ,   // OR = 2;  pos = 17;  Pin Index = 1397;  Pin Name = \count_reg[111].Q;  pinInvFromLatch = no;  Latch Index = 481;  Latch Name = \count_reg[111].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [18] =  counter_inst.\count_reg[110] .Q ,   // OR = 2;  pos = 18;  Pin Index = 1291;  Pin Name = \count_reg[110].Q;  pinInvFromLatch = no;  Latch Index = 446;  Latch Name = \count_reg[110].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [19] =  counter_inst.\count_reg[109] .Q ,   // OR = 2;  pos = 19;  Pin Index = 1079;  Pin Name = \count_reg[109].Q;  pinInvFromLatch = no;  Latch Index = 376;  Latch Name = \count_reg[109].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [20] =  counter_inst.\count_reg[108] .Q ,   // OR = 2;  pos = 20;  Pin Index = 973;  Pin Name = \count_reg[108].Q;  pinInvFromLatch = no;  Latch Index = 341;  Latch Name = \count_reg[108].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [21] =  counter_inst.\count_reg[107] .Q ,   // OR = 2;  pos = 21;  Pin Index = 867;  Pin Name = \count_reg[107].Q;  pinInvFromLatch = no;  Latch Index = 306;  Latch Name = \count_reg[107].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [22] =  counter_inst.\count_reg[106] .Q ,   // OR = 2;  pos = 22;  Pin Index = 761;  Pin Name = \count_reg[106].Q;  pinInvFromLatch = no;  Latch Index = 271;  Latch Name = \count_reg[106].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [23] =  counter_inst.\count_reg[105] .Q ,   // OR = 2;  pos = 23;  Pin Index = 655;  Pin Name = \count_reg[105].Q;  pinInvFromLatch = no;  Latch Index = 236;  Latch Name = \count_reg[105].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [24] =  counter_inst.\count_reg[104] .Q ,   // OR = 2;  pos = 24;  Pin Index = 549;  Pin Name = \count_reg[104].Q;  pinInvFromLatch = no;  Latch Index = 201;  Latch Name = \count_reg[104].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [25] =  counter_inst.\count_reg[103] .Q ,   // OR = 2;  pos = 25;  Pin Index = 443;  Pin Name = \count_reg[103].Q;  pinInvFromLatch = no;  Latch Index = 166;  Latch Name = \count_reg[103].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [26] =  counter_inst.\count_reg[102] .Q ,   // OR = 2;  pos = 26;  Pin Index = 337;  Pin Name = \count_reg[102].Q;  pinInvFromLatch = no;  Latch Index = 131;  Latch Name = \count_reg[102].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [27] =  counter_inst.\count_reg[101] .Q ,   // OR = 2;  pos = 27;  Pin Index = 231;  Pin Name = \count_reg[101].Q;  pinInvFromLatch = no;  Latch Index = 96;  Latch Name = \count_reg[101].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [28] =  counter_inst.\count_reg[100] .Q ,   // OR = 2;  pos = 28;  Pin Index = 125;  Pin Name = \count_reg[100].Q;  pinInvFromLatch = no;  Latch Index = 61;  Latch Name = \count_reg[100].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [29] =  counter_inst.\count_reg[99] .Q ,   // OR = 2;  pos = 29;  Pin Index = 26943;  Pin Name = \count_reg[99].Q;  pinInvFromLatch = no;  Latch Index = 8916;  Latch Name = \count_reg[99].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [30] =  counter_inst.\count_reg[98] .Q ,   // OR = 2;  pos = 30;  Pin Index = 26837;  Pin Name = \count_reg[98].Q;  pinInvFromLatch = no;  Latch Index = 8881;  Latch Name = \count_reg[98].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [31] =  counter_inst.\count_reg[97] .Q ,   // OR = 2;  pos = 31;  Pin Index = 26731;  Pin Name = \count_reg[97].Q;  pinInvFromLatch = no;  Latch Index = 8846;  Latch Name = \count_reg[97].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [32] =  counter_inst.\count_reg[96] .Q ,   // OR = 2;  pos = 32;  Pin Index = 26625;  Pin Name = \count_reg[96].Q;  pinInvFromLatch = no;  Latch Index = 8811;  Latch Name = \count_reg[96].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [33] =  counter_inst.\count_reg[95] .Q ,   // OR = 2;  pos = 33;  Pin Index = 26519;  Pin Name = \count_reg[95].Q;  pinInvFromLatch = no;  Latch Index = 8776;  Latch Name = \count_reg[95].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [34] =  counter_inst.\count_reg[94] .Q ,   // OR = 2;  pos = 34;  Pin Index = 26413;  Pin Name = \count_reg[94].Q;  pinInvFromLatch = no;  Latch Index = 8741;  Latch Name = \count_reg[94].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [35] =  counter_inst.\count_reg[93] .Q ,   // OR = 2;  pos = 35;  Pin Index = 26307;  Pin Name = \count_reg[93].Q;  pinInvFromLatch = no;  Latch Index = 8706;  Latch Name = \count_reg[93].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [36] =  counter_inst.\count_reg[92] .Q ,   // OR = 2;  pos = 36;  Pin Index = 26201;  Pin Name = \count_reg[92].Q;  pinInvFromLatch = no;  Latch Index = 8671;  Latch Name = \count_reg[92].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [37] =  counter_inst.\count_reg[91] .Q ,   // OR = 2;  pos = 37;  Pin Index = 26095;  Pin Name = \count_reg[91].Q;  pinInvFromLatch = no;  Latch Index = 8636;  Latch Name = \count_reg[91].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [38] =  counter_inst.\count_reg[90] .Q ,   // OR = 2;  pos = 38;  Pin Index = 25989;  Pin Name = \count_reg[90].Q;  pinInvFromLatch = no;  Latch Index = 8601;  Latch Name = \count_reg[90].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [39] =  counter_inst.\count_reg[89] .Q ,   // OR = 2;  pos = 39;  Pin Index = 25777;  Pin Name = \count_reg[89].Q;  pinInvFromLatch = no;  Latch Index = 8531;  Latch Name = \count_reg[89].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [40] =  counter_inst.\count_reg[88] .Q ,   // OR = 2;  pos = 40;  Pin Index = 25671;  Pin Name = \count_reg[88].Q;  pinInvFromLatch = no;  Latch Index = 8496;  Latch Name = \count_reg[88].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [41] =  counter_inst.\count_reg[87] .Q ,   // OR = 2;  pos = 41;  Pin Index = 25565;  Pin Name = \count_reg[87].Q;  pinInvFromLatch = no;  Latch Index = 8461;  Latch Name = \count_reg[87].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [42] =  counter_inst.\count_reg[86] .Q ,   // OR = 2;  pos = 42;  Pin Index = 25459;  Pin Name = \count_reg[86].Q;  pinInvFromLatch = no;  Latch Index = 8426;  Latch Name = \count_reg[86].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [43] =  counter_inst.\count_reg[85] .Q ,   // OR = 2;  pos = 43;  Pin Index = 25353;  Pin Name = \count_reg[85].Q;  pinInvFromLatch = no;  Latch Index = 8391;  Latch Name = \count_reg[85].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [44] =  counter_inst.\count_reg[84] .Q ,   // OR = 2;  pos = 44;  Pin Index = 25247;  Pin Name = \count_reg[84].Q;  pinInvFromLatch = no;  Latch Index = 8356;  Latch Name = \count_reg[84].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [45] =  counter_inst.\count_reg[83] .Q ,   // OR = 2;  pos = 45;  Pin Index = 25141;  Pin Name = \count_reg[83].Q;  pinInvFromLatch = no;  Latch Index = 8321;  Latch Name = \count_reg[83].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [46] =  counter_inst.\count_reg[82] .Q ,   // OR = 2;  pos = 46;  Pin Index = 25035;  Pin Name = \count_reg[82].Q;  pinInvFromLatch = no;  Latch Index = 8286;  Latch Name = \count_reg[82].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [47] =  counter_inst.\count_reg[81] .Q ,   // OR = 2;  pos = 47;  Pin Index = 24929;  Pin Name = \count_reg[81].Q;  pinInvFromLatch = no;  Latch Index = 8251;  Latch Name = \count_reg[81].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [48] =  counter_inst.\count_reg[80] .Q ,   // OR = 2;  pos = 48;  Pin Index = 24823;  Pin Name = \count_reg[80].Q;  pinInvFromLatch = no;  Latch Index = 8216;  Latch Name = \count_reg[80].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [49] =  counter_inst.\count_reg[79] .Q ,   // OR = 2;  pos = 49;  Pin Index = 24611;  Pin Name = \count_reg[79].Q;  pinInvFromLatch = no;  Latch Index = 8146;  Latch Name = \count_reg[79].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [50] =  counter_inst.\count_reg[78] .Q ,   // OR = 2;  pos = 50;  Pin Index = 24505;  Pin Name = \count_reg[78].Q;  pinInvFromLatch = no;  Latch Index = 8111;  Latch Name = \count_reg[78].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [51] =  counter_inst.\count_reg[77] .Q ,   // OR = 2;  pos = 51;  Pin Index = 24399;  Pin Name = \count_reg[77].Q;  pinInvFromLatch = no;  Latch Index = 8076;  Latch Name = \count_reg[77].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [52] =  counter_inst.\count_reg[76] .Q ,   // OR = 2;  pos = 52;  Pin Index = 24293;  Pin Name = \count_reg[76].Q;  pinInvFromLatch = no;  Latch Index = 8041;  Latch Name = \count_reg[76].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [53] =  counter_inst.\count_reg[75] .Q ,   // OR = 2;  pos = 53;  Pin Index = 24187;  Pin Name = \count_reg[75].Q;  pinInvFromLatch = no;  Latch Index = 8006;  Latch Name = \count_reg[75].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [54] =  counter_inst.\count_reg[74] .Q ,   // OR = 2;  pos = 54;  Pin Index = 24081;  Pin Name = \count_reg[74].Q;  pinInvFromLatch = no;  Latch Index = 7971;  Latch Name = \count_reg[74].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [55] =  counter_inst.\count_reg[73] .Q ,   // OR = 2;  pos = 55;  Pin Index = 23975;  Pin Name = \count_reg[73].Q;  pinInvFromLatch = no;  Latch Index = 7936;  Latch Name = \count_reg[73].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [56] =  counter_inst.\count_reg[72] .Q ,   // OR = 2;  pos = 56;  Pin Index = 23869;  Pin Name = \count_reg[72].Q;  pinInvFromLatch = no;  Latch Index = 7901;  Latch Name = \count_reg[72].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [57] =  counter_inst.\count_reg[71] .Q ,   // OR = 2;  pos = 57;  Pin Index = 23763;  Pin Name = \count_reg[71].Q;  pinInvFromLatch = no;  Latch Index = 7866;  Latch Name = \count_reg[71].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [58] =  counter_inst.\count_reg[70] .Q ,   // OR = 2;  pos = 58;  Pin Index = 23657;  Pin Name = \count_reg[70].Q;  pinInvFromLatch = no;  Latch Index = 7831;  Latch Name = \count_reg[70].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [59] =  counter_inst.\count_reg[69] .Q ,   // OR = 2;  pos = 59;  Pin Index = 23445;  Pin Name = \count_reg[69].Q;  pinInvFromLatch = no;  Latch Index = 7761;  Latch Name = \count_reg[69].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [60] =  counter_inst.\count_reg[68] .Q ,   // OR = 2;  pos = 60;  Pin Index = 23339;  Pin Name = \count_reg[68].Q;  pinInvFromLatch = no;  Latch Index = 7726;  Latch Name = \count_reg[68].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [61] =  counter_inst.\count_reg[67] .Q ,   // OR = 2;  pos = 61;  Pin Index = 23233;  Pin Name = \count_reg[67].Q;  pinInvFromLatch = no;  Latch Index = 7691;  Latch Name = \count_reg[67].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [62] =  counter_inst.\count_reg[66] .Q ,   // OR = 2;  pos = 62;  Pin Index = 23127;  Pin Name = \count_reg[66].Q;  pinInvFromLatch = no;  Latch Index = 7656;  Latch Name = \count_reg[66].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [63] =  counter_inst.\count_reg[65] .Q ,   // OR = 2;  pos = 63;  Pin Index = 23021;  Pin Name = \count_reg[65].Q;  pinInvFromLatch = no;  Latch Index = 7621;  Latch Name = \count_reg[65].__iNsT2.dff_primitive;   
    part_M_OR_2_TM_1 [64] =  counter_inst.\count_reg[64] .Q ;   // OR = 2;  pos = 64;  Pin Index = 22915;  Pin Name = \count_reg[64].Q;  pinInvFromLatch = no;  Latch Index = 7586;  Latch Name = \count_reg[64].__iNsT2.dff_primitive;   

  assign // OR = 3 
    part_M_OR_3_TM_1 [1] =  counter_inst.DFT_sdo_3 ,   // OR = 3;  pos = 1;  Pin Index = 11;  Pin Name = DFT_sdo_3;  pinInvFromLatch = no;  Latch Index = 3561;  Latch Name = \count_reg[191].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [2] =  counter_inst.\count_reg[190] .Q ,   // OR = 3;  pos = 2;  Pin Index = 10619;  Pin Name = \count_reg[190].Q;  pinInvFromLatch = no;  Latch Index = 3526;  Latch Name = \count_reg[190].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [3] =  counter_inst.\count_reg[189] .Q ,   // OR = 3;  pos = 3;  Pin Index = 10407;  Pin Name = \count_reg[189].Q;  pinInvFromLatch = no;  Latch Index = 3456;  Latch Name = \count_reg[189].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [4] =  counter_inst.\count_reg[188] .Q ,   // OR = 3;  pos = 4;  Pin Index = 10301;  Pin Name = \count_reg[188].Q;  pinInvFromLatch = no;  Latch Index = 3421;  Latch Name = \count_reg[188].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [5] =  counter_inst.\count_reg[187] .Q ,   // OR = 3;  pos = 5;  Pin Index = 10195;  Pin Name = \count_reg[187].Q;  pinInvFromLatch = no;  Latch Index = 3386;  Latch Name = \count_reg[187].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [6] =  counter_inst.\count_reg[186] .Q ,   // OR = 3;  pos = 6;  Pin Index = 10089;  Pin Name = \count_reg[186].Q;  pinInvFromLatch = no;  Latch Index = 3351;  Latch Name = \count_reg[186].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [7] =  counter_inst.\count_reg[185] .Q ,   // OR = 3;  pos = 7;  Pin Index = 9983;  Pin Name = \count_reg[185].Q;  pinInvFromLatch = no;  Latch Index = 3316;  Latch Name = \count_reg[185].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [8] =  counter_inst.\count_reg[184] .Q ,   // OR = 3;  pos = 8;  Pin Index = 9877;  Pin Name = \count_reg[184].Q;  pinInvFromLatch = no;  Latch Index = 3281;  Latch Name = \count_reg[184].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [9] =  counter_inst.\count_reg[183] .Q ,   // OR = 3;  pos = 9;  Pin Index = 9771;  Pin Name = \count_reg[183].Q;  pinInvFromLatch = no;  Latch Index = 3246;  Latch Name = \count_reg[183].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [10] =  counter_inst.\count_reg[182] .Q ,   // OR = 3;  pos = 10;  Pin Index = 9665;  Pin Name = \count_reg[182].Q;  pinInvFromLatch = no;  Latch Index = 3211;  Latch Name = \count_reg[182].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [11] =  counter_inst.\count_reg[181] .Q ,   // OR = 3;  pos = 11;  Pin Index = 9559;  Pin Name = \count_reg[181].Q;  pinInvFromLatch = no;  Latch Index = 3176;  Latch Name = \count_reg[181].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [12] =  counter_inst.\count_reg[180] .Q ,   // OR = 3;  pos = 12;  Pin Index = 9453;  Pin Name = \count_reg[180].Q;  pinInvFromLatch = no;  Latch Index = 3141;  Latch Name = \count_reg[180].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [13] =  counter_inst.\count_reg[179] .Q ,   // OR = 3;  pos = 13;  Pin Index = 9241;  Pin Name = \count_reg[179].Q;  pinInvFromLatch = no;  Latch Index = 3071;  Latch Name = \count_reg[179].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [14] =  counter_inst.\count_reg[178] .Q ,   // OR = 3;  pos = 14;  Pin Index = 9135;  Pin Name = \count_reg[178].Q;  pinInvFromLatch = no;  Latch Index = 3036;  Latch Name = \count_reg[178].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [15] =  counter_inst.\count_reg[177] .Q ,   // OR = 3;  pos = 15;  Pin Index = 9029;  Pin Name = \count_reg[177].Q;  pinInvFromLatch = no;  Latch Index = 3001;  Latch Name = \count_reg[177].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [16] =  counter_inst.\count_reg[176] .Q ,   // OR = 3;  pos = 16;  Pin Index = 8923;  Pin Name = \count_reg[176].Q;  pinInvFromLatch = no;  Latch Index = 2966;  Latch Name = \count_reg[176].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [17] =  counter_inst.\count_reg[175] .Q ,   // OR = 3;  pos = 17;  Pin Index = 8817;  Pin Name = \count_reg[175].Q;  pinInvFromLatch = no;  Latch Index = 2931;  Latch Name = \count_reg[175].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [18] =  counter_inst.\count_reg[174] .Q ,   // OR = 3;  pos = 18;  Pin Index = 8711;  Pin Name = \count_reg[174].Q;  pinInvFromLatch = no;  Latch Index = 2896;  Latch Name = \count_reg[174].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [19] =  counter_inst.\count_reg[173] .Q ,   // OR = 3;  pos = 19;  Pin Index = 8605;  Pin Name = \count_reg[173].Q;  pinInvFromLatch = no;  Latch Index = 2861;  Latch Name = \count_reg[173].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [20] =  counter_inst.\count_reg[172] .Q ,   // OR = 3;  pos = 20;  Pin Index = 8499;  Pin Name = \count_reg[172].Q;  pinInvFromLatch = no;  Latch Index = 2826;  Latch Name = \count_reg[172].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [21] =  counter_inst.\count_reg[171] .Q ,   // OR = 3;  pos = 21;  Pin Index = 8393;  Pin Name = \count_reg[171].Q;  pinInvFromLatch = no;  Latch Index = 2791;  Latch Name = \count_reg[171].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [22] =  counter_inst.\count_reg[170] .Q ,   // OR = 3;  pos = 22;  Pin Index = 8287;  Pin Name = \count_reg[170].Q;  pinInvFromLatch = no;  Latch Index = 2756;  Latch Name = \count_reg[170].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [23] =  counter_inst.\count_reg[169] .Q ,   // OR = 3;  pos = 23;  Pin Index = 8075;  Pin Name = \count_reg[169].Q;  pinInvFromLatch = no;  Latch Index = 2686;  Latch Name = \count_reg[169].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [24] =  counter_inst.\count_reg[168] .Q ,   // OR = 3;  pos = 24;  Pin Index = 7969;  Pin Name = \count_reg[168].Q;  pinInvFromLatch = no;  Latch Index = 2651;  Latch Name = \count_reg[168].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [25] =  counter_inst.\count_reg[167] .Q ,   // OR = 3;  pos = 25;  Pin Index = 7863;  Pin Name = \count_reg[167].Q;  pinInvFromLatch = no;  Latch Index = 2616;  Latch Name = \count_reg[167].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [26] =  counter_inst.\count_reg[166] .Q ,   // OR = 3;  pos = 26;  Pin Index = 7757;  Pin Name = \count_reg[166].Q;  pinInvFromLatch = no;  Latch Index = 2581;  Latch Name = \count_reg[166].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [27] =  counter_inst.\count_reg[165] .Q ,   // OR = 3;  pos = 27;  Pin Index = 7651;  Pin Name = \count_reg[165].Q;  pinInvFromLatch = no;  Latch Index = 2546;  Latch Name = \count_reg[165].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [28] =  counter_inst.\count_reg[164] .Q ,   // OR = 3;  pos = 28;  Pin Index = 7545;  Pin Name = \count_reg[164].Q;  pinInvFromLatch = no;  Latch Index = 2511;  Latch Name = \count_reg[164].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [29] =  counter_inst.\count_reg[163] .Q ,   // OR = 3;  pos = 29;  Pin Index = 7439;  Pin Name = \count_reg[163].Q;  pinInvFromLatch = no;  Latch Index = 2476;  Latch Name = \count_reg[163].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [30] =  counter_inst.\count_reg[162] .Q ,   // OR = 3;  pos = 30;  Pin Index = 7333;  Pin Name = \count_reg[162].Q;  pinInvFromLatch = no;  Latch Index = 2441;  Latch Name = \count_reg[162].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [31] =  counter_inst.\count_reg[161] .Q ,   // OR = 3;  pos = 31;  Pin Index = 7227;  Pin Name = \count_reg[161].Q;  pinInvFromLatch = no;  Latch Index = 2406;  Latch Name = \count_reg[161].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [32] =  counter_inst.\count_reg[160] .Q ,   // OR = 3;  pos = 32;  Pin Index = 7121;  Pin Name = \count_reg[160].Q;  pinInvFromLatch = no;  Latch Index = 2371;  Latch Name = \count_reg[160].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [33] =  counter_inst.\count_reg[159] .Q ,   // OR = 3;  pos = 33;  Pin Index = 6909;  Pin Name = \count_reg[159].Q;  pinInvFromLatch = no;  Latch Index = 2301;  Latch Name = \count_reg[159].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [34] =  counter_inst.\count_reg[158] .Q ,   // OR = 3;  pos = 34;  Pin Index = 6803;  Pin Name = \count_reg[158].Q;  pinInvFromLatch = no;  Latch Index = 2266;  Latch Name = \count_reg[158].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [35] =  counter_inst.\count_reg[157] .Q ,   // OR = 3;  pos = 35;  Pin Index = 6697;  Pin Name = \count_reg[157].Q;  pinInvFromLatch = no;  Latch Index = 2231;  Latch Name = \count_reg[157].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [36] =  counter_inst.\count_reg[156] .Q ,   // OR = 3;  pos = 36;  Pin Index = 6591;  Pin Name = \count_reg[156].Q;  pinInvFromLatch = no;  Latch Index = 2196;  Latch Name = \count_reg[156].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [37] =  counter_inst.\count_reg[155] .Q ,   // OR = 3;  pos = 37;  Pin Index = 6485;  Pin Name = \count_reg[155].Q;  pinInvFromLatch = no;  Latch Index = 2161;  Latch Name = \count_reg[155].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [38] =  counter_inst.\count_reg[154] .Q ,   // OR = 3;  pos = 38;  Pin Index = 6379;  Pin Name = \count_reg[154].Q;  pinInvFromLatch = no;  Latch Index = 2126;  Latch Name = \count_reg[154].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [39] =  counter_inst.\count_reg[153] .Q ,   // OR = 3;  pos = 39;  Pin Index = 6273;  Pin Name = \count_reg[153].Q;  pinInvFromLatch = no;  Latch Index = 2091;  Latch Name = \count_reg[153].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [40] =  counter_inst.\count_reg[152] .Q ,   // OR = 3;  pos = 40;  Pin Index = 6167;  Pin Name = \count_reg[152].Q;  pinInvFromLatch = no;  Latch Index = 2056;  Latch Name = \count_reg[152].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [41] =  counter_inst.\count_reg[151] .Q ,   // OR = 3;  pos = 41;  Pin Index = 6061;  Pin Name = \count_reg[151].Q;  pinInvFromLatch = no;  Latch Index = 2021;  Latch Name = \count_reg[151].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [42] =  counter_inst.\count_reg[150] .Q ,   // OR = 3;  pos = 42;  Pin Index = 5955;  Pin Name = \count_reg[150].Q;  pinInvFromLatch = no;  Latch Index = 1986;  Latch Name = \count_reg[150].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [43] =  counter_inst.\count_reg[149] .Q ,   // OR = 3;  pos = 43;  Pin Index = 5743;  Pin Name = \count_reg[149].Q;  pinInvFromLatch = no;  Latch Index = 1916;  Latch Name = \count_reg[149].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [44] =  counter_inst.\count_reg[148] .Q ,   // OR = 3;  pos = 44;  Pin Index = 5637;  Pin Name = \count_reg[148].Q;  pinInvFromLatch = no;  Latch Index = 1881;  Latch Name = \count_reg[148].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [45] =  counter_inst.\count_reg[147] .Q ,   // OR = 3;  pos = 45;  Pin Index = 5531;  Pin Name = \count_reg[147].Q;  pinInvFromLatch = no;  Latch Index = 1846;  Latch Name = \count_reg[147].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [46] =  counter_inst.\count_reg[146] .Q ,   // OR = 3;  pos = 46;  Pin Index = 5425;  Pin Name = \count_reg[146].Q;  pinInvFromLatch = no;  Latch Index = 1811;  Latch Name = \count_reg[146].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [47] =  counter_inst.\count_reg[145] .Q ,   // OR = 3;  pos = 47;  Pin Index = 5319;  Pin Name = \count_reg[145].Q;  pinInvFromLatch = no;  Latch Index = 1776;  Latch Name = \count_reg[145].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [48] =  counter_inst.\count_reg[144] .Q ,   // OR = 3;  pos = 48;  Pin Index = 5213;  Pin Name = \count_reg[144].Q;  pinInvFromLatch = no;  Latch Index = 1741;  Latch Name = \count_reg[144].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [49] =  counter_inst.\count_reg[143] .Q ,   // OR = 3;  pos = 49;  Pin Index = 5107;  Pin Name = \count_reg[143].Q;  pinInvFromLatch = no;  Latch Index = 1706;  Latch Name = \count_reg[143].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [50] =  counter_inst.\count_reg[142] .Q ,   // OR = 3;  pos = 50;  Pin Index = 5001;  Pin Name = \count_reg[142].Q;  pinInvFromLatch = no;  Latch Index = 1671;  Latch Name = \count_reg[142].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [51] =  counter_inst.\count_reg[141] .Q ,   // OR = 3;  pos = 51;  Pin Index = 4895;  Pin Name = \count_reg[141].Q;  pinInvFromLatch = no;  Latch Index = 1636;  Latch Name = \count_reg[141].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [52] =  counter_inst.\count_reg[140] .Q ,   // OR = 3;  pos = 52;  Pin Index = 4789;  Pin Name = \count_reg[140].Q;  pinInvFromLatch = no;  Latch Index = 1601;  Latch Name = \count_reg[140].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [53] =  counter_inst.\count_reg[139] .Q ,   // OR = 3;  pos = 53;  Pin Index = 4577;  Pin Name = \count_reg[139].Q;  pinInvFromLatch = no;  Latch Index = 1531;  Latch Name = \count_reg[139].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [54] =  counter_inst.\count_reg[138] .Q ,   // OR = 3;  pos = 54;  Pin Index = 4471;  Pin Name = \count_reg[138].Q;  pinInvFromLatch = no;  Latch Index = 1496;  Latch Name = \count_reg[138].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [55] =  counter_inst.\count_reg[137] .Q ,   // OR = 3;  pos = 55;  Pin Index = 4365;  Pin Name = \count_reg[137].Q;  pinInvFromLatch = no;  Latch Index = 1461;  Latch Name = \count_reg[137].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [56] =  counter_inst.\count_reg[136] .Q ,   // OR = 3;  pos = 56;  Pin Index = 4259;  Pin Name = \count_reg[136].Q;  pinInvFromLatch = no;  Latch Index = 1426;  Latch Name = \count_reg[136].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [57] =  counter_inst.\count_reg[135] .Q ,   // OR = 3;  pos = 57;  Pin Index = 4153;  Pin Name = \count_reg[135].Q;  pinInvFromLatch = no;  Latch Index = 1391;  Latch Name = \count_reg[135].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [58] =  counter_inst.\count_reg[134] .Q ,   // OR = 3;  pos = 58;  Pin Index = 4047;  Pin Name = \count_reg[134].Q;  pinInvFromLatch = no;  Latch Index = 1356;  Latch Name = \count_reg[134].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [59] =  counter_inst.\count_reg[133] .Q ,   // OR = 3;  pos = 59;  Pin Index = 3941;  Pin Name = \count_reg[133].Q;  pinInvFromLatch = no;  Latch Index = 1321;  Latch Name = \count_reg[133].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [60] =  counter_inst.\count_reg[132] .Q ,   // OR = 3;  pos = 60;  Pin Index = 3835;  Pin Name = \count_reg[132].Q;  pinInvFromLatch = no;  Latch Index = 1286;  Latch Name = \count_reg[132].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [61] =  counter_inst.\count_reg[131] .Q ,   // OR = 3;  pos = 61;  Pin Index = 3729;  Pin Name = \count_reg[131].Q;  pinInvFromLatch = no;  Latch Index = 1251;  Latch Name = \count_reg[131].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [62] =  counter_inst.\count_reg[130] .Q ,   // OR = 3;  pos = 62;  Pin Index = 3623;  Pin Name = \count_reg[130].Q;  pinInvFromLatch = no;  Latch Index = 1216;  Latch Name = \count_reg[130].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [63] =  counter_inst.\count_reg[129] .Q ,   // OR = 3;  pos = 63;  Pin Index = 3411;  Pin Name = \count_reg[129].Q;  pinInvFromLatch = no;  Latch Index = 1146;  Latch Name = \count_reg[129].__iNsT2.dff_primitive;   
    part_M_OR_3_TM_1 [64] =  counter_inst.\count_reg[128] .Q ;   // OR = 3;  pos = 64;  Pin Index = 3305;  Pin Name = \count_reg[128].Q;  pinInvFromLatch = no;  Latch Index = 1111;  Latch Name = \count_reg[128].__iNsT2.dff_primitive;   

  assign // OR = 4 
    part_M_OR_4_TM_1 [1] =  counter_inst.DFT_sdo_4 ,   // OR = 4;  pos = 1;  Pin Index = 12;  Pin Name = DFT_sdo_4;  pinInvFromLatch = no;  Latch Index = 6046;  Latch Name = \count_reg[255].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [2] =  counter_inst.\count_reg[254] .Q ,   // OR = 4;  pos = 2;  Pin Index = 18145;  Pin Name = \count_reg[254].Q;  pinInvFromLatch = no;  Latch Index = 6011;  Latch Name = \count_reg[254].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [3] =  counter_inst.\count_reg[253] .Q ,   // OR = 4;  pos = 3;  Pin Index = 18039;  Pin Name = \count_reg[253].Q;  pinInvFromLatch = no;  Latch Index = 5976;  Latch Name = \count_reg[253].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [4] =  counter_inst.\count_reg[252] .Q ,   // OR = 4;  pos = 4;  Pin Index = 17933;  Pin Name = \count_reg[252].Q;  pinInvFromLatch = no;  Latch Index = 5941;  Latch Name = \count_reg[252].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [5] =  counter_inst.\count_reg[251] .Q ,   // OR = 4;  pos = 5;  Pin Index = 17827;  Pin Name = \count_reg[251].Q;  pinInvFromLatch = no;  Latch Index = 5906;  Latch Name = \count_reg[251].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [6] =  counter_inst.\count_reg[250] .Q ,   // OR = 4;  pos = 6;  Pin Index = 17721;  Pin Name = \count_reg[250].Q;  pinInvFromLatch = no;  Latch Index = 5871;  Latch Name = \count_reg[250].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [7] =  counter_inst.\count_reg[249] .Q ,   // OR = 4;  pos = 7;  Pin Index = 17509;  Pin Name = \count_reg[249].Q;  pinInvFromLatch = no;  Latch Index = 5801;  Latch Name = \count_reg[249].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [8] =  counter_inst.\count_reg[248] .Q ,   // OR = 4;  pos = 8;  Pin Index = 17403;  Pin Name = \count_reg[248].Q;  pinInvFromLatch = no;  Latch Index = 5766;  Latch Name = \count_reg[248].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [9] =  counter_inst.\count_reg[247] .Q ,   // OR = 4;  pos = 9;  Pin Index = 17297;  Pin Name = \count_reg[247].Q;  pinInvFromLatch = no;  Latch Index = 5731;  Latch Name = \count_reg[247].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [10] =  counter_inst.\count_reg[246] .Q ,   // OR = 4;  pos = 10;  Pin Index = 17191;  Pin Name = \count_reg[246].Q;  pinInvFromLatch = no;  Latch Index = 5696;  Latch Name = \count_reg[246].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [11] =  counter_inst.\count_reg[245] .Q ,   // OR = 4;  pos = 11;  Pin Index = 17085;  Pin Name = \count_reg[245].Q;  pinInvFromLatch = no;  Latch Index = 5661;  Latch Name = \count_reg[245].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [12] =  counter_inst.\count_reg[244] .Q ,   // OR = 4;  pos = 12;  Pin Index = 16979;  Pin Name = \count_reg[244].Q;  pinInvFromLatch = no;  Latch Index = 5626;  Latch Name = \count_reg[244].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [13] =  counter_inst.\count_reg[243] .Q ,   // OR = 4;  pos = 13;  Pin Index = 16873;  Pin Name = \count_reg[243].Q;  pinInvFromLatch = no;  Latch Index = 5591;  Latch Name = \count_reg[243].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [14] =  counter_inst.\count_reg[242] .Q ,   // OR = 4;  pos = 14;  Pin Index = 16767;  Pin Name = \count_reg[242].Q;  pinInvFromLatch = no;  Latch Index = 5556;  Latch Name = \count_reg[242].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [15] =  counter_inst.\count_reg[241] .Q ,   // OR = 4;  pos = 15;  Pin Index = 16661;  Pin Name = \count_reg[241].Q;  pinInvFromLatch = no;  Latch Index = 5521;  Latch Name = \count_reg[241].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [16] =  counter_inst.\count_reg[240] .Q ,   // OR = 4;  pos = 16;  Pin Index = 16555;  Pin Name = \count_reg[240].Q;  pinInvFromLatch = no;  Latch Index = 5486;  Latch Name = \count_reg[240].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [17] =  counter_inst.\count_reg[239] .Q ,   // OR = 4;  pos = 17;  Pin Index = 16343;  Pin Name = \count_reg[239].Q;  pinInvFromLatch = no;  Latch Index = 5416;  Latch Name = \count_reg[239].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [18] =  counter_inst.\count_reg[238] .Q ,   // OR = 4;  pos = 18;  Pin Index = 16237;  Pin Name = \count_reg[238].Q;  pinInvFromLatch = no;  Latch Index = 5381;  Latch Name = \count_reg[238].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [19] =  counter_inst.\count_reg[237] .Q ,   // OR = 4;  pos = 19;  Pin Index = 16131;  Pin Name = \count_reg[237].Q;  pinInvFromLatch = no;  Latch Index = 5346;  Latch Name = \count_reg[237].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [20] =  counter_inst.\count_reg[236] .Q ,   // OR = 4;  pos = 20;  Pin Index = 16025;  Pin Name = \count_reg[236].Q;  pinInvFromLatch = no;  Latch Index = 5311;  Latch Name = \count_reg[236].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [21] =  counter_inst.\count_reg[235] .Q ,   // OR = 4;  pos = 21;  Pin Index = 15919;  Pin Name = \count_reg[235].Q;  pinInvFromLatch = no;  Latch Index = 5276;  Latch Name = \count_reg[235].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [22] =  counter_inst.\count_reg[234] .Q ,   // OR = 4;  pos = 22;  Pin Index = 15813;  Pin Name = \count_reg[234].Q;  pinInvFromLatch = no;  Latch Index = 5241;  Latch Name = \count_reg[234].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [23] =  counter_inst.\count_reg[233] .Q ,   // OR = 4;  pos = 23;  Pin Index = 15707;  Pin Name = \count_reg[233].Q;  pinInvFromLatch = no;  Latch Index = 5206;  Latch Name = \count_reg[233].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [24] =  counter_inst.\count_reg[232] .Q ,   // OR = 4;  pos = 24;  Pin Index = 15601;  Pin Name = \count_reg[232].Q;  pinInvFromLatch = no;  Latch Index = 5171;  Latch Name = \count_reg[232].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [25] =  counter_inst.\count_reg[231] .Q ,   // OR = 4;  pos = 25;  Pin Index = 15495;  Pin Name = \count_reg[231].Q;  pinInvFromLatch = no;  Latch Index = 5136;  Latch Name = \count_reg[231].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [26] =  counter_inst.\count_reg[230] .Q ,   // OR = 4;  pos = 26;  Pin Index = 15389;  Pin Name = \count_reg[230].Q;  pinInvFromLatch = no;  Latch Index = 5101;  Latch Name = \count_reg[230].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [27] =  counter_inst.\count_reg[229] .Q ,   // OR = 4;  pos = 27;  Pin Index = 15177;  Pin Name = \count_reg[229].Q;  pinInvFromLatch = no;  Latch Index = 5031;  Latch Name = \count_reg[229].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [28] =  counter_inst.\count_reg[228] .Q ,   // OR = 4;  pos = 28;  Pin Index = 15071;  Pin Name = \count_reg[228].Q;  pinInvFromLatch = no;  Latch Index = 4996;  Latch Name = \count_reg[228].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [29] =  counter_inst.\count_reg[227] .Q ,   // OR = 4;  pos = 29;  Pin Index = 14965;  Pin Name = \count_reg[227].Q;  pinInvFromLatch = no;  Latch Index = 4961;  Latch Name = \count_reg[227].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [30] =  counter_inst.\count_reg[226] .Q ,   // OR = 4;  pos = 30;  Pin Index = 14859;  Pin Name = \count_reg[226].Q;  pinInvFromLatch = no;  Latch Index = 4926;  Latch Name = \count_reg[226].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [31] =  counter_inst.\count_reg[225] .Q ,   // OR = 4;  pos = 31;  Pin Index = 14753;  Pin Name = \count_reg[225].Q;  pinInvFromLatch = no;  Latch Index = 4891;  Latch Name = \count_reg[225].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [32] =  counter_inst.\count_reg[224] .Q ,   // OR = 4;  pos = 32;  Pin Index = 14647;  Pin Name = \count_reg[224].Q;  pinInvFromLatch = no;  Latch Index = 4856;  Latch Name = \count_reg[224].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [33] =  counter_inst.\count_reg[223] .Q ,   // OR = 4;  pos = 33;  Pin Index = 14541;  Pin Name = \count_reg[223].Q;  pinInvFromLatch = no;  Latch Index = 4821;  Latch Name = \count_reg[223].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [34] =  counter_inst.\count_reg[222] .Q ,   // OR = 4;  pos = 34;  Pin Index = 14435;  Pin Name = \count_reg[222].Q;  pinInvFromLatch = no;  Latch Index = 4786;  Latch Name = \count_reg[222].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [35] =  counter_inst.\count_reg[221] .Q ,   // OR = 4;  pos = 35;  Pin Index = 14329;  Pin Name = \count_reg[221].Q;  pinInvFromLatch = no;  Latch Index = 4751;  Latch Name = \count_reg[221].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [36] =  counter_inst.\count_reg[220] .Q ,   // OR = 4;  pos = 36;  Pin Index = 14223;  Pin Name = \count_reg[220].Q;  pinInvFromLatch = no;  Latch Index = 4716;  Latch Name = \count_reg[220].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [37] =  counter_inst.\count_reg[219] .Q ,   // OR = 4;  pos = 37;  Pin Index = 14011;  Pin Name = \count_reg[219].Q;  pinInvFromLatch = no;  Latch Index = 4646;  Latch Name = \count_reg[219].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [38] =  counter_inst.\count_reg[218] .Q ,   // OR = 4;  pos = 38;  Pin Index = 13905;  Pin Name = \count_reg[218].Q;  pinInvFromLatch = no;  Latch Index = 4611;  Latch Name = \count_reg[218].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [39] =  counter_inst.\count_reg[217] .Q ,   // OR = 4;  pos = 39;  Pin Index = 13799;  Pin Name = \count_reg[217].Q;  pinInvFromLatch = no;  Latch Index = 4576;  Latch Name = \count_reg[217].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [40] =  counter_inst.\count_reg[216] .Q ,   // OR = 4;  pos = 40;  Pin Index = 13693;  Pin Name = \count_reg[216].Q;  pinInvFromLatch = no;  Latch Index = 4541;  Latch Name = \count_reg[216].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [41] =  counter_inst.\count_reg[215] .Q ,   // OR = 4;  pos = 41;  Pin Index = 13587;  Pin Name = \count_reg[215].Q;  pinInvFromLatch = no;  Latch Index = 4506;  Latch Name = \count_reg[215].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [42] =  counter_inst.\count_reg[214] .Q ,   // OR = 4;  pos = 42;  Pin Index = 13481;  Pin Name = \count_reg[214].Q;  pinInvFromLatch = no;  Latch Index = 4471;  Latch Name = \count_reg[214].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [43] =  counter_inst.\count_reg[213] .Q ,   // OR = 4;  pos = 43;  Pin Index = 13375;  Pin Name = \count_reg[213].Q;  pinInvFromLatch = no;  Latch Index = 4436;  Latch Name = \count_reg[213].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [44] =  counter_inst.\count_reg[212] .Q ,   // OR = 4;  pos = 44;  Pin Index = 13269;  Pin Name = \count_reg[212].Q;  pinInvFromLatch = no;  Latch Index = 4401;  Latch Name = \count_reg[212].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [45] =  counter_inst.\count_reg[211] .Q ,   // OR = 4;  pos = 45;  Pin Index = 13163;  Pin Name = \count_reg[211].Q;  pinInvFromLatch = no;  Latch Index = 4366;  Latch Name = \count_reg[211].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [46] =  counter_inst.\count_reg[210] .Q ,   // OR = 4;  pos = 46;  Pin Index = 13057;  Pin Name = \count_reg[210].Q;  pinInvFromLatch = no;  Latch Index = 4331;  Latch Name = \count_reg[210].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [47] =  counter_inst.\count_reg[209] .Q ,   // OR = 4;  pos = 47;  Pin Index = 12845;  Pin Name = \count_reg[209].Q;  pinInvFromLatch = no;  Latch Index = 4261;  Latch Name = \count_reg[209].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [48] =  counter_inst.\count_reg[208] .Q ,   // OR = 4;  pos = 48;  Pin Index = 12739;  Pin Name = \count_reg[208].Q;  pinInvFromLatch = no;  Latch Index = 4226;  Latch Name = \count_reg[208].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [49] =  counter_inst.\count_reg[207] .Q ,   // OR = 4;  pos = 49;  Pin Index = 12633;  Pin Name = \count_reg[207].Q;  pinInvFromLatch = no;  Latch Index = 4191;  Latch Name = \count_reg[207].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [50] =  counter_inst.\count_reg[206] .Q ,   // OR = 4;  pos = 50;  Pin Index = 12527;  Pin Name = \count_reg[206].Q;  pinInvFromLatch = no;  Latch Index = 4156;  Latch Name = \count_reg[206].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [51] =  counter_inst.\count_reg[205] .Q ,   // OR = 4;  pos = 51;  Pin Index = 12421;  Pin Name = \count_reg[205].Q;  pinInvFromLatch = no;  Latch Index = 4121;  Latch Name = \count_reg[205].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [52] =  counter_inst.\count_reg[204] .Q ,   // OR = 4;  pos = 52;  Pin Index = 12315;  Pin Name = \count_reg[204].Q;  pinInvFromLatch = no;  Latch Index = 4086;  Latch Name = \count_reg[204].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [53] =  counter_inst.\count_reg[203] .Q ,   // OR = 4;  pos = 53;  Pin Index = 12209;  Pin Name = \count_reg[203].Q;  pinInvFromLatch = no;  Latch Index = 4051;  Latch Name = \count_reg[203].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [54] =  counter_inst.\count_reg[202] .Q ,   // OR = 4;  pos = 54;  Pin Index = 12103;  Pin Name = \count_reg[202].Q;  pinInvFromLatch = no;  Latch Index = 4016;  Latch Name = \count_reg[202].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [55] =  counter_inst.\count_reg[201] .Q ,   // OR = 4;  pos = 55;  Pin Index = 11997;  Pin Name = \count_reg[201].Q;  pinInvFromLatch = no;  Latch Index = 3981;  Latch Name = \count_reg[201].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [56] =  counter_inst.\count_reg[200] .Q ,   // OR = 4;  pos = 56;  Pin Index = 11891;  Pin Name = \count_reg[200].Q;  pinInvFromLatch = no;  Latch Index = 3946;  Latch Name = \count_reg[200].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [57] =  counter_inst.\count_reg[199] .Q ,   // OR = 4;  pos = 57;  Pin Index = 11573;  Pin Name = \count_reg[199].Q;  pinInvFromLatch = no;  Latch Index = 3841;  Latch Name = \count_reg[199].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [58] =  counter_inst.\count_reg[198] .Q ,   // OR = 4;  pos = 58;  Pin Index = 11467;  Pin Name = \count_reg[198].Q;  pinInvFromLatch = no;  Latch Index = 3806;  Latch Name = \count_reg[198].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [59] =  counter_inst.\count_reg[197] .Q ,   // OR = 4;  pos = 59;  Pin Index = 11361;  Pin Name = \count_reg[197].Q;  pinInvFromLatch = no;  Latch Index = 3771;  Latch Name = \count_reg[197].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [60] =  counter_inst.\count_reg[196] .Q ,   // OR = 4;  pos = 60;  Pin Index = 11255;  Pin Name = \count_reg[196].Q;  pinInvFromLatch = no;  Latch Index = 3736;  Latch Name = \count_reg[196].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [61] =  counter_inst.\count_reg[195] .Q ,   // OR = 4;  pos = 61;  Pin Index = 11149;  Pin Name = \count_reg[195].Q;  pinInvFromLatch = no;  Latch Index = 3701;  Latch Name = \count_reg[195].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [62] =  counter_inst.\count_reg[194] .Q ,   // OR = 4;  pos = 62;  Pin Index = 11043;  Pin Name = \count_reg[194].Q;  pinInvFromLatch = no;  Latch Index = 3666;  Latch Name = \count_reg[194].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [63] =  counter_inst.\count_reg[193] .Q ,   // OR = 4;  pos = 63;  Pin Index = 10937;  Pin Name = \count_reg[193].Q;  pinInvFromLatch = no;  Latch Index = 3631;  Latch Name = \count_reg[193].__iNsT2.dff_primitive;   
    part_M_OR_4_TM_1 [64] =  counter_inst.\count_reg[192] .Q ;   // OR = 4;  pos = 64;  Pin Index = 10831;  Pin Name = \count_reg[192].Q;  pinInvFromLatch = no;  Latch Index = 3596;  Latch Name = \count_reg[192].__iNsT2.dff_primitive;   

//***************************************************************************//
//                     OPEN THE FILE AND RUN SIMULATION                      //
//***************************************************************************//

  initial 
    begin 

      $timeformat ( -12, 2, " ps", 10 ); 

      `ifdef sdf_annotate 
        `ifdef SDF_Minimum 
          $sdf_annotate ("default.sdf",counter_inst,,"sdf_Min.log","MINIMUM");
        `endif 
        `ifdef SDF_Maximum 
          $sdf_annotate ("default.sdf",counter_inst,,"sdf_Max.log","MAXIMUM");
        `endif 
        `ifdef SDF_Typical
          $sdf_annotate ("default.sdf",counter_inst,,"sdf_Typ.log","TYPICAL");
        `endif 
      `endif 

      `ifndef NOT_NC 
        if ( $test$plusargs ( "simvision" ) )  begin 
          $shm_open("simvision.shm"); 
          $shm_probe("AC"); 
        end  
      `endif 

      if ( $test$plusargs ( "vcd" ) )  begin 
        $dumpfile("out.vcd"); 
        $dumpvars(0,MODUS_RUN_COUNTER_FULLSCAN_counter_atpg ); 
      end  

      DATAFILE = 0; 
      sim_setup; 

      `ifdef MISCOMPAREDEBUG 
        diag_debug = 1'b0; 
        if ( $value$plusargs ( "MISCOMPAREDEBUGFILE=%s", DIAG_DEBUG_FILE )) begin 
          DIAG_DATAID = $fopen ( DIAG_DEBUG_FILE, "r" ); 
          if ( DIAG_DATAID ) begin 
            diag_debug = 1'b1; 
            $fclose ( DIAG_DATAID ); 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: Diagnostic 'MISCOMPAREDEBUGFILE' %0s. \n", DIAG_DEBUG_FILE ); 
        end  
      `endif  

      num_files = 0; 
      for ( TID = 1; TID <= 99; TID = TID + 1 ) begin 
        $sformat ( TESTFILE, "TESTFILE%0d=%s", TID, "%s" ); 
        if ( $value$plusargs ( TESTFILE, DATAFILE )) begin 
          DATAID = $fopen ( DATAFILE, "r" ); 
          if ( DATAID )  begin 
            sim_vector_file; 
            num_files = num_files + 1; 
          end  
          else $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", DATAFILE ); 
        end  
      end  

      if ( FAILSETID )  $fclose ( FAILSETID ); 

      if ( DATAFILE )  begin
        $display ( "\nINFO (TVE-209): Cumulative Results: " ); 
        $display ( "                      Number of Files Simulated:  %0d ", num_files ); 
        $display ( "                      Total Number of Cycles:     %0d ", total_cycles ); 
        $display ( "                      Total Number of Tests:      %0d ", total_num_tests ); 
        $display ( "                        - Total Passed Tests:     %0d ", total_num_tests - total_num_failed_tests ); 
        $display ( "                        - Total Failed Tests:     %0d ", total_num_failed_tests ); 
        $display ( "                      Total Number of Compares:   %0.0f ", total_good_compares + total_miscompares ); 
        $display ( "                        - Total Good Compares:    %0.0f ", total_good_compares ); 
        $display ( "                        - Total Miscompares:      %0.0f \n", total_miscompares ); 
      end  
      else $display ( "\nWARNING (TVE-661): No input data files found. The data file must be specified using +TESTFILE1=<string>, +TESTFILE2=<string>, ... The +TESTFILEn=<string> keyword is an NC-Sim command. \n" ); 

      $finish; 

    end  

//***************************************************************************//
//                     DEFINE SIMULATION SETUP PROCEDURE                     //
//***************************************************************************//

  task sim_setup; 
    begin 

      total_good_compares = 0; 
      total_miscompares = 0; 
      miscompare_limit = 0; 
      total_num_tests = 0; 
      total_num_failed_tests = 0; 
      total_cycles = 0; 
      SOD = ""; 
      EOD = ""; 
      START = 0; 
      NUM_SHIFTS = 0; 
      MAX = 1; 

      sim_heart = 1'b0; 
      sim_range = 1'b1; 
      sim_trace = 1'b0; 
      sim_debug = 1'b0; 
      sim_more_debug = 1'b0; 

      global_term = 1'bZ; 

      failset = 1'b0; 
      FAILSETID = 0; 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      SEQNUM = 0; 
      name_POs [1] = "DFT_sdo_1";      // pinName = DFT_sdo_1;  tf =  SO  ; 
      name_POs [2] = "DFT_sdo_2";      // pinName = DFT_sdo_2;  tf =  SO1 ; 
      name_POs [3] = "DFT_sdo_3";      // pinName = DFT_sdo_3;  tf =  SO2 ; 
      name_POs [4] = "DFT_sdo_4";      // pinName = DFT_sdo_4;  tf =  SO3 ; 
      name_POs [5] = "out";      // pinName = out; 



      if ( $test$plusargs ( "MODUS_DEBUG" ) )  sim_trace = 1'b1; 

      if ( $test$plusargs ( "HEARTBEAT" ) )  sim_heart = 1'b1; 

      if ( $value$plusargs ( "START_RANGE=%s", SOD ) )  sim_range = 1'b0; 

      if ( $value$plusargs ( "END_RANGE=%s", EOD ) ); 

      if ( $value$plusargs ( "miscompare_limit=%0f", miscompare_limit ) ); 

      if ( $test$plusargs ( "FAILSET" ) )  failset = 1'b1; 

      stim_PIs = {9{1'bX}};   
      stim_CIs = 9'bXXXXXX0XX; 
      meas_POs = {5{1'bX}};   
      stim_CR_1 = {64{1'b0}};   stim_CR_2 = {64{1'b0}};   stim_CR_3 = {64{1'b0}};   stim_CR_4 = {64{1'b0}};   
      part_S_CR_1_TM_1 = {64{1'bZ}};   part_S_CR_2_TM_1 = {64{1'bZ}};   part_S_CR_3_TM_1 = {64{1'bZ}};   part_S_CR_4_TM_1 = {64{1'bZ}};   
      meas_OR_1 = {64{1'bX}};   meas_OR_2 = {64{1'bX}};   meas_OR_3 = {64{1'bX}};   meas_OR_4 = {64{1'bX}};   

    end  
  endtask  

//***************************************************************************//
//                          FAILSET SETUP PROCEDURE                          //
//***************************************************************************//

  task failset_setup; 
    begin 

      $sformat ( FAILSET, "%0s_FAILSET", DATAFILE ); 
      FAILSETID = $fopen ( FAILSET, "w" ); 
      if ( ! FAILSETID ) 
        $display ( "\nERROR (TVE-951): Failed to open the file: %0s. \n", FAILSET ); 

    end  
  endtask 

//***************************************************************************//
//                           SET UP FOR SIMULATION                           //
//***************************************************************************//

  task sim_vector_file; 
    begin 

      CYCLE = 0; 
      SCANCYCLE = 0; 
      SERIALCYCLE = 0; 
      good_compares = 0; 
      miscompares = 0; 
      measure_current = 0; 
      test_num = 0; 
      test_num_prev = 0; 
      failed_test_num = 0; 
      num_tests = 0; 
      num_failed_tests = 0; 
      scan_num = 0; 
      overlap = 0; 
      repeat_depth = 0; 
      repeat_heart = 1000; 


      $display ( "\nINFO (TVE-200): Simulating vector file: %0s ", DATAFILE ); 

      $display ( "\nINFO (TVE-189): Design:  counter   Test Mode:  FULLSCAN   InExperiment:  counter_atpg " ); 
      start_of_current_line = $ftell ( DATAID ); 
      line_number = 1; 
      rc_read = $fscanf ( DATAID, "%d", CMD ); 
      while ( rc_read > 0 ) begin 

        cmd_code; 

        if ( rc_read > 0 )  begin 
          if ( sim_range )  begin 
            if (( miscompare_limit > 0 ) & ( miscompares > miscompare_limit ))  begin 
              sim_range = 1'b0; 
              if ( overlap )  num_tests = num_tests - 1; 
              $display ( "\nINFO (TVE-207): The miscompare limit (+miscompare_limit) of %0.0f has been reached. ", miscompare_limit ); 
            end  
            if ( EOD == pattern )  begin 
              sim_range = 1'b0; 
            end  
          end  
          start_of_current_line = $ftell ( DATAID ); 
          rc_read = $fscanf ( DATAID, "%d", CMD ); 
          if ( rc_read <= 0 )  begin 
            rc_read = $fgets ( COMMENT, DATAID ); 
            if ( rc_read > 0 )  bad_cmd_code; 
            else  line_number = 0; 
          end  
        end  
      end  

      if ( line_number == 0 )  begin
        $display ( "\nINFO (TVE-201): Simulation complete on vector file: %0s ", DATAFILE ); 
        $display ( "\nINFO (TVE-210): Results for vector file: %0s ", DATAFILE ); 
        $display ( "                      Number of Cycles:           %0d ", CYCLE ); 
        $display ( "                      Number of Tests:            %0d ", num_tests ); 
        $display ( "                        - Passed Tests:           %0d ", num_tests - num_failed_tests ); 
        $display ( "                        - Failed Tests:           %0d ", num_failed_tests ); 
        $display ( "                      Number of Compares:         %0.0f ", good_compares + miscompares ); 
        $display ( "                        - Good Compares:          %0.0f ", good_compares ); 
        $display ( "                        - Miscompares:            %0.0f ", miscompares ); 
        $display ( "                      Time:                       %t \n", $time ); 
      end  

      $fclose ( DATAID ); 

      total_good_compares = total_good_compares + good_compares; 

      total_miscompares = total_miscompares + miscompares; 

      total_num_tests = total_num_tests + num_tests; 

      total_num_failed_tests = total_num_failed_tests + num_failed_tests; 

      total_cycles = total_cycles + CYCLE; 

    end  
  endtask  

//***************************************************************************//
//                           DEFINE TEST PROCEDURE                           //
//***************************************************************************//

  task test_cycle; 
    begin 

      CYCLE = CYCLE + 1; 
      SERIALCYCLE = SERIALCYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_PIs [1] = stim_PIs [1];      // pinName = DFT_sdi_1;  tf =  SI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [2] = stim_PIs [2];      // pinName = DFT_sdi_2;  tf =  SI1 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [3] = stim_PIs [3];      // pinName = DFT_sdi_3;  tf =  SI2 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [4] = stim_PIs [4];      // pinName = DFT_sdi_4;  tf =  SI3 ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [5] = stim_PIs [5];      // pinName = TM;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [6] = stim_PIs [6];      // pinName = clk; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [8] = stim_PIs [8];      // pinName = reset;  tf = +TI  ; testOffset = 0.000000;  scanOffset = 0.000000;  
      part_PIs [9] = stim_PIs [9];      // pinName = scan_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  
     #8.000000;        // 8.000000 ns;  From the start of the cycle.
      part_PIs [7] = stim_PIs [7];      // pinName = clk_test;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [7] = stim_CIs [7];      // pinName = clk_test;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 72.000000 ns;  From the start of the cycle.

      for ( POnum = 1; POnum <= 5; POnum = POnum + 1 ) begin 
        if (( part_POs [ POnum ] !== meas_POs [ POnum ] ) & ( meas_POs [ POnum ] !== 1'bX )) begin 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-650): PO miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   On PO: %0s   ", meas_POs [ POnum ], part_POs [ POnum ], name_POs [ POnum ] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "counter", name_POs [ POnum ], PATTERN, -1, part_POs [ POnum ] ); 
          end  
        end  
        else if ( meas_POs [ POnum ] !== 1'bX )  good_compares = good_compares + 1; 
      end  
     #8.000000;        // 80.000000 ns;  From the start of the cycle.
      meas_POs = {5{1'bX}}; 

    end  
  endtask  

//***************************************************************************//
//                       DEFINE SCAN PRECOND PROCEDURE                       //
//***************************************************************************//

  task Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
    begin 

      PROCESSNAME = "SCAN PRECONDITIONING (Scan_Preconditioning_Sequence)";
      stim_PIs [9] = 1'b1;      // pinName = scan_enable;  tf = +SE  ; testOffset = 0.000000;  scanOffset = 0.000000;  

      test_cycle; 
      PROCESSNAME = "";
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                      DEFINE SCAN SEQUENCE PROCEDURE                       //
//***************************************************************************//

  task Scan_Sequence_TM_1_SEQ_2_SOP_1; 
    begin 

      PROCESSNAME = "SCAN SEQUENCE (Scan_Sequence)";
      if ( overlap )  test_num = test_num - 1; 
      SERIALCYCLE = SERIALCYCLE + MAX; 
      CYCLE = CYCLE + 1; 
     #0.000000;        // 0.000000 ns;  From the start of the cycle.

      for ( SCANCYCLE = 1; SCANCYCLE <= MAX; SCANCYCLE = SCANCYCLE + 1 ) begin 

        if (( part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_1 [ 0 + SCANCYCLE ] ) & ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = DFT_sdo_1;  tf =  SO  ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 1;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_1 [ 0 + SCANCYCLE ], part_M_OR_1_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [1] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "counter", name_POs [1], PATTERN, SCANCYCLE, part_M_OR_1_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_1 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_2_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_2 [ 0 + SCANCYCLE ] ) & ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = DFT_sdo_2;  tf =  SO1 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 2;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_2 [ 0 + SCANCYCLE ], part_M_OR_2_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [2] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "counter", name_POs [2], PATTERN, SCANCYCLE, part_M_OR_2_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_2 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_3_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_3 [ 0 + SCANCYCLE ] ) & ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = DFT_sdo_3;  tf =  SO2 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 3;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_3 [ 0 + SCANCYCLE ], part_M_OR_3_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [3] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "counter", name_POs [3], PATTERN, SCANCYCLE, part_M_OR_3_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_3 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 

        if (( part_M_OR_4_TM_1 [ 0 + SCANCYCLE ] !== meas_OR_4 [ 0 + SCANCYCLE ] ) & ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )) begin      // pinName = DFT_sdo_4;  tf =  SO3 ; 
          if ( test_num != failed_test_num )  begin 
            num_failed_tests = num_failed_tests + 1; 
            failed_test_num = test_num; 
          end  
          miscompares = miscompares + 1; 
          $display ( "\nWARNING (TVE-660): Parallel scan miscompare at Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t ", test_num, PATTERN, CYCLE, $time ); 
          $display ( "           Expected: %0b   Simulated: %0b   Observe Register (OR) = 4;   Measured on Scan Cycle: %0d   Feeds Scan Out: %0s   ", meas_OR_4 [ 0 + SCANCYCLE ], part_M_OR_4_TM_1 [ 0 + SCANCYCLE ], SCANCYCLE + 0, name_POs [4] ); 

          if (( failset ) & ( FAILSETID == 0 ))  failset_setup; 
          if ( FAILSETID ) begin 
            $fdisplay ( FAILSETID, " Chip %0s pad %0s pattern %0s position %0d value %0b ", "counter", name_POs [4], PATTERN, SCANCYCLE, part_M_OR_4_TM_1 [ 0 + SCANCYCLE ] ); 
          end  
        end  
        else  begin 
          if ( meas_OR_4 [ 0 + SCANCYCLE ] !== 1'bX )  begin 
            good_compares = good_compares + 1;
          end 
        end 
      end  
     #0.000000;        // 0.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 [1:64] = stim_CR_1 [1:64]; 
      part_S_CR_2_TM_1 [1:64] = stim_CR_2 [1:64]; 
      part_S_CR_3_TM_1 [1:64] = stim_CR_3 [1:64]; 
      part_S_CR_4_TM_1 [1:64] = stim_CR_4 [1:64]; 
     #16.000000;        // 16.000000 ns;  From the start of the cycle.
      part_PIs [7] = 1'b1;      // pinName = clk_test;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #8.000000;        // 24.000000 ns;  From the start of the cycle.
      part_PIs [7] = 1'b0;      // pinName = clk_test;  tf = -ES  ; testOffset = 8.000000;  scanOffset = 16.000000;  
     #56.000000;        // 80.000000 ns;  From the start of the cycle.
      part_S_CR_1_TM_1 = {64{1'bZ}};   part_S_CR_2_TM_1 = {64{1'bZ}};   part_S_CR_3_TM_1 = {64{1'bZ}};   part_S_CR_4_TM_1 = {64{1'bZ}};   
     #0; 
      meas_OR_1 = {64{1'bX}};   meas_OR_2 = {64{1'bX}};   meas_OR_3 = {64{1'bX}};   meas_OR_4 = {64{1'bX}};   
      stim_CR_1 = {64{1'b0}};   stim_CR_2 = {64{1'b0}};   stim_CR_3 = {64{1'b0}};   stim_CR_4 = {64{1'b0}};   
      stim_PIs = part_PIs; 
      SCANCYCLE = 0; 
      NUM_SHIFTS = 0; 
      if ( overlap )  test_num = test_num + 1; 
      PROCESSNAME = "";

    end  
  endtask  

//***************************************************************************//
//                 READ COMMANDS AND DATA AND RUN SIMULATION                 //
//***************************************************************************//

  task cmd_code; 
    begin 

      if ( sim_trace )  $display ( "\nCommand code:  %0d ", CMD ); 

      case ( CMD ) 

        000: begin 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

        100: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        104: begin 
          rc_read = $fgets ( PROCESSNAME, DATAID ); 
          if ( rc_read > 0 )  begin 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, PROCESSNAME ); 
          end  
          line_number = line_number + 1; 
        end  

        110: begin 
          rc_read = $fgets ( COMMENT, DATAID ); 
          if ( rc_read > 0 )  begin 
            $display ( "\n %0s ", COMMENT ); 
          end  
          else  begin 
            $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
            $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
          end  
          line_number = line_number + 1; 
        end  

        151: begin 
          test_num_prev = test_num; 
          rc_read = $fscanf ( DATAID, "%d", test_num ); 
          if ( rc_read > 0 )  begin 
            if (( test_num != test_num_prev ) && ( sim_range ))  num_tests = num_tests + 1; 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", scan_num ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          rc_read = $fscanf ( DATAID, "%d", overlap ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 

          line_number = line_number + 1; 
        end  

        200: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_PIs [1:9] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        201: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", stim_CIs [1:9] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        202: begin 
          if ( rc_read > 0 )  begin 
            rc_read = $fscanf ( DATAID, "%b", meas_POs [1:5] ); 
            if ( rc_read <= 0 )  bad_cmd_code; 
            line_number = line_number + 1; 
          end  
        end  

        203: begin 
          rc_read = $fscanf ( DATAID, "%b", global_term ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        300: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_1 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_2 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_3 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", stim_CR_4 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        301: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SCANNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SCANNUM ) 

                    1: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_1 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    2: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_2 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    3: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_3 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                    4: begin 

                      if ( rc_read > 0 )  begin 
                        rc_read = $fscanf ( DATAID, "%b", meas_OR_4 [1:64] ); 
                        if ( rc_read <= 0 )  bad_cmd_code; 
                        line_number = line_number + 1; 
                      end  
                    end  

                  endcase  
                end  
              end  

            endcase  
          end  
        end  

        400: begin 
          if ( sim_range )  test_cycle; 
          line_number = line_number + 1; 
        end  

        500: begin 
          repeat_depth = repeat_depth + 1; 
          rc_read = $fscanf ( DATAID, "%d", num_repeats [repeat_depth] ); 
          if ( rc_read > 0 )  begin 
            start_of_repeat[repeat_depth] = $ftell ( DATAID ); 
          end  
          else  bad_cmd_code; 
          if ((sim_range & sim_heart) && repeat_heart) 
            $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Start of %0d cycles of a repeat loop.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
          line_number = line_number + 1; 
        end  

        501: begin 
          num_repeats [repeat_depth] = num_repeats [repeat_depth] - 1; 
          if ( num_repeats [repeat_depth] )  begin 
            if ((sim_range & sim_heart) && repeat_heart && (num_repeats [repeat_depth] % repeat_heart == 0 )) 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d.  Number of cycles remaining in this repeat loop is %0d.", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests, num_repeats [repeat_depth] ); 
            rc_read = $fseek ( DATAID, start_of_repeat [repeat_depth], 0 ); 
            rc_read = 1; 
            fseek_offset = $ftell ( DATAID ); 
            if ( fseek_offset != start_of_repeat [repeat_depth] )  begin 
              $display ( "\nERROR (TVE-956): A Verilog simulator limitation in the fseek routine has been reached.  The size of the Verilog Data file is so big that it can not support branching using fseek in the Verilog simulator.  Any branching after 9,223,372,036,854,775,807 (0x7fffffffffffffff) bytes of data will not run correctly under the Verilog simulator.  It is recommended that you break up the Verilog Data file using the keyword maxvectorsperfile.  The Verilog Data file:  %0s  \n", DATAFILE ); 
              rc_read = 0;  // This will stop execution 
            end  
          end  
          else  repeat_depth = repeat_depth - 1; 
          line_number = line_number + 1; 
        end  

        600: begin 
          rc_read = $fscanf ( DATAID, "%d", MODENUM ); 
          if ( rc_read <= 0 )  bad_cmd_code; 
          else  begin 

            case ( MODENUM ) 

              1: begin 
                rc_read = $fscanf ( DATAID, "%d", SEQNUM ); 
                if ( rc_read <= 0 )  bad_cmd_code; 
                else  begin 

                  case ( SEQNUM ) 

                    1: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Preconditioning_Sequence_TM_1_SEQ_1_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                    2: begin 
                      rc_read = $fscanf ( DATAID, "%d", MAX ); 
                      if ( rc_read > 0 )  begin 
                        if ( sim_range )  Scan_Sequence_TM_1_SEQ_2_SOP_1; 
                      end  
                      else  bad_cmd_code; 
                      line_number = line_number + 1; 
                    end  

                  endcase  
                end  
              end 

            endcase  
          end  
        end  

        900: begin 
          rc_read = $fscanf ( DATAID, "%s", pattern ); 
          if ( rc_read > 0 )  begin 
            if ( SOD == pattern )  begin 
              sim_range = 1'b1; 
            end  
            if (( sim_range ) & ( scan_num > 0 ))  begin 
              if ( overlap )  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Overlap Tests %0d and %0d.  Tests Passed %0d of %0d, Failed %0d. ", test_num - 1, pattern, CYCLE + 1, $time, scan_num, test_num - 1, test_num, num_tests - num_failed_tests - 1, num_tests - 1, num_failed_tests ); 
              else  $display ( "\nINFO (TVE-211): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Relative Scan: %0d  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, scan_num, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
              scan_num = 0; 
            end  
            else if ( sim_range & sim_heart )  begin 
              $display ( "\nINFO (TVE-202): Simulating Test: %0d  Odometer: %0s  Relative Cycle: %0d  Time: %0t  Tests Passed %0d of %0d, Failed %0d. ", test_num, pattern, CYCLE + 1, $time, num_tests - num_failed_tests, num_tests, num_failed_tests ); 
            end  
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        901: begin 
          rc_read = $fscanf ( DATAID, "%s", PATTERN ); 
          if ( rc_read > 0 )  begin 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        903: begin 
          measure_current = measure_current + 1; 
          line_number = line_number + 1; 
        end  

        904: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "counter_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  

        905: begin 
          rc_read = $fscanf ( DATAID, "%s", eventID ); 
          if ( rc_read > 0 )  begin 
            `ifdef MISCOMPAREDEBUG 
              if ( diag_debug ) begin 
                $processSimulationDebugFile ( DIAG_DEBUG_FILE, "counter_inst", eventID ); 
              end 
            `endif 
          end  
          else  bad_cmd_code; 
          line_number = line_number + 1; 
        end  


        default: begin 
          bad_cmd_code; 
          rc_read = 0;  // This will stop execution 
          line_number = line_number + 1; 
        end  

      endcase  

    end  
  endtask  

//***************************************************************************//
//                          PRINT BAD CMD CODE DATA                          //
//***************************************************************************//

  task bad_cmd_code; 
    begin 

      $display ( "\nERROR (TVE-998): Unrecognizable data at line %0.0f in file: %0s \n", line_number, DATAFILE ); 
      start_of_current_line = $ftell ( DATAID ); 
      rc_read = $fgets ( COMMENT, DATAID ); 
      $display ( "  Command code = %0d, Unrecognized data = %0s \n", CMD, COMMENT ); 
      rc_read = 0;  // This will stop execution 

    end  
  endtask  

  endmodule 
