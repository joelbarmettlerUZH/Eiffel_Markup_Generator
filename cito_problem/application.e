note
	description: "cito application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS

create
	make

feature {NONE}

	make
		local
			a: A
		do
			--When I create an instance of A and call f("ARGUMENT1: "), everything works fine
			create a
			print(a.f("ARGUMENT1: ")+"%N")
			--Now I'm passing an agent of a.f to some_function, this workes fine as well
			print (some_function_1(agent a.f(?)) +"%N")
			--But next, I'd like to be more general and not just pass a.f to the function, but the function f of "some" instance of type ABC...
			print ("Returned value: "+some_function_2(agent {ABC}.f(?) ))
		end

	some_function_1(function_f: FUNCTION[TUPLE[STRING], STRING]): STRING
		do
			Result := function_f.item(["ARGUMENT2: "])
		end

	some_function_2(function_f: FUNCTION[TUPLE[STRING], STRING]): STRING
		--...receive the agent function_f here
		local
			a: A
		do
			--again create an instance of A
			create a
			--and then call function_f representing f on the instance a. But this does not work :/
			Result := a.function_f.item(["PASS"])
		end

end
