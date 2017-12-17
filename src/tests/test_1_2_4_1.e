note
	description: "[
		For each YODA-Document, the client shall be able to print out all names of the YODA-Elements 
		contained in the YODA-Document to the console.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0.56 Percent"

class
	TEST_1_2_4_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Doc: YODA_DOCUMENT
	Luke: YODA_TEXT
	R2D2: YODA_SNIPPET


	on_prepare
			-- <Precursor>
		do
			create Doc.make("Jedi")
			create Luke.make("I won't fail you. I'm not afraid.")
			create R2D2.make_string("<span id='1'>Bibab</span>")
		end

feature -- Test routines

	test_1_2_4_1
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.print_to_console"
		local
			--output: PLAIN_TEXT_FILE
		do
			Doc.print_to_console
			assert("Not implemented yet, won't be implemented for first release",True)
		end

end


