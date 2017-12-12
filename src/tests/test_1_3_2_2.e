note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_2_2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	snip1: YODA_SNIPPET

	factory: YODA


	on_prepare
			-- <Precursor>
		do
			create snip1.make_string("resources/snippet.txt") --resources/snippet.txt

			create factory

		end

feature -- Test routines

	TEST_1_3_2_2
			-- New test routine
		note
			testing:  "covers/{YODA_SNIPPET}.make_string", "covers/{YODA}.snippet_from_string"
		local
			obiwan : YODA_SNIPPET
		do
			obiwan  := factory.snippet_from_string ("resources/snippet.txt")
			assert("test snippet from file with parameter resources/snippet.txt", equal(
			equal(snip1.content, "resources/snippet.txt"),
			equal(snip1.name, "snippet")))

			--can only be tested through factory, agent somehow does not allow normal creation ?!?
			--can't test YODA_SNIPPET.make_string function (preconditon
			precon_function_trigger(agent factory.snippet_from_string(""), "string_not_empty")

			assert("obiwan is of type YODA_SNIPPET", equal(attached {YODA_SNIPPET} obiwan, True))

			assert("test of snippet with factory and resources/snippet.txt", equal(equal(
			equal(obiwan.content,"resources/snippet.txt"),
			equal(obiwan.content.count > 0, True)),
			equal(attached {YODA_SNIPPET} obiwan, True)))
		end

end


