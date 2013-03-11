# Copyright 2006-2009 by Brendan K Callahan <brendan.k.callahan@gmail.com>, David Goodwin <goodwid@gmail.com>, and William S Buehl <wsbuehl@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@unbaptisethedead.info>.


##If the variable 'trigger' is not set already, set it to 'Mike'
if {![info exists trigger]} {
	set trigger "Mike"
}

putlog "#####  The binds that tie us. . . Using '$trigger' as my trigger."

#####
##### IRC Binds
#####

#Mike-Callahan-3.0.tcl
bind CTCP - action act:action_event
bind join - * join:greet
bind sign - * quit:clean
bind part - * part:clean
bind topc - * topic:changed
bind mode - * mode:change

#####
##### Message Binds
#####

#Mike-Callahan-3.0.tcl
bind msgm - *reset_pass* pub_reset_pass
bind msgm - *pass_reset* pub_reset_pass
bind msgm - *resetpass* pub_reset_pass
bind msgm - *passreset* pub_reset_pass
bind msgm - *MSGOP* priv_MSGOP

#add_patron_quote.tcl
bind msgm - *add~quote* pub_add_quote
bind msgm - *add~breakfast* pub_add_food
bind msgm - *add~dinner* pub_add_food
bind msgm - *add~dessert* pub_add_food
bind msgm - *add~brunch* pub_add_food
bind msgm - *add~lunch* pub_add_food
bind msgm - *add~snack* pub_add_food
bind msgm - *add~tea* pub_add_food
bind msgm - *add~appetizer* pub_add_food
bind msgm - *add~button* pub_add_other
bind msgm - *add~fortune* pub_add_other
bind msgm - *add~chacha* pub_add_other

#XTRAS.tcl
bind msgm - *my~familiar~is* msg_setfamiliar
bind msgm - *what~is~my~familiar* msg_tellfamiliar
bind msgm - *what's~my~familiar* msg_tellfamiliar
bind msgm - *my~gender~is* msg_setgender
bind msgm - *what~is~my~gender* msg_tellgender
bind msgm - *what's~my~gender* msg_tellgender
bind msgm - *my~greeting~is* msg_setgreeting
bind msgm - *What's~my~greeting* msg_tellgreeting
bind msgm - *What~is~my~greeting* msg_tellgreeting
bind msgm - *my~hello~is* msg_sethello
bind msgm - *what~is~my~hello* msg_tellhello
bind msgm - *what's~my~hello* msg_tellhello
bind msgm - *my~location~id~is* msg_setLOCATIONID
bind msgm - *what~is~my~location~id* msg_tellLOCATIONID
bind msgm - *what's~my~location~id* msg_tellLOCATIONID
bind msgm - *my~smoking~preference~is* msg_setsmoker
bind msgm - *what~is~my~smoking~status* msg_tellsmoker
bind msgm - *what's~my~smoking~status* msg_tellsmoker
bind msgm - *my~tagline~is* msg_settagline
bind msgm - *what~is~my~tagline* msg_settagline
bind msgm - *what's~my~tagline* msg_settagline
bind msgm - *my~zip~code~is* msg_setZIPCODE
bind msgm - *what~is~my~zip~code* msg_tellZIPCODE
bind msgm - *what's~my~zip~code* msg_tellZIPCODE

#help.tcl
bind msgm - *ehelp* msg_help 


#####
##### DCC Binds
#####

#XTRAS.tcl
bind dcc - smoker dcc_setsmoker
bind dcc m chsmoker dcc_chsmoker
bind dcc - tagline dcc_settagline
bind dcc m chtagline dcc_chtagline


#####
##### Public Binds
#####

