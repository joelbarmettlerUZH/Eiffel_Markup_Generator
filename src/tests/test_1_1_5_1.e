note
	description: "[
		The client shall have the possibility to render a YODA-Project, 
		meaning every YODA-Document and every YODA-Element, 
		to any of the supported output types. 
		All necessary output data shall be returned as a well formatted string. 
		The string should be formatted in a readable form with correct indentation.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "1.67 Percen"

class
	TEST_1_1_5_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Jedi: YODA_PROJECT
	Yoda: YODA_DOCUMENT
	Yaddle: YODA_DOCUMENT
	text1: YODA_TEXT
	text2: YODA_TEXT

	on_prepare
			-- <Precursor>
		do
			create Jedi.make("Jedi")
			create Yoda.make("Yoda")
			create Yaddle.make("Yaddle")
			create text1.make("You will find only what you bring in.")
			create text2.make("Better this way, it is.")
			Yoda.add_element(text1)
			Yaddle.add_element(text2)
		end

feature -- Test routines

	test_1_1_5_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.render", "execution/isolated"
		local
			array1: ARRAY[STRING]
		do
			precon_function_trigger(agent Jedi.render ("html"), "documents_not_empty")
			Jedi.add_document (Yoda)
			array1 := Jedi.render ("html")
			assert("render project with one document containing one element",equal(array1.item (0), "<p>You will find only what you bring in.</p>%N"))
			assert("render project with one document containing one element, array length",equal(array1.count, 1))
			Jedi.add_document (Yaddle)
			array1 := Jedi.render ("html")
			assert("render project with one document containing one element, first document",equal(array1.item (0), "<p>You will find only what you bring in.</p>%N"))
			assert("render project with two document each containing one element, second document",equal(array1.item (1), "<p>Better this way, it is.</p>%N"))
			assert("render project with two document each containing one element, array length",equal(array1.count, 2))
		end

end


