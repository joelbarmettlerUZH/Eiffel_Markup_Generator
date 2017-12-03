note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_TEST

inherit
	EQA_TEST_SET
		redefine
			on_prepare
		end

feature {NONE} -- Events

	on_prepare
			-- <Precursor>
		do
			assert ("not_implemented", True)
		end

feature -- Test routines

	TEST_test
			-- New test routine
		note
			testing:  "covers/{RENDERER}.spaces", "integrated", "covers/{YODA_TEXT}.render",
			          "covers/{HTML_RENDERER}.render_text"
		do
			assert ("not_implemented", True)
		end

end