#Mike-Callahan-3.0.tcl
bind pubm - "% Thanks~again,~$trigger*" pub_thanks
bind pubm - "% $trigger,~hug*" pub_hug
bind pubm - "% $trigger,~keys*" pub_unhandcuff
bind pubm - "% $trigger,~hose*" pub_hose
bind pubm - "% $trigger,~hook*" pub_hook
bind pubm - "% $trigger,~tape*" pub_tape
bind pubm - "% $trigger,~who~*" give_tagline
bind pubm - "% $trigger,~soapbox*" pub_soapbox
bind pubm - "% $trigger,~when*" pub_time_generator
bind pubm - "% $trigger,~how~long*" pub_time_generator
bind pubm - "% $trigger,~round*" pub_round
bind pubm - "% *crash*" pub_crash
bind pubm - "% $trigger,~reset*" pub_crash_reset
bind pubm - "% $trigger,~who's~at~the~line*" pub_line_persona
#bind pubm - "% Callahan,~*" pub_informal
bind pubm - "% $trigger,~give*" pub_give
bind pubm - "% $trigger,~gimme*" pub_give
bind pubm - "% $trigger,~get*" pub_give
bind pubm - "% $trigger,~rules" pub_faq
bind pubm - "% $trigger,~faq" pub_faq
bind pubm - "% $trigger,~I'll~have~some*" pub_menu
bind pubm - "% $trigger,~I'll~take~some*" pub_menu
bind pubm - "% $trigger,~I'll~take~one*" pub_menu
bind pubm - "% $trigger,~I'll~have~one*" pub_menu
bind pubm - "% $trigger,~I'll~ahve~some*" pub_menu
bind pubm - "% $trigger,~I'll~ahve~one*" pub_menu
bind pubm - "% $trigger,~bless*" pub_bless
bind pubm - "% re,~$trigger" pub_re-entry
bind pubm - "% re~$trigger" pub_re-entry
bind pubm - "% $trigger,~desert*" pub_sahara
bind pubm - "% $trigger,~version*" pub_version
bind pubm - "% $trigger,~go~long*" pub_long
bind pubm - "% $trigger,~shoot*" pub_shoot
bind pubm - "% $trigger,~channel~c90*" pub_useless
bind pubm - "% $trigger,~wiki" pub_wiki

# Booze proc has been moved to consunables, so this is no longer needed. WSB 8-2009
#booze2.tcl
#bind pubm - "% $trigger,~booze*" pub_booze


#consumables.tcl
bind pubm - "% $trigger,~appetizer*" pub_appetizer 
bind pubm - "% $trigger,~booze*" pub_booze
bind pubm - "% $trigger,~breakfast" pub_breakfast
bind pubm - "% $trigger,~brunch*" pub_brunch
bind pubm - "% $trigger,~dessert*" pub_dessert
bind pubm - "% $trigger,~dinner*" pub_dinner
bind pubm - "% $trigger,~supper*" pub_dinner
bind pubm - "% $trigger,~lunch*" pub_lunch
bind pubm - "% $trigger,~snack*" pub_snack
bind pubm - "% $trigger,~tea*" pub_tea
bind pubm - "% $trigger,~beer*" pub_beer
#Proc pub_beer rewritten to allow for nicks other then 'me', this bind is no longer needed. WSB 8-2009
#bind pubm - "% $trigger,~beer~me" pub_beer
bind pubm - "% $trigger,~get~a~beer*" pub_other_beer
bind pubm - "% $trigger,~give~a~beer*" pub_other_beer
bind pubm - "% $trigger,~unusual*" pub_unusual
bind pubm - "% $trigger,~give*unusual*" pub_other_unusual
bind pubm - "% $trigger,~get*unusual*" pub_other_unusual
bind pubm - "% $trigger,~deposit*" pub_queso
bind pubm - "% $trigger,~withdraw*" pub_queso
bind pubm - "% $trigger,~list~vault*" pub_queso

#convert1.0.tcl
bind pubm - "% $trigger,~convert*" rud:pub:convert 

#directory.tcl
bind pubm - "% $trigger,~directory*" pub_directory 

#egt-formating.tcl
bind pubm - "% $trigger,~go~for~it*" pub_one-off 

