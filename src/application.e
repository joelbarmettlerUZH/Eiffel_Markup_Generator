note
	description: "YODA application root class"
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	APPLICATION

	inherit
		ARGUMENTS

	create
		make

	feature {ANY}
		yoda: YODA

	feature {NONE} -- Initialization

		make
				-- Run application.
			do
				--| Add your code here
				create yoda
				print(yoda.text("Hallo").render (create {HTML_RENDERER}, 0))
				print ("Hello Eiffel World!%N")

			end

end
