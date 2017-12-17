note
	description: "[
		The client shall be able to create an arbitrary number of YODA-Document instances. 
		All YODA-Document instances shall be completely independent from each other.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0 Percent (covered in Test FR #1.2.1.1)"

class
	TEST_1_2_2_1

inherit
	TEST_INTERFACE

feature -- Test routines

	test_1_2_2_1
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.make"
		local
			Doc1: YODA_DOCUMENT
			Doc2: YODA_DOCUMENT
			Doc3: YODA_DOCUMENT
		do
			create Doc1.make ("Feel")
			assert("First Document Name set",equal(Doc1.name, "Feel"))
			assert("First Document Count set",equal(Doc1.elements.count, 0))
			create Doc2.make ("The")
			assert("Second Document Name set",equal(Doc2.name, "The"))
			assert("Second Document Count set",equal(Doc2.elements.count, 0))
			create Doc3.make ("Force")
			assert("Third Document Name set",equal(Doc3.name, "Force"))
			assert("Third Document Count set",equal(Doc3.elements.count, 0))
		end

end