#help.tcl
bind pubm - "% $trigger,~help*" pub_help_msg 
bind pubm - "% $trigger,~help*" pub_help

#lottery.0.1-alpha.tcl
bind pubm - "% $trigger,~lottery*" pub_lottery 

#cnn.tcl
bind pubm - "% $trigger,~CNN*" pub_cnn
bind pubm - "% $trigger,~bluefrog*" pub_cnn
bind pubm - "% $trigger,~redfrog*" pub_cnn
bind pubm - "% $trigger,~emofrog*" pub_cnn

#wiki.tcl
bind pubm - "% $trigger,~wiki*" pub_wikipedia

#news-0.10.tcl
bind pubm - "% $trigger,~news" pub_random_news 
bind pubm - "% $trigger,~news~about~me" pub_random_news_self
bind pubm - "% $trigger,~news~about*" pub_random_news_other

#patron_quote.tcl
bind pubm - "% $trigger,~quote*" pub_patron_quotes 
bind pubm - "% $trigger,~count*" pub_quotes_count

#quote_lists.tcl
bind pubm - "% $trigger,~useless*" pub_useless 
bind pubm - "% $trigger,~channel~c-90*" pub_useless
bind pubm - "% $trigger,~channel~c90*" pub_useless
bind pubm - "% $trigger,~choco*" pub_chocolate
bind pubm - "% $trigger,~play~something*" pub_music 
bind pubm - "% $trigger,~fortune*" pub_fortune 
bind pubm - "% $trigger,~give*fortune*" pub_other_fortune
bind pubm - "% $trigger,~get*fortune*" pub_other_fortune
bind pubm - "% *in~bed*" pub_bed
bind pubm - "% $trigger,~button*" pub_button 
bind pubm - "% $trigger,~give*button*" pub_other_button
bind pubm - "% $trigger,~get*button*" pub_other_button
bind pubm - "% $trigger,~random*" pub_random
bind pubm - "% $trigger,~chacha*" pub_chacha
bind pubm - "% $trigger,~amore*" pub_amore 
bind pubm - "% $trigger,~bofh*" pub_bofh
bind pubm - "% $trigger,~breakfastclub*" pub_breakfastclub
bind pubm - "% $trigger,~chalkboard*" pub_chalkboard
bind pubm - "% $trigger,~clerks*" pub_clerks
bind pubm - "% $trigger,~dubya*" pub_dubya
bind pubm - "% $trigger,~family~guy" pub_fg
bind pubm - "% $trigger,~futurama" pub_futurama
bind pubm - "% $trigger,~snatch" pub_snatch
bind pubm - "% $trigger,~talladega" pub_talladega
bind pubm - "% $trigger,~ricky" pub_talladega
bind pubm - "% $trigger,~baked" pub_baked
bind pubm - "% $trigger,~laz*" pub_lazarus
bind pubm - "% $trigger,~quayle" pub_quayle
bind pubm - "% $trigger,~kosh" pub_kosh
bind pubm - "% $trigger,~b5" pub_babylon5
bind pubm - "% $trigger,~babylon~5" pub_babylon5
bind pubm - "% $trigger,~matrix*" pub_matrix
bind pubm - "% $trigger,~quote*" pub_patron_quotes
bind pubm - "% $trigger,~count~quotes*" pub_quotes_count
bind pubm - "% $trigger,~topic*" pub_patron_topic
bind pubm - "% $trigger,~pinky*" pub_pinky
bind pubm - "% $trigger,~shit*" pub_shit
bind pubm - "% $trigger,~brain*" pub_pinky
bind pubm - "% $trigger,~south*" pub_south
bind pubm - "% $trigger,~billy" pub_billy
bind pubm - "% $trigger,~blazing" pub_blazing
bind pubm - "% $trigger,~blues" pub_blues
bind pubm - "% $trigger,~dogs" pub_dogs
bind pubm - "% $trigger,~full" pub_full
bind pubm - "% $trigger,~good" pub_good
bind pubm - "% $trigger,~shorty" pub_shorty
#bind pubm - "% $trigger,~happy" pub_happy
bind pubm - "% $trigger,~pulp" pub_pulp
bind pubm - "% $trigger,~scarface" pub_scarface
bind pubm - "% $trigger,~scream" pub_scream
bind pubm - "% $trigger,~snowcrash*" pub_snowcrash
bind pubm - "% $trigger,~holmes*" pub_holmes
bind pubm - "% $trigger,~ghost*" pub_ghost
bind pubm - "% $trigger,~real" pub_realgenius
bind pubm - "% $trigger,~groove" pub_groove
bind pubm - "% $trigger,~genius" pub_realgenius
bind pubm - "% $trigger,~realgenius" pub_realgenius
bind pubm - "% $trigger,~princess" pub_princess
bind pubm - "% $trigger,~office" pub_office
bind pubm - "% $trigger,~horrible" pub_horrible
bind pubm - "% $trigger,~firefly" pub_firefly
bind pubm - "% $trigger,~spaceballs" pub_spaceballs
bind pubm - "% $trigger,~red" pub_redvsblue
#bind pubm - "% $trigger,~outlaws" pub_outlaws
bind pubm - "% $trigger,~voltaire" pub_voltaire
bind pubm - "% $trigger,~texts" pub_texts_from_last_night
bind pubm - "% What's~the~number~at~the" pub_texts_number
bind pubm - "% What's~the~number~for" pub_texts_number
bind pubm - "% $trigger,~will*" pub_crystal_ball
bind pubm - "% $trigger,~would*" pub_crystal_ball
bind pubm - "% $trigger,~should*" pub_crystal_ball
bind pubm - "% $trigger,~shall*" pub_crystal_ball
bind pubm - "% $trigger,~could*" pub_crystal_ball
bind pubm - "% $trigger,~can*" pub_crystal_ball
bind pubm - "% $trigger,~may*" pub_crystal_ball
bind pubm - "% $trigger,~is*" pub_crystal_ball
bind pubm - "% $trigger,~are*" pub_crystal_ball

