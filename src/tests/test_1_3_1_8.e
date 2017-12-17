note
	description: "[
		Tests creation title decorator with name, strength and component in factory and also with make.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	testing:  "covers/{TEXT_DECORATOR_TITLE}.make_style_with_attribute", "covers/{YODA}.title",
			          "covers/{YODA}.text"
	coverage: "3.3 Percent"

class
	TEST_1_3_1_8

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	yoda1: YODA_TEXT
	factory: YODA
	jedi1: TEXT_DECORATOR_TITLE

	on_prepare
			-- <Precursor>
		do
			create yoda1.make("When nine hundred years old you reach, look as good you will not.")
			create factory
			create jedi1.make_style_with_attribute(yoda1,2)

		end

feature -- Test routines

	test_1_3_1_8
			-- New test routine
		note
			testing:  "covers/{TEXT_DECORATOR_BOLD}.make_style", "covers/{TEXT_DECORATOR}.make_style",
			          "covers/{YODA}.text", "covers/{YODA}.bold"
		local
			obiwan : YODA_TEXT_INTERFACE
		do
			obiwan := factory.title (yoda1,3)

			assert ("test of title text", attached {YODA_TEXT_INTERFACE} jedi1.component)
			assert ("test of title text name", equal(jedi1.name, "title"))
			assert ("test of title text strength",equal(jedi1.strength, 2))

			precon_function_trigger(agent factory.title (yoda1,0), "u_attribute_not_to_small")
			precon_function_trigger(agent factory.title (yoda1,7), "u_attribute_not_to_bigl")


			assert ("test of title factory with text factory concatenated attached", attached {YODA_TEXT_INTERFACE} obiwan)
			assert ("test of title factory with text factory concatenated name", equal(obiwan.name, "title"))
			assert ("test of title factory with text factory concatenated", attached {YODA_TEXT} yoda1)
		end
end


