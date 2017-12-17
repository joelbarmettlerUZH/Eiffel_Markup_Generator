note
	description: "[
		For each YODA-Project, the client shall be able to print out all names 
		of the YODA-Documents contained in the YODA-Project to the console.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0.56 Percent"

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
			Jedi.print_to_console
			assert("Not implemented yet, won't be implemented for first release",True)
		end

end


