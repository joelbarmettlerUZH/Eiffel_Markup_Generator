note
	description: "[
		Tests creation of quote decoator.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "1.6 Percent"

class
	TEST_1_3_1_7

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	--features for Subtest 1
	yoda1: YODA_TEXT
	yoda2: YODA_TEXT
	factory: YODA
	jedi1: TEXT_DECORATOR_QUOTE
	jedi2: TEXT_DECORATOR_QUOTE

	on_prepare
			-- <Precursor>
		do
			create yoda1.make("When nine hundred years old you reach, look as good you will not.")
			create yoda2.make("<b>Truly wonderful, the mind of a child is.</b>")
			create factory
			create jedi1.make_style(yoda1)
			create jedi2.make_style(yoda2)
		end

feature -- Test routines

	test_1_3_1_7
			-- New test routine
		note
			testing:  "covers/{TEXT_DECORATOR_QUOTE}.make_style", "covers/{TEXT_DECORATOR}.make_style",
			          "covers/{YODA}.text", "covers/{YODA}.quote"
		local
			obiwan : YODA_TEXT_INTERFACE
		do
			obiwan := factory.quote (yoda1)
			assert ("test of quote text", equal(jedi1.component, yoda1))
			assert ("test of quote text name", equal(jedi1.name, "style"))
			assert ("test of quote text with some string with tags in it", equal(jedi2.component, yoda2))
			assert ("test of quote jedi2 name" ,equal(jedi2.name, "style"))

			precon_function_trigger(agent factory.text(""), "text_not_empty")
			assert ("test of quote text with factory and parameter String1", attached {YODA_TEXT_INTERFACE} obiwan)
			assert ("test of quote text with factory and parameter String1 name", equal(obiwan.name, "style"))
		end
end
