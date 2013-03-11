# URL record keeper for Mike Callahan
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

# This script attempts to create a web page for people to view all the URLs Mike has ever seen in channel.

# Brendan

##### variable declaration & init #####
global stats_version food_data current_food lap_location sobriety liquid_marker pix_version food_data

set stats_version "v1.1 build 007"

##### Initial settings and timer start
putlog "Callahan: every URL.  Ever.  $stats_version loaded . . ."
set update_timer 60
if {![info exists web_timer_id]} {
	set web_timer_id [timer $update_timer generator]
}

##### The actual page generation, simply sets a timer to call itself every minute
proc generator {} {

	global timer_id index_html_iostream counter stats_version_local nomatch_iostream nomatch_raw nomatch_data recent_url_iostream recent_url_raw recent_url
	upvar #0 stats_version stats_version_local
	set web_timer_id [timer 60 generator]
	set index_html_iostream [open "/home/callahan/public_html/complete.html" "w+"]
	puts $index_html_iostream "<html>"
	puts $index_html_iostream "<head>"
	puts $index_html_iostream "<meta http-equiv=\"Content-Language\" content=\"en-us\">"
	puts $index_html_iostream ""
	puts $index_html_iostream "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1252\">"
	puts $index_html_iostream "<title>Mike Callahan's 'every URL I've ever seen' page</title>"
	puts $index_html_iostream "</head>"
	puts $index_html_iostream "<body>"
	puts $index_html_iostream "<font size=\"5\">Mike Callahan's Long List of URLs</font>"
	puts $index_html_iostream "<br />"
	set recent_url_iostream [open "./scripts/url_history.egt" "r+"]
	set recent_url_raw [read -nonewline $recent_url_iostream]
	set recent_url [split $recent_url_raw "\n"]
	close $recent_url_iostream
	set counter [llength $recent_url]
	#putlog "Length: [llength $recent_url]"
	set counter2 0
	puts $index_html_iostream "<p><b>All URLs ever found in my channels (most recent listed first):</b><br />"
	incr counter -1
	while {$counter > -1 } {
		set temp_string [lindex $recent_url $counter]
		set nws_flag [lindex $temp_string 0]
		set url [lindex $temp_string 2]
		set url_time_temp [lindex $temp_string 1]
		set url_time [clock format [expr "$url_time_temp"]]
		if {$nws_flag == 1} {puts $index_html_iostream "$url_time <a href=\"$url\"> $url</a><img src=\"http://3whack.org/mike/nws.png\"><br />"}
		if {$nws_flag == 0} {puts $index_html_iostream "$url_time <a href=\"$url\"> $url</a><br />"}
		incr counter -1
		incr counter2
	}
	puts $index_html_iostream "<br />"
	puts $index_html_iostream "<br /><br  /><br /><h5><center>This data updates every hour.  Last update: [clock format [clock seconds]]<br />"
	puts $index_html_iostream "<hr />"
	puts $index_html_iostream "<p align=\"center\">"
	puts $index_html_iostream "</align=\"center\"><a href=\"http://3whack.org/mike/\">Forums</a> <a href=\"http://3whack.org/mike/help.html\">Help</a> <a href=\"http://3whack.org/mike/helpbeta.html\">Beta Help</a> <a href=\"http://3whack.org/mike/quote.html\">Quote Help</a> <a href=\"http://3whack.org/mike/source.html\">Source</a> <a href=\"http://tillamook.3whack.org/~callahan/index.html\">Stats Page</a><br /><br /></p>"
	puts $index_html_iostream "<div align=\"center\">"
	puts $index_html_iostream "<table border=\"0\" cellpadding=\"0\">"
	puts $index_html_iostream "<tr>"
	puts $index_html_iostream "<td><!--Creative Commons License--><a rel=\"license\" href=
\"http://creativecommons.org/licenses/by-nc-sa/2.5/\"><img alt=\"Creative Commons License\" style=\"border-width: 0\" src=\"http://3whack.org/mike/somerights20.png\" /></a></td>"
	puts $index_html_iostream "<td><img src=\"http://img.uptime-project.net/img/7/101877.png\" alt=\"Uptime for Mike & Pix's box\"></td>"
	puts $index_html_iostream "<td><a href=\"http://validator.w3.org/check?uri=referer\"><img src=\"http://www.w3.org/Icons/valid-xhtml10\"alt=\"Valid XHTML 1.0 Transitional\" height=\"31\" width=\"88\" /></a></td>"
	puts $index_html_iostream "</tr>"
	puts $index_html_iostream "</table>"
	puts $index_html_iostream "</div>"
	puts $index_html_iostream "<p align=\"center\">"
	puts $index_html_iostream "This work is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\">Creative Commons Attribution-NonCommercial-ShareAlike 2.5 License</a>."
	puts $index_html_iostream "<!--/Creative Commons License-->"
	puts $index_html_iostream "<!-- <rdf:RDF xmlns=\"http://web.resource.org/cc/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\""
	puts $index_html_iostream "xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"
	puts $index_html_iostream "<Work rdf:about=\"\">"
	puts $index_html_iostream "<license rdf:resource=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\" />"
	puts $index_html_iostream "<dc:type rdf:resource=\"http://purl.org/dc/dcmitype/Text\" />"
	puts $index_html_iostream "</Work>"
	puts $index_html_iostream "<License rdf:about=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\"><permits rdf:resource=\"http://web.resource.org/cc/Reproduction\"/><permits rdf:resource=\"http://web.resource.org/cc/Distribution\"/><requires rdf:resource=\"http://web.resource.org/cc/Notice\"/><requires rdf:resource=\"http://web.resource.org/cc/Attribution\"/><prohibits rdf:resource=\"http://web.resource.org/cc/CommercialUse\"/><permits rdf:resource=\"http://web.resource.org/cc/DerivativeWorks\"/><requires rdf:resource=\"http://web.resource.org/cc/ShareAlike\"/></License></rdf:RDF> --><br />"
	puts $index_html_iostream "Copyright 2006 by Brendan K Callahan &amp; David Goodwin</p>"
	puts $index_html_iostream "</body>"
	puts $index_html_iostream "</html>"

##### End of file writing, close and move on :)
	close $index_html_iostream
	putlog "Callahan: All URLs page generator $stats_version_local Finished at: [clock format [clock seconds]]"
	return
} 
