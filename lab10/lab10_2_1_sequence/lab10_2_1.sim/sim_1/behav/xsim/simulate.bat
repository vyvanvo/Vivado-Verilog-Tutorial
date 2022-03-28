@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sat Mar 26 20:34:29 -0700 2022
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim moore_fsm_tb_behav -key {Behavioral:sim_1:Functional:moore_fsm_tb} -tclbatch moore_fsm_tb.tcl -view C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab10/lab10_2_1_sequence/moore_fsm_tb_behav.wcfg -log simulate.log"
call xsim  moore_fsm_tb_behav -key {Behavioral:sim_1:Functional:moore_fsm_tb} -tclbatch moore_fsm_tb.tcl -view C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab10/lab10_2_1_sequence/moore_fsm_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0