#twitter.tcl
bind pubm - "% $trigger,~twitter*" pub_twitter
bind pubm - "% $trigger,~tweet*" pub_twitter

#thanks.tcl
bind pubm - "% Shokran,~$trigger*"                      pub_thanks_Arabic 
bind pubm - "% Terima~kasih~banyak-banyak,~$trigger*"   pub_thanks_Bahasa_M
bind pubm - "% Terima~kasih~banyak,~$trigger*"          pub_thanks_Bahasa_I
bind pubm - "% Terima~kasih,~$trigger*"                 pub_thanks_Bahasa
bind pubm - "% Dekuji~vam,~$trigger*"                   pub_thanks_Czech
bind pubm - "% Dêkuji~vam,~$trigger*"                   pub_thanks_Czech
bind pubm - "% Dêkuji~vám,~$trigger*"                   pub_thanks_Czech
bind pubm - "% Dekuji~vám,~$trigger*"                   pub_thanks_Czech
bind pubm - "% De^kuji~vám,~$trigger*"                  pub_thanks_Czech
bind pubm - "% De^kuji~vam,~$trigger*"                  pub_thanks_Czech
bind pubm - "% Takk,~$trigger*"                         pub_thanks_Icelandic
bind pubm - "% Tak,~$trigger*"                          pub_thanks_Danish
bind pubm - "% Thank~you,~$trigger*"                    pub_thanks_English
bind pubm - "% Thanks,~$trigger*"                       pub_thanks_English
bind pubm - "% Dankon,~$trigger*"                       pub_thanks_Esperanto
bind pubm - "% Tänan,~$trigger*"                        pub_thanks_Estonian
bind pubm - "% Tanan,~$trigger*"                        pub_thanks_Estonian
bind pubm - "% Kiitos,~$trigger*"                       pub_thanks_Finnish
bind pubm - "% Merci,~$trigger*"                        pub_thanks_French
bind pubm - "% Tankewol,~$trigger*"                     pub_thanks_Frisian
bind pubm - "% Go~raibh~maith~agat,~$trigger*"          pub_thanks_Gælic
bind pubm - "% Danke,~$trigger*"                        pub_thanks_German
bind pubm - "% Mahalo,~$trigger*"                       pub_thanks_Hawaiian
bind pubm - "% Toda,~$trigger*"                         pub_thanks_Hebrew
bind pubm - "% Köszönöm,~$trigger*"                     pub_thanks_Hungarian
bind pubm - "% Koszonom,~$trigger*"                     pub_thanks_Hungarian
bind pubm - "% Grazie,~$trigger*"                       pub_thanks_Italian
bind pubm - "% Domo~arigato,~$trigger*"                 pub_thanks_Japanese
bind pubm - "% Arigato,~$trigger*"                      pub_thanks_Japanese
bind pubm - "% Kamsahamnida,~$trigger*"                 pub_thanks_Korean
bind pubm - "% Kam-sa-ham-ni-da,~$trigger*"             pub_thanks_Korean2
bind pubm - "% Gam~sa~ham~ni~da,~$trigger*"             pub_thanks_Korean
bind pubm - "% Mesi,~$trigger*"                         pub_thanks_Carib_Creole
bind pubm - "% Mèsi,~$trigger*"                         pub_thanks_Carib_Creole
bind pubm - "% Dziekuje,~$trigger*"                     pub_thanks_Polish
bind pubm - "% Dzie,~kuje,*$trigger*"                   pub_thanks_Polish
bind pubm - "% Obrigado,~$trigger*"                     pub_thanks_Portugese
bind pubm - "% Spasibo,~$trigger*"                      pub_thanks_Russian
bind pubm - "% Gracias,~$trigger*"                      pub_thanks_Spanish
bind pubm - "% Mucho~Gracias,~$trigger*"                pub_thanks_Spanish
bind pubm - "% Muchas~Gracias,~$trigger*"               pub_thanks_Spanish
bind pubm - "% Tack,~$trigger*"                         pub_thanks_Swedish
bind pubm - "% Salamat,~$trigger*"                      pub_thanks_Tagalog
bind pubm - "% Diolch,~$trigger*"                       pub_thanks_Welsh
bind pubm - "% A~dank~aych,~$trigger*"                  pub_thanks_Yiddish
bind pubm - "% Hvala,~$trigger*"                        pub_thanks_Yugoslav

