note
	description: "Summary description for {ABC}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	ABC

feature {ANY}
	f(str: STRING): STRING
		--just prints "execute f" and returns "Return string from f"
		deferred
		end


end
