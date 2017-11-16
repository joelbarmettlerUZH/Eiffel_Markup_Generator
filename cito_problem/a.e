note
	description: "Summary description for {A}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	A

inherit ABC

feature {ANY}
	f(str: STRING): STRING
		--just prints "execute f" and returns "Return string from f"
		do
			print(str)
			Result := "RESULT."
		end


end
