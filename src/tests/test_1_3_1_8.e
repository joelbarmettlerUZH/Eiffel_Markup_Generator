note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	testing:  "covers/{TEXT_DECORATOR_TITLE}.make_style_with_attribute", "covers/{YODA}.title",
			          "covers/{YODA}.text"

class
	TEST_1_3_1_8

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	--features for Subtest 1
	yoda1: YODA_TEXT
	--yoda2: YODA_TEXT_INTERFACE
	--yoda3: YODA_TEXT
	factory: YODA
	jedi1: TEXT_DECORATOR_TITLE
	--jedi2: TEXT_DECORATOR_TITLE
	--jedi3: TEXT_DECORATOR_TITLE


	on_prepare
			-- <Precursor>
		do
			create yoda1.make("When nine hundred years old you reach, look as good you will not.")
			--create yoda2.make("<b>Truly wonderful, the mind of a child is.</b>")
			--create yoda3.make(" ")
			create factory
			create jedi1.make_style_with_attribute(yoda1,2)
			--create jedi2.make_style_with_attribute(yoda2,0)
			--create jedi3.make_style_with_attribute(yoda3,7)
		end

feature -- Test routines

	test_1_3_1_8
			-- New test routine
		note
			testing:  "covers/{TEXT_DECORATOR_BOLD}.make_style", "covers/{TEXT_DECORATOR}.make_style",
			          "covers/{YODA}.text", "covers/{YODA}.bold"
		local
			--obiwan : YODA_TEXT_INTERFACE
		do
			--obiwan := factory.title (yoda1,3)

			assert("test of title text", equal(equal(equal(attached {YODA_TEXT_INTERFACE} jedi1.component, True),equal(jedi1.name, "title")),equal(jedi1.strength, 2)))


			precon_function_trigger(agent factory.title (yoda1,0), "u_attribute_not_to_small")
			precon_function_trigger(agent factory.title (yoda1,7), "u_attribute_not_to_bigl")
			--#needs fix, title expects (YODA_TEXT_INTERFACE, INTEGER)
			--precon_function_Trigger(agent factory.title (jedi1, 2), "text_not_empty")

			--assert("test precon attribute to small of title text", equal())



			--precon_function_trigger(agent factory.text(""), "text_not_empty")


		end
end
