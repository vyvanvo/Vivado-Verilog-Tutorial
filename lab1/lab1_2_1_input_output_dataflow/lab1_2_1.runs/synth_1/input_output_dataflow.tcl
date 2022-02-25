# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_param synth.incrementalSynthesisCache C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/.Xil/Vivado-6884-LAPTOP-L8ODNIU0/incrSyn
set_msg_config -id {Synth 8-256} -limit 10000
set_msg_config -id {Synth 8-638} -limit 10000
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/lab1_2_1.cache/wt [current_project]
set_property parent.project_path C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/lab1_2_1.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/lab1_2_1.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/lab1_2_1.srcs/sources_1/new/input_output_dataflow.v
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/Basys3_Master.xdc
set_property used_in_implementation false [get_files C:/Users/yvvan/Documents/Research/Vivado_Verilog_Tutorial/lab1/lab1_2_1_input_output_dataflow/Basys3_Master.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

synth_design -top input_output_dataflow -part xc7a35tcpg236-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef input_output_dataflow.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file input_output_dataflow_utilization_synth.rpt -pb input_output_dataflow_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]