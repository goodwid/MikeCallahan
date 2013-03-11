# Eggdrop Weather Script 
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
putlog "Weather Version 0.2 is now forcasted"


proc pub_weather {nick host hand chan arg} {
	upvar #0 xtra_status xtra_status_local
	set zipcode ""
	get_xtra $nick "ZIPCODE" $chan
	set zipcode $xtra_status_local
	putlog "zip code retrieved: $zipcode"
	#if {$zipcode == -1} {putserv "PRIVMSG $nick :You do not have your Zip Code set. '/msg Callahan my zip code is <zipcode>' to set it.";return}
	set location_ID ""

	##### If no zip code found, check for location ID
	if {$xtra_status_local == -1 || $zipcode == "00000"} {
		get_xtra $nick "LOCATIONID" $chan
		##### Kick 'em out if nothing is set
		if {$xtra_status_local == -1} {
			puthelp "NOTICE $nick :Please set your zip code (US) or Location ID (US or Intl.)"
			puthelp "NOTICE $nick :Please use /msg callahan ehelp."
			return
		}
		set location_ID $xtra_status_local
		putlog "Location ID retrieved: $location_ID"
	}
	pub_weather_get $zipcode $location_ID $nick $chan
	pub_weather_output $nick
	return
}

proc pub_weather_get {zipcode location_ID nick chan} {
	upvar #0 weather_output_raw weather_output_raw_local
	set weather_output_raw_local ""
	set rawXML [socket -async xml.weather.yahoo.com 80]
	if {$zipcode != -1 && $zipcode != "00000"} {puts $rawXML "GET /forecastrss?p=$zipcode"}
	if {$zipcode == "00000"} {puts $rawXML "GET /forecastrss?p=$location_ID&u=c"}
	flush $rawXML
	set counter 1
	while {$counter < 40} {incr counter;lappend weather_output_raw_local [gets $rawXML]}
	close $rawXML
	return
}

proc pub_weather_output {nick} {
	upvar #0 weather_output_raw weather_output_raw_local
	set weather_location [lindex $weather_output_raw_local 22]
	set weather_location [string replace $weather_location 0 7]
	set weather_location [string trimright $weather_location "</title>"]

	set weather_current_conditions [string trimright [lindex $weather_output_raw_local 32] "<BR />"]

	set weather_forecast_1 [string trimright [lindex $weather_output_raw_local 34] "<br />"]
	set weather_forecast_2 [string trimright [lindex $weather_output_raw_local 35] "<br />"]
	
	set weather_URL [lindex $weather_output_raw_local 37]
	set string_index_1 [string first \* $weather_URL]
	set weather_URL [string replace $weather_URL 0 $string_index_1]
	set string_index_2 [string first \" $weather_URL]
	set weather_URL [string replace $weather_URL $string_index_2 end]

	putquick "NOTICE $nick :$weather_location from Yahoo! Weather"
	putserv "NOTICE $nick :Current: $weather_current_conditions"
	putserv "NOTICE $nick :Forecast: $weather_forecast_1, $weather_forecast_2"
	putserv "NOTICE $nick :For further details, see $weather_URL"
	return
}