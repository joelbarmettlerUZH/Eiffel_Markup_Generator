note
	description: "[
		Tests creation of table.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "4.2 Percent"

class
	TEST_1_3_7_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	factory: YODA
	firstString: YODA_TEXT
	secondString: YODA_TEXT
	text_array: ARRAY2[YODA_ELEMENT]
	elements_of_list: ARRAY[YODA_ELEMENT]
	table1: YODA_TABLE

	on_prepare
			-- <Precursor>
		do
			create factory
			create firstString.make("yoda")
			create secondString.make("vader")

			elements_of_list := <<factory.text("First Entry"),factory.text("Second Entry"), factory.text("Third Entry")>>
			create text_array.make_filled (factory.text("Entry"), 5, 3)
			text_array[5,1] := factory.image ("resources/yoda.gif")
			text_array[5,2] := factory.numbered_list (elements_of_list)
			text_array[5,3] := factory.list (elements_of_list)

			create table1.make(text_array)
		end

feature -- Test routines

	TEST_1_3_7_1
			-- New test routine
		note
			testing:  "covers/{YODA_TABLE}.make", "covers/{HTML_VALIDATOR}.validate_table", "covers/{YODA}.table"
		local
			obiwan : YODA_TABLE
		do
			--check table1.make(text_array)
			assert ("test table with parameter array", equal(table1.name, "table"))
			assert ("test table table1.content", equal(table1.content, text_array))
			assert ("test table attached table1", attached {YODA_TABLE} table1)

			obiwan := factory.table (text_array)
			--check through factoy {YODA}.table
			assert ("test table with parameter array", equal(obiwan.content, text_array))
			assert ("test table obiwan.name", equal(obiwan.name, "table"))
			assert ("test table attached obiwan", attached {YODA_TABLE} obiwan)
		end
end


