note
	description: "[
		For a created YODA-Document, the client shall have the ability to add it 
		to an arbitrary number of YODA-Project instances.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0.56 Percent"

class
	TEST_1_1_4_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Light_Side: YODA_PROJECT
	Dark_Side: YODA_PROJECT
	Cookie_Side: YODA_PROJECT
	Luke: YODA_DOCUMENT


	on_prepare
			-- <Precursor>
		do
			create Light_Side.make("Light_Side")
			create Dark_Side.make("Dark_Side")
			create Cookie_Side.make("Cookie_Side")
			create Luke.make("Luke")
		end

feature -- Test routines

	test_1_1_4_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.add_document"
		do
			Light_Side.add_document(Luke)
			assert("Add Element to a Document",equal(Light_Side.documents.count , 1))
			Dark_Side.add_document(Luke)
			assert("Add Element to two Documents",equal(Dark_Side.documents.count , 1))
			Cookie_Side.add_document(Luke)
			assert("Add Element to three Documents",equal(Cookie_Side.documents.count , 1))
		end

end


