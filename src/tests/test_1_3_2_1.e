note
	description: "[
		Tests creation code snippet from file with making a file in some directory and opening this file afterwards and finally closing it.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "see code snippet from string (there is the summed up coverage)"

class
	TEST_1_3_2_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	snip1: YODA_SNIPPET
	yoda_1_content: STRING --das was im file ist
	factory: YODA

	on_prepare
			-- <Precursor>
		local
			yoda_1: RAW_FILE
		do
			create factory
			create yoda_1.make_with_name ("./resources/snippet.txt")
			assert("Local snippet snippet.txt exists", yoda_1.exists)
			create yoda_1.make_open_read ("./resources/snippet.txt")
			yoda_1.read_stream (yoda_1.count)
			yoda_1_content := yoda_1.last_string
			yoda_1.close
			create snip1.make_file("./resources/snippet.txt")
		end


feature -- Test routines

	TEST_1_3_2_1
			-- New test routine
		note
			testing:  "covers/{YODA_SNIPPET}.make_file", "covers/{YODA}.snippet_from_file",
			          "covers/{HTML_VALIDATOR}.validate_snippet"
		do
			assert ("test snippet from file with parameter resources/snippet.txt", equal(snip1.name,"snippet"))
			assert ("test snippet from file content is > 0", equal(snip1.content.count > 0 ,True))
			assert ("test snippet from file is attached", attached {YODA_SNIPPET} snip1)
			assert ("test snippet from file is equal to given string", equal(snip1.content,"<h4>You can go back now :) </h4>")and equal (snip1.content, yoda_1_content))

			precon_function_trigger(agent factory.snippet_from_file(""), "string_not_empty")
			precon_function_trigger(agent factory.snippet_from_file("BIG SHAQQ, THE ONE AND ONLY, SKIAAA"), "file_is_valid")
		end

end
