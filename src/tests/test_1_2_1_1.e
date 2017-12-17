note
	description: "[
		The client shall be able to create new YODA-Documents, 
		which serve as a container of YODA-Elements. 
		Each YODA-Document shall have a client chosen name for identification purposes.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.89 Percent"

class
	TEST_1_2_1_1

inherit
	TEST_INTERFACE

feature -- Test routines

	test_1_2_1_1
			-- New test routine

		note
			testing:  "covers/{YODA_DOCUMENT}.valid_name", "covers/{YODA_DOCUMENT}.make"
		local
			Jedi: YODA_DOCUMENT
		do
			create Jedi.make ("Feel_the_Force")
			assert("Create Document Name set",equal(Jedi.name, "Feel_the_Force"))
			assert("Create Document Count set",equal(Jedi.elements.count, 0))
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

	test_factory(s: STRING): YODA_DOCUMENT
		do
			Result := create {YODA_DOCUMENT}.make (s)
		end

end
