atom/proc/investigate_log(message, subject)
	if(!message || !subject)
		return
	var/F = file("[GLOB.log_directory]/[subject].html")
	F << "<small>[time_stamp()] \ref[src] ([x],[y],[z])</small> || [src] [message]<br>"


/client/proc/investigate_show( subject in list("hrefs","notes, memos, watchlist","singulo","wires","telesci", "gravity", "records", "cargo", "supermatter", "atmos", "experimentor", "botany") )
	set name = "Investigate"
	set category = "Admin"
	if(!holder)
		return
	switch(subject)
		if("notes, memos, watchlist")
			browse_messages()
		else
			var/F = file("[GLOB.log_directory]/[subject].html")
			if(!fexists(F))
				to_chat(src, "<span class='danger'>No [subject] logfile was found.</span>")
				return
			src << browse(F,"window=investigate[subject];size=800x300")