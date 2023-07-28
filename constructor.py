krakrfn = lambda key,keyname: f"~*{key}::\t\tfileappend time() \"	{keyname}	do`n\", logfile, \"UTF-8\"\n~*{key} up::\tfileappend time() \"	{keyname}	up`n\", logfile, \"UTF-8\""
pkrakrfn = lambda key,keyname: print(krakrfn(key,keyname) if key+keyname else "",end="\n"*(not not key+keyname))
