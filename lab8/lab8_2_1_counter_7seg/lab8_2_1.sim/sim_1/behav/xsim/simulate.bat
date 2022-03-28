@echo off
REM ****************************************************************************
REM Vivado (TM) v2019.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Thu Mar 24 17:17:56 -0700 2022
REM SW Build 2552052 on Fri May 24 14:49:42 MDT 2019
REM
REM Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
echo "xsim counter_7seg_tb_behav -key {Behavioral:sim_1:Functional:counter_7seg_tb} -tclbatch counter_7seg_tb.tcl -log simulate.log"
call xsim  counter_7seg_tb_behav -key {Behavioral:sim_1:Functional:counter_7seg_tb} -tclbatch counter_7seg_tb.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
