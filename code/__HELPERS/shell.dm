//Runs the command in the system's shell, returns a list of (error code, stdout, stderr)

#define SHELLEO_NAME "data/shelleo."
#define SHELLEO_ERR ".err"
#define SHELLEO_OUT ".out"

///world/proc/shelleo(command)	// CELADON DISABLE
// CELADON ADD START
#define SHELLEO_COMMAND_PLAYSOUND "sound"
#define SHELLEO_COMMAND_MASTER "master"
#define SHELLEO_COMMAND_DMSTART "dmstart"
#define SHELLEO_COMMAND_DMSTOPMSWINDOWS "dmendwind"
#define SHELLEO_COMMAND_DMSTOPUNIX "dmenduni"

/world/proc/contains_safe_shell_chars(text)
	var/static/list/unsafe_chars = list(";", "&", "|", "$", "`", "<", ">", "\\", "'", "\"", "\n", ascii2text(13), "%", ascii2text(0))
	for(var/char in unsafe_chars)
		if(findtext(text, char))
			return FALSE
	return TRUE

/proc/shell_url_scrub(url)
	if(!url)
		return
	var/static/regex/url_regex = regex(@"^https?://\[a-zA-Z0-9\-\._~:/\?#\[\]@!&'()*+,;=%\]+$")
	if(!url_regex.Find(url))
		return
	var/static/list/bad_chars = list("\"", "'", "$", "`", "\\", "\n", ascii2text(13))
	for(var/char in bad_chars)
		if(findtext(url, char))
			return
	if(world.system_type == MS_WINDOWS)
		if(findtext(url, "%"))
			return
	return url

/world/proc/shelleo(command_type, var1)
	if(IsAdminAdvancedProcCall())
		message_admins("[key_name_admin(usr)] tried to run shelleo command")
		alert_to_permissions_elevation_attempt(usr)
		return
	var/command
	switch(command_type)
		if(SHELLEO_COMMAND_PLAYSOUND)
			var/ytdl = CONFIG_GET(string/invoke_youtubedl)
			if(!ytdl)
				return
			var/var1_processed = shell_url_scrub(var1)
			if(!var1_processed)
				return
			command = "[ytdl] --geo-bypass --format \"bestaudio\[ext=mp3]/best\[ext=mp4]\[height <= 360]/bestaudio\[ext=m4a]/bestaudio\[ext=aac]\" --dump-single-json --no-playlist -- \"[var1_processed]\""
		if(SHELLEO_COMMAND_MASTER)
			if(!(world.system_type == MS_WINDOWS && CONFIG_GET(flag/toast_notification_on_init) && !length(GLOB.clients)))
				return
			if(!contains_safe_shell_chars(world.name))
				return
			command = "start /min powershell -ExecutionPolicy Bypass -File tools/initToast/initToast.ps1 -name \"[world.name]\" -icon %CD%\\icons\\ui_icons\\common\\tg_16.png -port [world.port]"
		if(SHELLEO_COMMAND_DMSTART)
			var/daemon = CONFIG_GET(string/db_daemon)
			if(!daemon)
				return
			if(!contains_safe_shell_chars(daemon))
				return
			command = "echo \"Starting ezdb daemon, do not close this window\" && \"[daemon]\""
		if(SHELLEO_COMMAND_DMSTOPMSWINDOWS)
			var/daemon = CONFIG_GET(string/db_daemon)
			if(!daemon)
				return
			if(!contains_safe_shell_chars(daemon))
				return
			command = "Get-Process | ? { $_.Path -eq '[daemon]' } | Stop-Process"
		if(SHELLEO_COMMAND_DMSTOPUNIX)
			var/daemon = CONFIG_GET(string/db_daemon)
			if(!daemon)
				return
			if(!contains_safe_shell_chars(daemon))
				return
			command = "kill $(pgrep -f '[daemon]')"
		else
			message_admins("An unknown command type attempted to be activated by the shelleo command!")
			return
// CELADON ADD END
	var/static/list/shelleo_ids = list()
	var/stdout = ""
	var/stderr = ""
	var/errorcode = 1
	var/shelleo_id
	var/out_file = ""
	var/err_file = ""
	var/static/list/interpreters = list("[MS_WINDOWS]" = "cmd /c", "[UNIX]" = "sh -c")
	var/interpreter = interpreters["[world.system_type]"]
	if(interpreter)
		for(var/seo_id in shelleo_ids)
			if(!shelleo_ids[seo_id])
				shelleo_ids[seo_id] = TRUE
				shelleo_id = "[seo_id]"
				break
		if(!shelleo_id)
			shelleo_id = "[shelleo_ids.len + 1]"
			shelleo_ids += shelleo_id
			shelleo_ids[shelleo_id] = TRUE
		out_file = "[SHELLEO_NAME][shelleo_id][SHELLEO_OUT]"
		err_file = "[SHELLEO_NAME][shelleo_id][SHELLEO_ERR]"
		if(world.system_type == UNIX)
			errorcode = shell("[interpreter] \"[replacetext(command, "\"", "\\\"")]\" > [out_file] 2> [err_file]")
		else
			errorcode = shell("[interpreter] \"[command]\" > [out_file] 2> [err_file]")
		if(fexists(out_file))
			stdout = file2text(out_file)
			fdel(out_file)
		if(fexists(err_file))
			stderr = file2text(err_file)
			fdel(err_file)
		shelleo_ids[shelleo_id] = FALSE
	else
		CRASH("Operating System: [world.system_type] not supported") // If you encounter this error, you are encouraged to update this proc with support for the new operating system
	. = list(errorcode, stdout, stderr)
#undef SHELLEO_NAME
#undef SHELLEO_ERR
#undef SHELLEO_OUT
/*	// CELADON REMOVE START
/proc/shell_url_scrub(url)
	var/static/regex/bad_chars_regex = regex("\[^#%&./:=?\\w]*", "g")
	var/scrubbed_url = ""
	var/bad_match = ""
	var/last_good = 1
	var/bad_chars = 1
	do
		bad_chars = bad_chars_regex.Find(url)
		scrubbed_url += copytext(url, last_good, bad_chars)
		if(bad_chars)
			bad_match = url_encode(bad_chars_regex.match)
			scrubbed_url += bad_match
			last_good = bad_chars + length(bad_chars_regex.match)
	while(bad_chars)
	. = scrubbed_url
*/	// CELADON REMOVE END
