note
	description: "YODA application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

	inherit
		ARGUMENTS

	create
		make

	feature {ANY}
		test: YODA_PROJECT

	feature {NONE} -- Initialization

		make
				-- Run application.
			do
				--| Add your code here
				print ("Hello Eiffel World!%N")

			end

end
