note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_1_4_2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Luke: YODA_DOCUMENT
	Leia: YODA_DOCUMENT
	Han: YODA_DOCUMENT
	Light_Side:YODA_PROJECT


	on_prepare
			-- <Precursor>
		do
			create Luke.make("Luke")
			create Leia.make("Leia")
			create Han.make("Han")
			create Light_Side.make("Light_Side")
		end

feature -- Test routines

	test_1_1_4_2
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.add_document"
		do
		Light_Side.add_document(Luke)
		Light_Side.add_document(Leia)
		assert("Two documents right order in array, Count correct",equal(Light_Side.documents.count , 2))
		assert("Two documents right order in array, First element correct",equal(Light_Side.documents.i_th(2), Luke))
		assert("Two documents right order in array, Second element correct",equal(Light_Side.documents.i_th(1) , Leia))
		Light_Side.add_document(Han)
		assert("Three documents right order in array, Count correct",equal(Light_Side.documents.count , 3))
		assert("Three documents right order in array, First element correct",equal(Light_Side.documents.i_th(3) , Luke))
		assert("Three documents right order in array, Second element correct",equal(Light_Side.documents.i_th(2) , Leia))
		assert("Three documents right order in array, Third element correct",equal(Light_Side.documents.i_th(1) , Han))
		end

end


