note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_1_3_1

inherit
	TEST_INTERFACE

feature -- Test routines

	test_1_1_3_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.make"
		local
			Yoda_Quotes1: YODA_PROJECT
			Yoda_Quotes2: YODA_PROJECT
			Yoda_Quotes3: YODA_PROJECT
		do
			create Yoda_Quotes1.make ("Feel")
			assert("First Document Name set",equal(Yoda_Quotes1.name, "Feel"))
			assert("First Document Count set",equal(Yoda_Quotes1.documents.count, 0))
			create Yoda_Quotes2.make ("The")
			assert("Second Document Name set",equal(Yoda_Quotes2.name, "The"))
			assert("Second Document Count set",equal(Yoda_Quotes2.documents.count, 0))
			create Yoda_Quotes3.make ("Force")
			assert("Third Document Name set",equal(Yoda_Quotes3.name, "Force"))
			assert("Third Document Count set",equal(Yoda_Quotes3.documents.count, 0))
		end

end


