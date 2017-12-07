note
	description: "[
		The client shall have the freedom to add YODA-Elements 
		to an arbitrary number of YODA-Document instances.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "1.95 Percent"

class
	TEST_1_2_3_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Light_Side: YODA_DOCUMENT
	Dark_Side: YODA_DOCUMENT
	Cookie_Side: YODA_DOCUMENT
	Luke: YODA_TEXT


	on_prepare
			-- <Precursor>
		do
			create Light_Side.make("Light_Side")
			create Dark_Side.make("Dark_Side")
			create Cookie_Side.make("Cookie_Side")
			create Luke.make("I won't fail you. I'm not afraid.")
		end

feature -- Test routines

	test_1_2_3_1
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.add_element"
		do
			Light_Side.add_element(Luke)
			assert("Add Element to a Document",equal(Light_Side.elements.count , 1))
			Dark_Side.add_element(Luke)
			assert("Add Element to two Documents",equal(Dark_Side.elements.count , 1))
			Cookie_Side.add_element(Luke)
			assert("Add Element to three Documents",equal(Cookie_Side.elements.count , 1))
		end

end


