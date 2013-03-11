# Mike's Lottery Generator Script Functions
# Copyright 2006 by Brendan K Callahan <420420@gmail.com> and David Goodwin <goodwid@gmail.com>
#
# http://creativecommons.org/licenses/by-nc-sa/2.5/legalcode
# Attribution-NonCommercial-ShareAlike 2.5
#
# Problems, questions, accolades, hate mail, etc. should go to <callahan@3whack.org>.
#

putlog "@@@And tonight's winning numbers are. . .very random!@@@"


##### State Functions

proc pub_AL_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_AK_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_AR_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_AZ_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto35_5 $nick host hand chan arg;return
}

proc pub_CA_lottery {nick host hand chan arg} {
pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_CO_lottery {nick host hand chan arg} {
pub_powerball $nick host hand chan arg;pub_lotto32_5 $nick host hand chan arg;return
}

proc pub_CT_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_DC_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your district legislature about getting a lottery!(Or just getting representation in the US Senate)";return
}

proc pub_DE_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_FL_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto36_5 $nick host hand chan arg;return
}

proc pub_GA_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_HI_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_ID_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_IA_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto35_5 $nick host hand chan arg;return
}

proc pub_IL_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_IN_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto36_5 $nick host hand chan arg;return
}

proc pub_KS_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_KY_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_LA_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto40_5 $nick host hand chan arg;return
}

proc pub_MA_lottery {nick host hand chan arg} {
pub_daily4 $nick host hand chan arg;pub_lotto35_5 $nick host hand chan arg;return
}

proc pub_MD_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;return
}

proc pub_ME_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_MI_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_MO_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto44_5 $nick host hand chan arg;return
}

proc pub_MN_lottery {nick host hand chan arg} {
putlog "Arrived in MN for $nick"
pub_daily3 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto47_5 $nick host hand chan arg;return
}

proc pub_MS_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_MT_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto40_5 $nick host hand chan arg;return
}

proc pub_NC_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_ND_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_NE_lottery {nick host hand chan arg} {
	pub_daily3 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto38_5 $nick host hand chan arg;return
}

proc pub_NH_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_NJ_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto40_5 $nick host hand chan arg;return
}

proc pub_NM_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_NY_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_NV_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!  Or just go to a casino like eveyone else in Nevada.";return
}

proc pub_OH_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_OK_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_OR_lottery {nick host hand chan arg} {
pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_PA_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_RI_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_SC_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_SD_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_TN_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}

proc pub_TX_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto37_5 $nick host hand chan arg;return
}

proc pub_UT_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You expect lottery in an LDS state????";return
}

proc pub_VA_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_lotto34_5 $nick host hand chan arg;return
}

proc pub_VT_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_WA_lottery {nick host hand chan arg} {
pub_lotto39_5 $nick host hand chan arg;return
}

proc pub_WI_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;pub_lotto31_5 $nick host hand chan arg;return
}

proc pub_WV_lottery {nick host hand chan arg} {
pub_daily3 $nick host hand chan arg;pub_daily4 $nick host hand chan arg;pub_powerball $nick host hand chan arg;return
}

proc pub_WY_lottery {nick host hand chan arg} {
putserv "NOTICE $nick :You should talk to your state legislature about getting a lottery!";return
}




##### Number Generators
##### Daily 3
proc pub_daily3 {nick host hand chan arg} {
	set lucky_number [expr [rand 1000]]
	if {$lucky_number < 10} {
		set lucky_number "00$lucky_number"
		putlog "Lucky Number is . . . . . .$lucky_number"
		putserv "NOTICE $nick :Your 3 digit number is $lucky_number."
		return
	}
		if {$lucky_number < 100} {
		set lucky_number "0$lucky_number"
		putlog "Lucky Number is . . . . . .$lucky_number"
		putserv "NOTICE $nick :Your 3 digit number is $lucky_number."
		return
	}
	putlog "Lucky Number is . . . . . .$lucky_number"
	putserv "NOTICE $nick :Your 3 digit number is $lucky_number."
	return
}


