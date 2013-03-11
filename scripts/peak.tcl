######################################
# Peak.tcl by KuNgFo0 (www.eggfaq.com)

#VERSION 0.3
#DESCRIPTION Keeps track of the peak number of people in your channels.

# Set the next line as the channels you want to run in
set peak_chans "#Mary'sPlace #callahans"
# Set the next line as the minute interval between peak checks
set peak_time 5
# Set the next line as the command to view the peak info
set peak_command "Mike,~peak"
# Set the next line as the file to store the info in
set peak_file "peak.data"

proc pub_peak {nick uhost hand chan arg} {
 global peak_data
 if {([peak_check [set chan [string tolower $chan]]]) && ([info exists peak_data($chan)])} {
  if {[set time [lindex $peak_data($chan) 1]] == 0} { set peak_last "" } \
  else { set peak_last [clock format $time -format "(Last set: %H:%M %D)"] }
  puthelp "PRIVMSG $chan :Channel peak for $chan: [lindex $peak_data($chan) 0] $peak_last"
 }
}

proc time_peak {} {
 global peak_time peak_file peak_data
 set peak_dosave 0
 foreach chan [string tolower [channels]] {
  if {([peak_check $chan]) && ([botonchan $chan])} {
   if {![info exists peak_data($chan)]} { set peak_data($chan) [list 0 0] }
   if {[set peak_temp [llength [chanlist $chan]]] > [lindex $peak_data($chan) 0]} {
    if {[set time [lindex $peak_data($chan) 1]] == 0} { set peak_last "" } \
    else { set peak_last [clock format $time -format "(Last set: %H:%M %D)"] }
    puthelp "PRIVMSG $chan :New channel peak for $chan: $peak_temp $peak_last"
    set peak_data($chan) [list $peak_temp [clock seconds]]
    set peak_dosave 1
   }
  }
 }
 if {$peak_dosave} {
  if {![catch {open $peak_file w} fileid]} {
   foreach chan [array names peak_data] { puts $fileid [list $chan $peak_data($chan)] }
   close $fileid
  } else { putlog "Error: Could not save peak data file" }
 }
 if {![string match "*time_peak*" [timers]]} { timer $peak_time time_peak }
}

proc peak_check {chan} {
 global peak_chans
 return [expr {([lsearch -exact [string tolower $peak_chans] $chan] != -1) || ([strcmp $peak_chans "*"] == 0)}]
}

bind pubm - "% Mike,~peak*" pub_peak
if {[file exists $peak_file]} {
 if {![catch {open $peak_file r} fileid]} {
  while {![eof $fileid]} {
   if {([gets $fileid peak_temp] > 0) && ([peak_check [set chan [string tolower [lindex $peak_temp 0]]]])} { set peak_data($chan) [lindex $peak_temp 1] }
  }
  close $fileid
 } else { putlog "Error: Could not load peak data file" }
}
if {![string match "*time_peak*" [timers]]} { timer $peak_time time_peak }

putlog "*** Peak.tcl 0.3 by KuNgFo0 loaded"
