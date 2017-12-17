note
	description: "[
		The client shall be able to create YODA-Projects that serve as a Container of related YODA-Documents and project attributes. 
		Each YODA-Project shall have a client-chosen name as an attribute.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "1.95 Percent"

class
	TEST_1_1_2_1

inherit
	TEST_INTERFACE

feature -- Test routines

	test_1_1_2_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.make", "covers/{YODA_PROJECT}.valid_name"
		local
			Yoda_Quotes: YODA_PROJECT
		do
			create Yoda_Quotes.make ("Feel_the_Force")
			assert("Create Project Name set",equal(Yoda_Quotes.name, "Feel_the_Force"))
			assert("Create Project Count set",equal(Yoda_Quotes.documents.count, 0))
			precon_function_trigger(agent test_factory(""), "name_not_empty")
			precon_function_trigger(agent test_factory("Size matters not Look at me Judge me by my size, do you Hmm Hmm And well you should not For my ally is the Force, and a powerful ally it is Life creates it, makes it grow"), "name_not_too_long")
			precon_function_trigger(agent test_factory("Yoda%" "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda~ "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda# "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda* "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda& "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda{ "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda} "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda\ "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda: "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda> "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda< "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda/ "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda+ "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda%% "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda| "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda? "), "name_valid")
			precon_function_trigger(agent test_factory("Yoda. "), "name_valid")
		end

	test_factory(s: STRING): YODA_PROJECT
		do
			Result := create {YODA_PROJECT}.make (s)
		end

end


