/proc/kick_check(message, mob/user)
	if(message && user)
		var/thatword1 = jointext(list("n", "i", "g", "g", "er"), "")
		var/thatword2 = jointext(list("n", "i", "g", "g", "a"), "")
		var/thatword3 = jointext(list("n", "i", "g", "g", "e", "rs"), "")
		if(findtext(message, "vc") || findtext(message, "vcs") || findtext(message, "fdp") || findtext(message, "vsf") || findtext(message, "vtnc") || findtext(message, "pnc") ||\
		findtext(message, "tmnc") || findtext(message, "antag") || findtext(message, "bruh") || findtext(message, "owo") || findtext(message, "uwu") || findtext(message, thatword1) ||\
		findtext(message, thatword2) || findtext(message, thatword3) || findtext(message, "pq"))
			var/client/C = user.client
			log_access("AUTO KICKED/IC FILTER: [key_name(C)]")
			to_chat(C, "<span class='userdanger'>You have been automatically kicked from the server! That message contained a word prohibited in IC chat! Consider reviewing the server rules.</span><br><span class='danger'>You may reconnect via the button in the file menu or by <b><u><a href='byond://winset?command=.reconnect'>clicking here to reconnect</a></u></b>.</span>")
			winset(C, null, "command=.update_ping+[world.time+world.tick_lag*TICK_USAGE_REAL/100]")
			QDEL_IN(C, 1)
			return TRUE
	return FALSE
