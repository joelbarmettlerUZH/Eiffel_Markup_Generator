note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

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
--empty_array: ARRAY2[YODA_ELEMENT]
elements_of_list: ARRAY[YODA_ELEMENT]
table1: YODA_TABLE

	on_prepare
			-- <Precursor>
		do
			create factory
			create firstString.make("yoda")
			create secondString.make("vader")

--			syntax because "" empty -> precon can not be tested because eiffel already does this in its functions already: use factory in precon_function_trigger(agent factory.text(""), "u_content_not_empty")
--			create empty_array.make_filled (factory.text("d"), 6, 3)
--			create empty_array.make_filled ("", 6, 3)
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
			assert ("test table with parameter array", equal(equal(
			equal(table1.name, "table"),
			equal(table1.content, text_array)),
			equal(attached {YODA_TABLE} table1 , True)))

			--check precon in {YODA}.table #test table with parameter empty array
			--precon_function_trigger(agent test_factory("",3,4), "u_content_is_empty")

			obiwan := factory.table (text_array)
			--check through factoy {YODA}.table
			assert ("test table with parameter array", equal(equal(
			equal(obiwan.name, "table"),
			equal(obiwan.content, text_array)),
			equal(attached {YODA_TABLE} obiwan , True)))
		end



--	test_factory(s:STRING; x:INTEGER; y:INTEGER):ARRAY2[YODA_ELEMENT]
--		local
--			array: ARRAY2[YODA_ELEMENT]
--		do
--			Result := array.make_filled (s, x, y)
--		end
end


