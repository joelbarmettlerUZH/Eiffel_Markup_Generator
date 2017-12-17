note
	description: "[
		Tests creation of code snippet from string.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "5.25 Percent is the summed up coverage of from file and from string snippet"

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
			create snip1.make_string("resources/snippet.txt")
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
			assert ("test snippet from file with parameter resources/snippet.txt", attached {YODA_SNIPPET} snip1)
			assert ("test snippet from file with correct parameter content", equal(snip1.content, "resources/snippet.txt"))
			assert ("test snippet from file with correct parameter name", equal(snip1.name, "snippet"))

			precon_function_trigger(agent factory.snippet_from_string(""), "string_not_empty")

			assert("obiwan is of type YODA_SNIPPET", equal(attached {YODA_SNIPPET} obiwan, True))

			assert ("test of snippet with factory and resources/snippet.txt content", equal(obiwan.content,"resources/snippet.txt"))
			assert ("test of snippet with factory and resources/snippet.txt content count", obiwan.content.count > 0)
			assert ("test of snippet with factory and resources/snippet.txt attached", equal(attached {YODA_SNIPPET} obiwan, True))
		end

end


