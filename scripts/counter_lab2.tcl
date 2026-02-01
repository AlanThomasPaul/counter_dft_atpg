## Set top design name to a variable 
  set vars(DESIGN)               counter 
  
#############################################################################
##                                                                         ##
##   Step 1:  Define Root Attributes                                       ##
##                                                                         ##
#############################################################################

  set_db information_level 9
  set_db init_lib_search_path    {/home/install/TTTC_Cadence_labs/LIBS/timing }

###############################################################################
##                                                                           ##  
##   Step 2:   Read the technology libraries, load and elaborate the design  ##  
##                                                                           ##  
###############################################################################

  puts "INFO: ----------------------------------------------------"
  puts "INFO: Read the Technology Libraries                       "
  puts "INFO: ----------------------------------------------------"

  set_db library \
    "slow.lib.gz"


  puts "INFO: ----------------------------------------------------"
  puts "INFO: Load and Elaborate the Design                       "
  puts "INFO: ----------------------------------------------------"

  set rtlList "/home/install/TTTC_Cadence_labs/GENUS_FLOW/counter.v"

  read_hdl $rtlList
  elaborate $vars(DESIGN)

#Run get_db insts to see the instances in the design post elaboration.
  puts "INFO: ----------------------------------------------------------------"
  puts "INFO_DETAIL: Check design for unresolved modules and multi-driven pins"
  puts "INFO: ----------------------------------------------------------------"

  check_design \
    -undriven \
    -unloaded \
    -unresolved \
    -multiple_driver 

###############################################################################
##                                                                           ##  
##   Step 3:   Define DFT setup                                              ## 
##                                                                           ##  
###############################################################################


  puts "INFO: ------------------------------------------------------------------------------------------------------"
  puts "INFO_DETAIL: Defining root attributes to enable top level test clock and internal test clocks identification"
  puts "INFO: ------------------------------------------------------------------------------------------------------"

  ## Auto identification of DFT test clocks
  ## When inserting OPCG logic for designs which include PLLs or buffers added as test points to model an Oscillator source
  ## Disable test clock identification to avoid the reference clock 'REFCLK' from being identified as a DFT test clock.
  ## Defining it as a test clock will cause 'add_opcg' commmand to fail since 'REFCLK' is also an Oscillator source for OPCG.
  set_db dft_identify_top_level_test_clocks false

  ## Auto identification of async set and reset signals which control async set and reset pins of flip-flops
  set_db dft_identify_test_signals false 

  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: DFT TDRC Check"
  puts "INFO: ----------------------------------------------------"

  check_dft_rules

  puts "INFO: -------------------------------------------------------------------------"
  puts "INFO_DETAIL: Defining the Test Clock used for Scan"
  puts "INFO: -------------------------------------------------------------------------"
#-create_port 
  define_test_clock -name scan_clk clk_test 

  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: DFT TDRC Check"
  puts "INFO: ----------------------------------------------------"

  check_dft_rules

  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: Defining the Default Shift-Enable & Test-Mode Test Signal"
  puts "INFO: ----------------------------------------------------"

  define_test_signal -function shift_enable -name {scan_en} -active {high} -create_port {scan_enable} 
  define_test_signal -function test_mode -name {test_mode} -active {high} TM 

  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: DFT TDRC Check"
  puts "INFO: ----------------------------------------------------"

  check_dft_rules 

  puts "INFO: ---------------------------------------------------------------------------------------------------------"
  puts "INFO_DETAIL: Defining the Test Mode Control Signals for Async Set and Reset Signals which exist as Ports in RTL"
  puts "INFO: ---------------------------------------------------------------------------------------------------------"

  define_test_signal -function async_set_reset -name {reset} -active {high} reset 
#  define_test_signal -function compression_enable COMP_EN -create


  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: DFT TDRC Check"
  puts "INFO: ----------------------------------------------------"

  check_dft_rules 

    
###############################################################################
##                                                                           ##  
##   Step 5:  DFT Configuration                                              ## 
##                                                                           ##  
###############################################################################

  puts "INFO: ----------------------------------------------------"
  puts "INFO: Configuring parameters for DFT                      "
  puts "INFO: ----------------------------------------------------"


  set_db designs .dft_min_number_of_scan_chains 4
  set_db designs .dft_mix_clock_edges_in_scan_chains false
  
  puts "INFO: ----------------------------------------------------"
  puts "INFO_DETAIL: DFT TDRC Check"
  puts "INFO: ----------------------------------------------------"

  check_dft_rules 

###############################################################################
##   Step 6:  Synthesize to generic gates                                    ## 
##                                                                           ##  
###############################################################################


  puts "INFO: ----------------------------------------------------"
  puts "INFO: Run Synthesis to Generic Gates with -physical       "
  puts "INFO: ----------------------------------------------------"

  syn_generic 

###############################################################################
##                                                                           ##  
##   Step 7:  Synthesize to mapped gates                                     ## 
##                                                                           ##  
###############################################################################

  puts "INFO: ----------------------------------------------------"
  puts "INFO: Run Synthesis to Mapped Gates                       "
  puts "INFO: ----------------------------------------------------"

  syn_map

###############################################################################
##                                                                           ##  
##   Step 8:  Connect Scan Chains                                            ## 
##                                                                           ##  
###############################################################################

  puts "INFO: ----------------------------------------------------"
  puts "INFO: Stitching Scan Chains                               "
  puts "INFO: ----------------------------------------------------"

  connect_scan_chains -auto
#  add_test_compression -build_new_scan_chains 5 -auto_create -compressor xor 
  compress_scan_chains  -ratio 4 -auto

###############################################################################
##                                                                           ##  
##   Step 9:  Incremental Synthesis                                          ## 
##                                                                           ##  
###############################################################################

  puts "INFO: ----------------------------------------------------"
  puts "INFO: Run Incremental Synthesis                           "
  puts "INFO: ----------------------------------------------------"

  syn_opt

###############################################################################
##                                                                           ##  
##   Step 10:  Write the DFT Reports                                         ##
##                                                                           ##  
###############################################################################

  check_dft_rules 

  report_scan_registers    > ./REPORTS_COMP/DFTregs_final.rpt
  report_scan_setup        > ./REPORTS_COMP/DFTsetup_final.rpt
  report_scan_chains       > ./REPORTS_COMP/DFTchains_final.rpt
  write_scandef            > ./REPORTS_COMP/scanDEF.def

###############################################################################
##                                                                           ##  
##   Step 11:  Write Database and run scripts for Modus ATPG                 ## 
##                                                                           ##  
###############################################################################

  puts "INFO: ------------------------------------------------"
  puts "INFO:  Write the Modus Test database for ATPG         "
  puts "INFO: ------------------------------------------------"
  write_dft_atpg \
      -compression \
      -library /home/install/TTTC_Cadence_labs/LIBS/atpg/include_libraries.v \
      -ncsim_library /home/install/TTTC_Cadence_labs/LIBS/verilog/include_libraries_sim.v \
      -directory MODUS_RUN_COUNTER_COMP

  exit
