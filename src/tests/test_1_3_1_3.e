note
	description: "[
		Tests creation bold decorator which basically tests also the test 1.3.1.2 and 1.3.1.3 but also 1.3.1.4, 1.3.1.5, 1.3.1.6 and 1.3.1.7
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.25 Percent"

class
	TEST_1_3_1_3

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
	jedi1: TEXT_DECORATOR_BOLD
	jedi2: TEXT_DECORATOR_BOLD

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

	test_1_3_1_3
			-- New test routine
		note
			testing:  "covers/{TEXT_DECORATOR_BOLD}.make_style", "covers/{TEXT_DECORATOR}.make_style",
			          "covers/{YODA}.text", "covers/{YODA}.bold"
		local
			obiwan : YODA_TEXT_INTERFACE
		do
			obiwan := factory.bold (yoda1)

			assert ("test of bold text", equal(jedi1.component, yoda1))
			assert ("test of bold text name", equal(jedi1.name, "style"))
			assert ("test of bold text with some string with tags in it", equal(equal(jedi2.component, yoda2),equal(jedi2.name, "style")))

			precon_function_trigger(agent factory.text(""), "text_not_empty")
			assert("test of bold text with factory and parameter String1", equal(attached {YODA_TEXT_INTERFACE} obiwan, equal(obiwan.name, "style")))
		end
end
