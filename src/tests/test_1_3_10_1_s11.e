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
	coverage: "3.05 Percent"

class
	TEST_1_3_10_1_S11

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text1: YODA_TEXT
	array1: ARRAY2[YODA_ELEMENT]
	table1: YODA_TABLE
	array2: ARRAY2[YODA_ELEMENT]
	table2: YODA_TABLE
	array3: ARRAY2[YODA_ELEMENT]
	image1: YODA_IMAGE
	table3: YODA_TABLE
	array4: ARRAY2[YODA_ELEMENT]
	list1: YODA_LIST
	table4: YODA_TABLE
	renderer: HTML_RENDERER


	on_prepare
			-- <Precursor>
		do
			create text1.make("DarkSide")
			create array1.make_filled(text1, 3,3)
			create table1.make(array1)
			create array2.make_filled(text1, 2, 2)
			create table2.make(array2)
			create array3.make_filled(text1, 2, 2)
			create image1.make_external("http://www.yoda.ch/img.jpg")
			array3[2, 2] := image1
			create table3.make(array3)
			create array4.make_filled(text1, 2, 2)
			create list1.make(<<text1>>, False)
			array4[2, 2] := list1
			create table4.make(array4)
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s11
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_table", "covers/{YODA_TABLE}.render"
		do
			assert("The table is rendered with <table> tags. Every column of the table is surrounded with <tr> tags. In the first column, the individual table elements are surrounded with 'tr' tags, all the following with 'td' tags. It correctly nests the rows, columns and contained-elements. ",
				equal(table1.render (renderer, 0), "<table>%N%T<tr>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T</tr>%N%T<tr>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T</tr>%N%T<tr>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T</tr>%N</table>%N"))
			assert("Every <p> tag eventually contained in the table elements is removed to allow table specific styling.",
				equal(table2.render (renderer, 0), "<table>%N%T<tr>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T</tr>%N%T<tr>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T</tr>%N</table>%N"))
			precon_function_trigger(agent table2.render (renderer, -1), "is_valid_nesting")
			assert("The table correctly indents its rows and columns with higher nesting as well.",
				equal(table2.render (renderer, 3), "%T%T%T<table>%N%T%T%T%T<tr>%N%T%T%T%T%T<th>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</th>%N%T%T%T%T%T<th>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</th>%N%T%T%T%T</tr>%N%T%T%T%T<tr>%N%T%T%T%T%T<td>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</td>%N%T%T%T%T%T<td>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</td>%N%T%T%T%T</tr>%N%T%T%T</table>%N"))
			assert("The table can have different types of YODA_ELEMENTS as entries.",
				equal(table3.render (renderer, 0), "<table>%N%T<tr>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T%T<th>%N%T%T%TDarkSide%N%T%T</th>%N%T</tr>%N%T<tr>%N%T%T<td>%N%T%T%TDarkSide%N%T%T</td>%N%T%T<td>%N%T%T%T<img src='http://www.yoda.ch/img.jpg' alt='http://www.yoda.ch/img.jpg missing'><br>%N%T%T</td>%N%T</tr>%N</table>%N"))
			assert("The special composition of putting links inside of tables renders as expected.",
				equal(table4.render(renderer, 3), "%T%T%T<table>%N%T%T%T%T<tr>%N%T%T%T%T%T<th>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</th>%N%T%T%T%T%T<th>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</th>%N%T%T%T%T</tr>%N%T%T%T%T<tr>%N%T%T%T%T%T<td>%N%T%T%T%T%T%TDarkSide%N%T%T%T%T%T</td>%N%T%T%T%T%T<td>%N%T%T%T%T%T%T<ul>%N%T%T%T%T%T%T%T<li>%N%T%T%T%T%T%T%T%TDarkSide%N%T%T%T%T%T%T%T</li>%N%T%T%T%T%T%T</ul>%N%T%T%T%T%T</td>%N%T%T%T%T</tr>%N%T%T%T</table>%N"))
		end

end


