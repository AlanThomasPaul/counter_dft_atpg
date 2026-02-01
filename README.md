####### Getting the TTTC Lab workshop (ONLY FOR LAB, NOT FOR USERS/STUDENTS)####################
In the /home/install , run sudo username@ftp.cadence.com and password. Run get <filename>

After getting the files in the install area, change relative paths with ../LIBS and .v RTL only to absolute paths in all the files 

####### Running the Labs #######################
Each user , open a terminal. Run :
   nc -vz 14.139.1.126 5280
   csh
   source /home/install/cshrc
   mkdir test  -------------------------> Creates a directory
   cd test

Copy the following tcl script and understand the commands 
   cp -rpf /home/install/TTTC_Cadence_labs/GENUS_FLOW/counter_lab1.tcl 

To invoke GENUS cdns help
/home/install/GENUS211/bin/cdnshelp &

Invoke genus and source the script
   genus
   genus:@root> source counter_lab1.tcl

Complete Genus, invoke Modus and source atpg script from MODUS_RUN_COUNTER to generate the patterns
   modus
   modus:@root>source MODUS_RUN_COUNTER/runmodus.atpg.tcl

After completing, explore modus gui
   modus -legacy_gui

Explore the outputs. Simulate the patterns and observe the outputs through waveform
   MODUS_RUN_COUNTER/run_fullscan_sim
   ncsim -64bit
