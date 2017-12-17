note
	description: "[
		Tests creation list with numbered list and bulletpoint list.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "5.9 Percent"

class
	TEST_1_3_6_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	factory: YODA
	firstString: YODA_TEXT
	secondString: YODA_TEXT

	text_array: ARRAY[YODA_ELEMENT]
	empty_array: ARRAY[YODA_ELEMENT]
	list1: YODA_LIST
	list2: YODA_LIST


	on_prepare
			-- <Precursor>
		do
			create factory
			create firstString.make("yoda")
			create secondString.make("vader")

			text_array := <<firstString, secondString>>
			empty_array := <<>>

			create list1.make(text_array,True)
			create list2.make(text_array,False)
		end

feature -- Test routines

	TEST_1_3_6_1
			-- New test routine
		note
			testing:  "covers/{HTML_VALIDATOR}.validate_list", "covers/{YODA_LIST}.make", "covers/{YODA}.numbered_list", "covers/{YODA}.list", "covers/{YODA}.bulletpoint_list"
		local
			obiwan1: YODA_LIST
			obiwan2: YODA_LIST
		do
			--check list1.make(text_array, True)
			assert ("test list with parameter array and True", equal(list1.name, "list"))
			assert ("test list list1.content.count", equal(list1.content.count, 2))
			assert ("test list attached list1", attached {YODA_LIST} list1)
			assert ("test list list1.is_ordered", list1.is_ordered)

			--check list2.make(text_array, False)
			assert ("test list with parameter array and True", equal(list2.content.count, 2))
			assert ("test list list2.name", equal(list2.name, "list"))
			assert ("test list attached list2", attached {YODA_LIST} list2)
			assert ("test list list2.is_ordered should be false", equal(list2.is_ordered, False))

			--check precon in {YODA}.list
			precon_function_trigger(agent factory.list (empty_array), "array_not_empty")

			--check through factoy {YODA}.list with is ordered false
			obiwan1 := factory.list (text_array)
			assert ("test list with factory", equal(text_array.count, 2))
			assert ("test list with factory obiwan1.nae", equal(obiwan1.name, "list"))
			assert ("test list with attached obiwan1", attached {YODA_LIST} obiwan1)
			assert ("test list with obiwan1.is_ordered should be false", equal(obiwan1.is_ordered, False))

			--check through factoy {YODA}.list with is ordered true
			obiwan2 := factory.numbered_list (text_array)
			assert ("test of list with factory and parameter array and True", equal(text_array.count, 2))
			assert ("test of list with factory obiwan2.name", equal(obiwan2.name, "list"))
			assert ("test of list with factory text_array.count should be 2", equal(text_array.count, 2))
			assert ("test of list with factory attached obiwan2", attached {YODA_LIST} obiwan2)
			assert ("test list with obiwan2.is_ordered should be true", equal(obiwan2.is_ordered, True))

			--check precon in {YODA}.
			precon_function_trigger(agent factory.numbered_list(empty_array),"array_not_empty")
		end
end


