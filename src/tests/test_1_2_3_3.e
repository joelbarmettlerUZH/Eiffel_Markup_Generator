note
	description: "[
		The order of the YODA-Elements in the final Output-Document shall be the same 
		as the order in which they were added to the YODA-Document in the program code.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0 Percent (covered in Test FR #1.2.3.1)"

class
	TEST_1_2_3_3

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Doc: YODA_DOCUMENT
	Text1: YODA_TEXT
	Text2: YODA_TEXT
	Text3: YODA_TEXT


	on_prepare
			-- <Precursor>
		do
			create Text1.make("May")
			create Text2.make("the")
			create Text3.make("Force")
			create Doc.make("Doc")
		end

feature -- Test routines

	test_1_2_3_3
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.add_element"
		do
		Doc.add_element(Text1)
		Doc.add_element(Text2)
		assert("Two elements right order in array, Count correct",equal(Doc.elements.count , 2))
		assert("Two elements right order in array, First element correct",equal(Doc.elements.i_th(2), Text1))
		assert("Two elements right order in array, Second element correct",equal(Doc.elements.i_th(1) , Text2))
		Doc.add_element(Text3)
		assert("Three elements right order in array, Count correct",equal(Doc.elements.count , 3))
		assert("Three elements right order in array, First element correct",equal(Doc.elements.i_th(3) , Text1))
		assert("Three elements right order in array, Second element correct",equal(Doc.elements.i_th(2) , Text2))
		assert("Three elements right order in array, Third element correct",equal(Doc.elements.i_th(1) , Text3))
		end

end


