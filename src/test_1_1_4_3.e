note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_1_4_3

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Jedi: YODA_PROJECT
	Yoda: YODA_DOCUMENT
	Yaddle: YODA_DOCUMENT


	on_prepare
			-- <Precursor>
		do
			create Jedi.make("Jedi")
			create Yoda.make("Yoda")
			create Yaddle.make("Yaddle")
		end

feature -- Test routines

	test_1_1_4_3
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.print_to_console"
		do
			assert("no solution yet on how to read output to console",false)
		end

end