##### Daily 4
proc pub_daily4 {nick host hand chan arg} {
	set lucky_number [expr [rand 10000]]
	if {$lucky_number < 10} {
		set lucky_number "000$lucky_number"
		putserv "NOTICE $nick :Your 4 digit number is $lucky_number."
		return
	}
		if {$lucky_number < 100} {
		set lucky_number "00$lucky_number"
		putserv "NOTICE $nick :Your 4 digit number is $lucky_number."
		return
	}
	
		if {$lucky_number < 1000} {
		set lucky_number "0$lucky_number"
		putserv "NOTICE $nick :Your 4 digit number is $lucky_number."
		return
	}
	
	putserv "NOTICE $nick :Your 4 digit number is $lucky_number."
	return
}

#####Powerball
proc pub_powerball {nick host hand chan arg} {
	set lotto1 [expr [rand 55]+1]
	
	set lotto2 [expr [rand 55]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 55]+1]
		}
	}
	
	set lotto3 [expr [rand 55]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 55]+1]
		}
	}
	
	set lotto4 [expr [rand 55]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 55]+1]
		}
	}
	
	set lotto5 [expr [rand 55]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 55]+1]
		}
	}
	set powerball [expr [rand 42]+1]
	putserv "NOTICE $nick :Your Powerball numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5, and your Powerball is $powerball."
	return
}

##### Lotto 31 numbers, 5 picks	
proc pub_lotto31_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 31]+1]
	
	set lotto2 [expr [rand 31]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 31]+1]
		}
	}
	
	set lotto3 [expr [rand 31]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 31]+1]
		}
	}
	
	set lotto4 [expr [rand 31]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 31]+1]
		}
	}
	
	set lotto5 [expr [rand 31]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 31]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 32 numbers, 5 picks	
proc pub_lotto32_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 32]+1]
	
	set lotto2 [expr [rand 32]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 32]+1]
		}
	}
	
	set lotto3 [expr [rand 32]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 32]+1]
		}
	}
	
	set lotto4 [expr [rand 32]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 32]+1]
		}
	}
	
	set lotto5 [expr [rand 32]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 32]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 34 numbers, 5 picks	
proc pub_lotto34_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 34]+1]
	
	set lotto2 [expr [rand 34]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 34]+1]
		}
	}
	
	set lotto3 [expr [rand 34]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 34]+1]
		}
	}
	
	set lotto4 [expr [rand 34]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 34]+1]
		}
	}
	
	set lotto5 [expr [rand 34]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 34]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 35 numbers, 5 picks	
proc pub_lotto35_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 35]+1]
	
	set lotto2 [expr [rand 35]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 35]+1]
		}
	}
	
	set lotto3 [expr [rand 35]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 35]+1]
		}
	}
	
	set lotto4 [expr [rand 35]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 35]+1]
		}
	}
	
	set lotto5 [expr [rand 35]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 35]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 36 numbers, 5 picks	
proc pub_lotto36_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 36]+1]
	
	set lotto2 [expr [rand 36]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 36]+1]
		}
	}
	
	set lotto3 [expr [rand 36]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 36]+1]
		}
	}
	
	set lotto4 [expr [rand 36]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 36]+1]
		}
	}
	
	set lotto5 [expr [rand 36]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 36]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 37 numbers, 5 picks	
proc pub_lotto37_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 37]+1]
	
	set lotto2 [expr [rand 37]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 37]+1]
		}
	}
	
	set lotto3 [expr [rand 37]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 37]+1]
		}
	}
	
	set lotto4 [expr [rand 37]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 37]+1]
		}
	}
	
	set lotto5 [expr [rand 37]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 37]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 38 numbers, 5 picks	
proc pub_lotto38_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 38]+1]
	
	set lotto2 [expr [rand 38]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 38]+1]
		}
	}
	
	set lotto3 [expr [rand 38]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 38]+1]
		}
	}
	
	set lotto4 [expr [rand 38]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 38]+1]
		}
	}
	
	set lotto5 [expr [rand 38]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 38]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 39 numbers, 5 picks	