#unusual.tcl


#URLcatcher.tcl
bind pubm - "% http://*" public_url_extracter

#weather-0.2.tcl
bind pubm - "% $trigger,~weather*" pub_weather 

#XTRAS.tcl
bind pubm - "% $trigger,~who~am~I*" give_tagline 
bind pubm - "% $trigger,~my~usual*" serve_usual
bind pubm - "% $trigger,~usual" serve_usual_ambig
bind pubm - "% $trigger,~get*their~usual*" serve_usual_other
bind pubm - "% $trigger,~give*their~usual*" serve_usual_other
bind pubm - "% $trigger,~get*her~usual*" serve_usual_other
bind pubm - "% $trigger,~get*his~usual*" serve_usual_other
bind pubm - "% $trigger,~give*her~usual*" serve_usual_other
bind pubm - "% $trigger,~give*his~usual*" serve_usual_other
bind pubm - "% $trigger,~give*my~usual*" serve_usual_self_to_other
bind pubm - "% $trigger,~get*my~usual*" serve_usual_self_to_other
#bind pubm - "% $trigger,~get*'s~usual*" serve_usual_other_to_other
#bind pubm - "% $trigger,~give*'s~usual*" serve_usual_other_to_other
bind pubm - "% $trigger,~get~me*'s~usual*" serve_usual_other_to_self
bind pubm - "% $trigger,~give~me*'s~usual*" serve_usual_other_to_self
bind pubm - "% $trigger,~get~me*s'~usual*" serve_usual_other_to_self
