note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_1_4

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
	jedi1: TEXT_DECORATOR_ITALIC
	jedi2: TEXT_DECORATOR_ITALIC

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

	test_1_3_1_4
			-- New test routine
		note
			testing:  "covers/{YODA}.text", "covers/{TEXT_DECORATOR}.make_style", "covers/{YODA}.italic"
		local
			obiwan : YODA_TEXT_INTERFACE
		do
			obiwan := factory.italic (yoda1)
			assert("test of italic text", equal(equal(jedi1.component, yoda1), equal(jedi1.name, "style")))
			assert("test of italic text with some string with tags in it", equal(equal(jedi2.component, yoda2),equal(jedi2.name, "style")))

			--fails, see below
			--precon_function_trigger(agent test_factory(""), "u_content_not_empty")

			--instead this function will fail
			precon_function_trigger(agent factory.text(""), "text_not_empty")

			assert("test of italic text with factory and parameter String1", equal(attached {YODA_TEXT_INTERFACE} obiwan, equal(obiwan.name, "style")))
		end

--	test_factory(s: STRING):TEXT_DECORATOR_BOLD
--		local
--		--will fail here since "" text cannot be created -> precon violation of YODA_TEXT
--		--so question is how can we do that?
--			text : YODA_TEXT
--		do
--			text := factory.text (s)
--			Result := {TEXT_DECORATOR_BOLD}.make_style(text)
--		end
end
