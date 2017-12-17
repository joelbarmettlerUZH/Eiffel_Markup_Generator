note
	description: "[
		Every YODA-Document shall offer the functionality to render itself, 
		meaning to render all its YODA-elements into the client-chosen Output-language.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "2.38 Percent"

class
	TEST_1_2_5_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Yoda_Quotes: YODA_DOCUMENT
	text1: YODA_TEXT
	text2: YODA_TEXT

	on_prepare
			-- <Precursor>
		do
			create Yoda_Quotes.make("Yoda_Quotes")
			create text1.make("You will find only what you bring in.")
			create text2.make("Better this way, it is.")
		end

feature -- Test routines

	test_1_2_5_1
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.render"
		do
			precon_function_trigger(agent Yoda_Quotes.render ("html"), "elements_not_empty")
			Yoda_quotes.add_element (text1)
			assert("render document with one element",equal(Yoda_Quotes.render ("html"), "<p>You will find only what you bring in.</p>%N"))
			Yoda_quotes.add_element (text2)
			assert("render document with two elements",equal(Yoda_Quotes.render ("html"), "<p>You will find only what you bring in.</p>%N<p>Better this way, it is.</p>%N"))
		end

end


