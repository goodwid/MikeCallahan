# Web page stats for Mike Callahan
# Copyright 2009 by Brendan K Callahan <420420@gmail.com>, David Goodwin <goodwid@gmail.com>, and William Buehl <wsbuehl@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.

# This script attempts to create a web page for people to view about what Mike is doing, his status and other assorted items

# Brendan

##### variable declaration & init #####
global stats_version food_data current_food lap_location sobriety liquid_marker pix_version food_data

set stats_version "v1.1 build 013"

if {![info exists last_quote]} {
	set last_quote "This is not the quote you're looking for"
	set last_quoter "Obi-Wan Kenobi"
}

##### Initial settings and timer start
putlog "Callahan: Stats page generator $stats_version loaded . . ."
set update_timer2 1
if {![info exists web_timer_id2]} {
	set web_timer_id2 [timer $update_timer2 generator_web]
}

##### The actual page generation, simply sets a timer to call itself every minute
proc generator_web {} {
	set stats_version "v1.1 build 013"
	global timer_id index_html_iostream counter stats_version_local nomatch_iostream nomatch_raw nomatch_data recent_url_iostream recent_url_raw recent_url
	upvar #0 booze_item booze_item_local user_name user_name_local
	upvar #0 menu_item menu_item_local
	upvar #0 bot_version bot_version_local
	upvar #0 last_quote last_quote_local
	upvar #0 last_quoter last_quoter_local
	upvar #0 cleaned_line cleaned_line_local

	set web_timer_id2 [timer 1 generator_web]
	set page_location "/home/$user_name_local/public_html/index.html"
	set index_html_iostream [open $page_location "w+"]
#####Begin Header
	puts $index_html_iostream "<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">"
	puts $index_html_iostream "<html>"
	puts $index_html_iostream "<head>"
	puts $index_html_iostream "<meta http-equiv=\"Content-Language\" content=\"en-us\">"
	puts $index_html_iostream ""
	puts $index_html_iostream "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-1252\">"
	puts $index_html_iostream "<title>Mike Callahan's Statistics Page $stats_version</title>"
	puts $index_html_iostream "</head>"
	puts $index_html_iostream "<body>"
	puts $index_html_iostream "<font size=\"5\">Mike Callahan's Statistics Page</font>"
	puts $index_html_iostream "<center>"
	puts $index_html_iostream "<h3>Web Stats $stats_version at [clock format [clock seconds]]<br>"
	puts $index_html_iostream "I am currently running $bot_version_local</h3><p>"
	puts $index_html_iostream "</center>"
#####End Header

#####Begin Current Section
	puts $index_html_iostream "<b>Currently:</b><br>"
	if {$menu_item_local == ""} {set menu_item_local "nothing"}
	puts $index_html_iostream "I currently have $menu_item_local for your pleasure.<br>"
	if {$booze_item_local == ""} {set booze_item_local "absolutely nothing, because noone's asked in awhile. . "}
	puts $index_html_iostream "The last time someone ordered a random drink, they were served $booze_item_local.<br>"
	clean_line $last_quote_local
	puts $index_html_iostream "The last quote added (courtesy of $last_quoter_local) was: \"$cleaned_line_local\"<br>"
	puts $index_html_iostream "<br>"
	puts $index_html_iostream "<br>"
#####End Current Section

#####Begin Quote Generation
	puts $index_html_iostream "<p><b>5 next most recently quoted:</b><br>"
        set file "./scripts/patron_quotes.egt"
	#reading the data file
        set temp_file [open $file "r"]
	#parsing the data file into a list
        set patron_quotes [split [read -nonewline $temp_file] "\n"]
	# file cleanup
        close $temp_file
	set counter 0
	set counter2 [llength $patron_quotes]
	incr counter2 -2
	while {$counter < 5} {
		set line [split [lindex $patron_quotes $counter2] ¶]
		set counter3 0
		while {$counter3 < [llength $line]} {
			clean_line [lindex $line $counter3]
			if {$cleaned_line_local != ""} {puts $index_html_iostream " $cleaned_line_local<br>"}
			incr counter3
		}
		puts $index_html_iostream "<br>"
		incr counter
		incr counter2 -1
	}
	puts $index_html_iostream "<br>"
#####End Quote Generation

#####Begin URL Generation
	set recent_url_iostream [open "./scripts/url_history.egt" "r+"]
	set recent_url_raw [read -nonewline $recent_url_iostream]
	set recent_url [split $recent_url_raw "\n"]
	close $recent_url_iostream
	set counter [llength $recent_url]
	#putlog "Length: [llength $recent_url]"
	set counter2 0
	puts $index_html_iostream "<p><b>20 most recent URLs found in my channels:</b><br>"
	incr counter -1
	while {$counter > -1 && $counter2 < 21} {
		set temp_string [lindex $recent_url $counter]
		set nws_flag [lindex $temp_string 0]
		clean_line "[lindex $temp_string 2]"
		set url $cleaned_line_local
		set url_time_temp [lindex $temp_string 1]
		set url_time [clock format [expr "$url_time_temp"]]
		if {$nws_flag == 1} {puts $index_html_iostream "$url_time <a href=\"$url\"> $url</a><img src=\"http://3whack.org/mike/nws.png\"><br>"}
		if {$nws_flag == 0} {puts $index_html_iostream "$url_time <a href=\"$url\"> $url</a><br>"}
		incr counter -1
		incr counter2
	}
	puts $index_html_iostream "<br>"
	puts $index_html_iostream "'<a href=\"complete.html\">forever</a>' list of URLs<br>"
#####End URL Generation

#####Footer
	puts $index_html_iostream "<br><br><br></p>"
	puts $index_html_iostream "<div class=\"c2\">"
	puts $index_html_iostream "<h5>This data updates every minute.</h5><br>"
	puts $index_html_iostream "<hr>"
	puts $index_html_iostream "<p class=\"c3\">"
	#puts $index_html_iostream "</align=\"center\"><a href=\"http://3whack.org/mike/\">Forums</a> <a href=\"http://3whack.org/mike/help.html\">Help</a> <a href=\"http://3whack.org/mike/helpbeta.html\">Beta Help</a> <a href=\"http://3whack.org/mike/quote.html\">Quote Help</a> <a href=\"http://3whack.org/mike/source.html\">Source</a> Stats Page<br><br></p>"
	puts $index_html_iostream "<div class=\"c2\">"
	puts $index_html_iostream "<table border=\"0\" cellpadding=\"0\">"
	puts $index_html_iostream "<tr>"
	puts $index_html_iostream "<td><!--Creative Commons License--><a rel=\"license\" href=
\"http://creativecommons.org/licenses/by-nc-sa/2.5/\"><img alt=\"Creative Commons License\" style=\"border-width: 0\" src=\"./images/creativecommons88x31.png\"></a></td>"
	puts $index_html_iostream "<td><a href=\"http://validator.w3.org/check?uri=referer\"><img src=\"http://www.w3.org/Icons/valid-html401-blue\"alt=\"Valid HTML 4.01 Transitional\" height=\"31\" width=\"88\"></a></td>"
	puts $index_html_iostream "</tr>"
	puts $index_html_iostream "</table>"
	puts $index_html_iostream "</div>"
	puts $index_html_iostream "<p align=\"center\">"
	puts $index_html_iostream "This work is licensed under a <a rel=\"license\" href=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\">Creative Commons Attribution-NonCommercial-ShareAlike 2.5 License</a>."
	puts $index_html_iostream "<!--/Creative Commons License-->"
	puts $index_html_iostream "<!-- <rdf:RDF xmlns=\"http://web.resource.org/cc/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\""
	puts $index_html_iostream "xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\">"
	puts $index_html_iostream "<Work rdf:about=\"\">"
	puts $index_html_iostream "<license rdf:resource=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\">"
	puts $index_html_iostream "<dc:type rdf:resource=\"http://purl.org/dc/dcmitype/Text\">"
	puts $index_html_iostream "</Work>"
	puts $index_html_iostream "<License rdf:about=\"http://creativecommons.org/licenses/by-nc-sa/2.5/\"><permits rdf:resource=\"http://web.resource.org/cc/Reproduction\"><permits rdf:resource=\"http://web.resource.org/cc/Distribution\"><requires rdf:resource=\"http://web.resource.org/cc/Notice\"><requires rdf:resource=\"http://web.resource.org/cc/Attribution\"><prohibits rdf:resource=\"http://web.resource.org/cc/CommercialUse\"><permits rdf:resource=\"http://web.resource.org/cc/DerivativeWorks\"><requires rdf:resource=\"http://web.resource.org/cc/ShareAlike\"></License></rdf:RDF> --><br>"
	puts $index_html_iostream "Copyright 2006-2009 by Brendan K Callahan, David Goodwin, &amp; William Buehl</p>"
	puts $index_html_iostream "</div>"
	puts $index_html_iostream "</body>"
	puts $index_html_iostream "</html>"

##### End of file writing, close and move on :)
	close $index_html_iostream
	return
} 

proc clean_line {text} {
	upvar #0 cleaned_line cleaned_line_local
	set counter 0
	set clean_list ""
	while {$counter < [llength $text]} {
		set temp_string_length [string length [lindex $text $counter]]
		set temp_string [lindex $text $counter]
		set clean_string ""
		set counter2 0
		while {$counter2 <= $temp_string_length} {
			set temp_char [string range $temp_string $counter2 $counter2]
			if {$temp_char == ">"} {
				set temp_char "&gt;"
			}
			if {$temp_char == "<"} {
				set temp_char "&lt;"
			}
			if {$temp_char == "&"} {
				set temp_char "&amp;"
			}
			append clean_string $temp_char
			incr counter2
		}
		append clean_list $clean_string
		append clean_list " "
		incr counter
	}
	set cleaned_line_local $clean_list
	return
}
