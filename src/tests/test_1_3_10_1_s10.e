note
	description: "[
		Each YODA-Element shall offer the functionality of being rendered, meaning to be outputted as a proper
		string-based representation in the chosen output language.
		Whenever a certain nested element composition is not directly supported by the chosen output language,
		YODA shall render the element composition in an alternative, acceptable way.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "2.22 Percent"

class
	TEST_1_3_10_1_S10

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text1: YODA_TEXT
	array1: ARRAY[YODA_ELEMENT]
	list1: YODA_LIST
	list2: YODA_LIST
	text2: YODA_TEXT
	link1: YODA_LINK
	array2: ARRAY[YODA_ELEMENT]
	list3: YODA_LIST
	array3: ARRAY[YODA_ELEMENT]
	list4: YODA_LIST
	array4: ARRAY[YODA_ELEMENT]
	list5: YODA_LIST
	array5: ARRAY[YODA_ELEMENT]
	list6: YODA_LIST
	renderer: HTML_RENDERER


	on_prepare
			-- <Precursor>
		do
			create text1.make("Force 1")
			array1 := <<text1>>
			create list1.make(array1, False)
			create list2.make(array1, True)
			create text2.make("Force 2")
			create link1.make_external(text2, "http://www.yoda.ch")
			array2 := <<link1>>
			create list3.make(array2, False)
			array3 := <<list1>>
			create list4.make(array3, True)
			array4 := <<text2, text2>>
			create list5.make(array4, False)
			array5 := <<text1, text1>>
			array5[2] := link1
			create list6.make(array5, False)
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s10
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_list", "covers/{YODA_LIST}.render"
		do
			assert("A unordered list correctly creates <ul> tags and, in between, renders the Text elements surrounded with <li> tags. The individual list element tags as well as the content is nested and therefore intended correctly.",
				equal(list1.render (renderer, 0), "<ul>%N%T<li>%N%T%TForce 1%N%T</li>%N</ul>%N"))
			assert("The HTML list renderer correctly removes eventual paragraph tags from the list-contents to allow list-specific styling.",
				equal(list1.render (renderer, 0), "<ul>%N%T<li>%N%T%TForce 1%N%T</li>%N</ul>%N"))
			assert("A ordered list correctly creates <ol> tags and, in between, renders the Text elements surrounded with <li> tags.",
				equal(list2.render (renderer, 0), "<ol>%N%T<li>%N%T%TForce 1%N%T</li>%N</ol>%N"))
			precon_function_trigger(agent list1.render (renderer, -1), "is_valid_nesting")
			assert("Lists correctly intend nesting bigger than 0.",
				equal(list1.render (renderer, 3), "%T%T%T<ul>%N%T%T%T%T<li>%N%T%T%T%T%TForce 1%N%T%T%T%T</li>%N%T%T%T</ul>%N"))
			assert("The special composition of putting links inside of lists renders as expected.",
				equal(list3.render (renderer, 0), "<ul>%N%T<li>%N%T%T<a href='http://www.yoda.ch'>%N%T%T%TForce 2%N%T%T</a>%N%T</li>%N</ul>%N"))
			assert("The special composition of putting a list inside of a list renders as expected.",
				equal(list4.render (renderer, 0), "<ol>%N%T<li>%N%T%T<ul>%N%T%T%T<li>%N%T%T%T%TForce 1%N%T%T%T</li>%N%T%T</ul>%N%T</li>%N</ol>%N"))
			assert("A list can contain more than one element",
				equal(list5.render (renderer, 0), "<ul>%N%T<li>%N%T%TForce 2%N%T</li>%N%T<li>%N%T%TForce 2%N%T</li>%N</ul>%N"))
		end

end


