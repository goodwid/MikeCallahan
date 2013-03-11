# Web page stats for PixelCat
# Copyright 2005 Brendan K Callahan

# This script attempts to create a web page for people to view about what the cat is doing, his status and is HIGHLY experimental as it is my first time doing it.

# Brendan

##### variable declaration & init #####
global stats_version food_data current_food lap_location sobriety liquid_marker pix_version food_data

set stats_version "v1.0 build 008-stable"

##### Initial settings and timer start
putlog "PixelCat: Stats page generator"
putlog "$stats_version"
set update_timer 1
if {![info exists web_timer_id]} {
	set web_timer_id [timer $update_timer generator]
}

##### The actual page generation, simply sets a timer to call itself every 2 minutes
proc generator {} {

	global timer_id index_html_iostream current_food_local lap_location_local sobriety_local liquid_marker_local pix_version_local counter stats_version_local nomatch_iostream nomatch_raw nomatch_data recent_queue_iostream recent_queue_raw recent_queue
	
	upvar #0 current_food current_food_local
	upvar #0 lap_location lap_location_local
	upvar #0 sobriety sobriety_local
	upvar #0 liquid_marker liquid_marker_local
	upvar #0 pix_version pix_version_local
	upvar #0 food_data food_item_local
	upvar #0 stats_version stats_version_local
	upvar #0 food_timer_minutes food_timer_minutes_local

	set web_timer_id [timer 1 generator]
	set index_html_iostream [open "/home/pixelcat/public_html/index.html" "w+"]

	puts $index_html_iostream "<html>"
	puts $index_html_iostream "<head>"
	puts $index_html_iostream "<meta http-equiv=refresh content=300>"
	puts $index_html_iostream "<title>PixelCat Statistics Page $stats_version_local</title>"
	puts $index_html_iostream "</head>"
	puts $index_html_iostream "<body>"
	puts $index_html_iostream "<center> "
	puts $index_html_iostream "<h3>Web Stats $stats_version_local at [clock format [clock seconds]]<br>"
	puts $index_html_iostream "I am currently running $pix_version_local</h3><p>"
	puts $index_html_iostream "</center> "
	if {$lap_location_local == "completelyempty"} {
		set lap_name "I am not on anyone's lap"
	}
	if {$lap_location_local != "completelyempty"} {
		set lap_name "I am on $lap_location_local's lap"
	}
	if {$current_food_local == ""}  {
		set food_status "nothing"
	}
	if {$current_food_local != ""}  {
		set food_status $current_food_local
	}
	puts $index_html_iostream "<B>Currently:</B><BR>"
	puts $index_html_iostream "$lap_name<br>"
	puts $index_html_iostream "I am $sobriety_local<br>"
	puts $index_html_iostream "I am currently ingesting $food_status<br>"
	puts $index_html_iostream "My food dish contains:<br>"
	read_food_queue
	set counter 0
	while {$counter < [llength $food_item_local]} {
		puts $index_html_iostream "   $counter: [lindex $food_item_local $counter]<br>"
		incr counter
	}
	puts $index_html_iostream "<br>"
	set recent_queue_iostream [open "/home/pixelcat/eggdrop1.6.17/recentfood.egt" "r+"]
	set recent_queue_raw [read -nonewline $recent_queue_iostream]
	set recent_queue [split $recent_queue_raw "\n"]
	close $recent_queue_iostream
	set counter 0
	puts $index_html_iostream "<p><b>Most recent items in my food queue:</b><br>"
	while {$counter < [llength $recent_queue]} {
		puts $index_html_iostream "[lindex $recent_queue $counter]<br>"
		incr counter
	}
	puts $index_html_iostream "<p><B>Things my daddy hasn't gotten around to implementing yet:</B><br>"
	set nomatch_iostream [open "/home/pixelcat/eggdrop1.6.17/nomatch.egt" "r"]
	set nomatch_raw [read -nonewline $nomatch_iostream]
	set nomatch_data [split $nomatch_raw "\n"]
	close $nomatch_iostream 
	set counter 0
	while {$counter < [llength $nomatch_data]} {
		puts $index_html_iostream "$counter: [lindex $nomatch_data $counter]<br>"
		incr counter
	}
	
	puts $index_html_iostream "<br><br><br><h5><center>This data updates every minute; this page refreshes every 5 minutes<br>"
	puts $index_html_iostream "Coypright 2005 Brendan K Callahan</h5></center>"
	puts $index_html_iostream "</body>"
	puts $index_html_iostream "</html>"
	close $index_html_iostream
	putlog "Wrote webstats to index.html"
	return
} 