proc pub_lotto39_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 39]+1]
	
	set lotto2 [expr [rand 39]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 39]+1]
		}
	}
	
	set lotto3 [expr [rand 39]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 39]+1]
		}
	}
	
	set lotto4 [expr [rand 39]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 39]+1]
		}
	}
	
	set lotto5 [expr [rand 39]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 39]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 40 numbers, 5 picks	
proc pub_lotto40_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 40]+1]
	
	set lotto2 [expr [rand 40]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 40]+1]
		}
	}
	
	set lotto3 [expr [rand 40]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 40]+1]
		}
	}
	
	set lotto4 [expr [rand 40]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 40]+1]
		}
	}
	
	set lotto5 [expr [rand 40]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 40]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 44 numbers, 5 picks	
proc pub_lotto44_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 44]+1]
	
	set lotto2 [expr [rand 44]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 44]+1]
		}
	}
	
	set lotto3 [expr [rand 44]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 44]+1]
		}
	}
	
	set lotto4 [expr [rand 44]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 44]+1]
		}
	}
	
	set lotto5 [expr [rand 44]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 44]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}


##### Lotto 47 numbers, 5 picks	
proc pub_lotto47_5 {nick host hand chan arg} {
	set lotto1 [expr [rand 47]+1]
	
	set lotto2 [expr [rand 47]+1]
	if {$lotto2 == $lotto1} {
		while {$lotto2 == $lotto1} {
			set lotto2 [expr [rand 47]+1]
		}
	}
	
	set lotto3 [expr [rand 47]+1]
	if {$lotto3 == $lotto1 || $lotto3 == $lotto2} {
		while {$lotto3 == $lotto2 || $lotto3 == $lotto1} {
			set lotto3 [expr [rand 47]+1]
		}
	}
	
	set lotto4 [expr [rand 47]+1]
	if {$lotto4 == $lotto1 || $lotto4 == $lotto2 || $lotto4 == $lotto3} {
		while {$lotto4 == $lotto2 || $lotto4 == $lotto1 || $lotto4 == $lotto3} {
			set lotto4 [expr [rand 47]+1]
		}
	}
	
	set lotto5 [expr [rand 47]+1]
	if {$lotto5 == $lotto1 || $lotto5 == $lotto2 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
		while {$lotto5 == $lotto2 || $lotto5 == $lotto1 || $lotto5 == $lotto3 || $lotto5 == $lotto4} {
			set lotto5 [expr [rand 47]+1]
		}
	}
	
	putserv "NOTICE $nick :Your Lotto numbers are $lotto1 $lotto2 $lotto3 $lotto4 $lotto5."
	return
}
	
		
##### Determine state from Zip Code
proc find_state {nick host hand chan arg} {
	putlog "##### Reached find_state"
	upvar #0 zipcode zipcode_local
if {$zipcode_local >= 0 && $zipcode_local <= 99} {
	putserv "NOTICE $nick :Sorry, offer not availible in all areas, This Zip Code is not in use."
	return
}
if {$zipcode_local >= 100 && $zipcode_local <= 599} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, This Zip Code is outside of the USA"; return}
if {$zipcode_local >= 600 && $zipcode_local <= 999} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, such as Puerto Rico and the Virgin Islands."; return}

if {$zipcode_local >= 1000 && $zipcode_local <= 2799} {pub_MA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 2800 && $zipcode_local <= 2999} {pub_CT_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 3000 && $zipcode_local <= 3899} {pub_VT_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 3900 && $zipcode_local <= 4999} {pub_ME_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 5000 && $zipcode_local <= 5999} {pub_NH_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 6000 && $zipcode_local <= 6999} {pub_CT_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 7000 && $zipcode_local <= 8999} {pub_NJ_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 9000 && $zipcode_local <= 9999} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, since Armed Forces Europe does not have a lottery."; return}

if {$zipcode_local >= 10000 && $zipcode_local <= 14999} {pub_NY_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 15000 && $zipcode_local <= 19699} {pub_PA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 19700 && $zipcode_local <= 19999} {pub_DE_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 20000 && $zipcode_local <= 20599} {pub_DC_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 20600 && $zipcode_local <= 21999} {pub_MD_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 22000 && $zipcode_local <= 24699} {pub_VA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 24700 && $zipcode_local <= 26999} {pub_WV_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 27000 && $zipcode_local <= 28999} {pub_NC_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 29000 && $zipcode_local <= 29999} {pub_SC_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 30000 && $zipcode_local <= 31999} {pub_GA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 32000 && $zipcode_local <= 33999} {pub_FL_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 34000 && $zipcode_local <= 34099} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, since Armed Forces Africa does not have a lottery."; return}
if {$zipcode_local >= 34100 && $zipcode_local <= 34999} {pub_FL_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 35000 && $zipcode_local <= 36999} {pub_AL_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 38000 && $zipcode_local <= 38599} {pub_TN_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 38600 && $zipcode_local <= 39999} {pub_MS_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 40000 && $zipcode_local <= 42999} {pub_KY_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 43000 && $zipcode_local <= 45999} {pub_OH_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 46000 && $zipcode_local <= 47999} {pub_IN_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 48000 && $zipcode_local <= 49999} {pub_MI_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 50000 && $zipcode_local <= 52999} {pub_IA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 53000 && $zipcode_local <= 54999} {pub_WI_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 55000 && $zipcode_local <= 56799} {pub_MN_lottery $nick host hand chan arg;	return}
if {$zipcode_local >= 56800 && $zipcode_local <= 56999} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, this Zip Code is not in use."; return}
if {$zipcode_local >= 57000 && $zipcode_local <= 57999} {pub_SD_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 58000 && $zipcode_local <= 58999} {pub_ND_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 59000 && $zipcode_local <= 59999} {pub_MT_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 60000 && $zipcode_local <= 62999} {pub_IL_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 63000 && $zipcode_local <= 65999} {pub_MO_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 66000 && $zipcode_local <= 67999} {pub_KS_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 68000 && $zipcode_local <= 69999} {pub_NE_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 70000 && $zipcode_local <= 71599} {pub_LA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 71600 && $zipcode_local <= 72999} {pub_AR_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 73000 && $zipcode_local <= 74999} {pub_OK_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 75000 && $zipcode_local <= 79999} {pub_TX_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 80000 && $zipcode_local <= 81999} {pub_CO_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 82000 && $zipcode_local <= 83199} {pub_WY_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 83200 && $zipcode_local <= 83999} {pub_ID_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 84000 && $zipcode_local <= 84999} {pub_UT_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 85000 && $zipcode_local <= 86999} {pub_AZ_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 87000 && $zipcode_local <= 88499} {pub_NM_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 88900 && $zipcode_local <= 89999} {pub_NV_lottery $nick host hand chan arg; return}

if {$zipcode_local >= 90000 && $zipcode_local <= 96199} {pub_CA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 96200 && $zipcode_local <= 96699} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, since Armed Forces Pacific does not have a lottery."; return}
if {$zipcode_local >= 96700 && $zipcode_local <= 96899} {pub_HI_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 96900 && $zipcode_local <= 96999} {putserv "NOTICE $nick :Sorry, offer not availible in all areas, such as the Pacific Islands"; return}
if {$zipcode_local >= 97000 && $zipcode_local <= 97999} {pub_OR_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 98000 && $zipcode_local <= 99499} {pub_WA_lottery $nick host hand chan arg; return}
if {$zipcode_local >= 99500 && $zipcode_local <= 99999} {pub_AK_lottery $nick host hand chan arg; return}
if {$zipcode_local > 99999} {putserv "NOTICE $nick :Under current USPS regulations, zip codes of 6 or more primary digits are not in use."; return}
}