note
	description: "Summary description for {TEST_INTERFACE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEST_INTERFACE

inherit
	EQA_TEST_SET
		rename
			default_create as eqa_factory_default_create
		select
			eqa_factory_default_create
		end
	-- Inherit from an exception manager to access information
	-- about exceptions thrown.
	EXCEPTION_MANAGER_FACTORY
		rename
			default_create as emf_default_create
		end

feature {NONE}
	is_precondition_violated: STRING
		-- Returns true, if the last exception was a precondition violation, false otherwise.
		do
			if attached {EXCEPTION} exception_manager.last_exception as e and
				then attached {PRECONDITION_VIOLATION} e.original as p then
					if attached {READABLE_STRING_GENERAL} p.description as message then
						Result := message.as_string_8
					else
						Result := ""
					end

			else
				Result := ""
			end
		end



	PRECON_FUNCTION_TRIGGER(test_routine: FUNCTION[TUPLE[],ANY]; precon_type: STRING)
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_text"
		local
			tested: BOOLEAN
		do
			if not tested then
				assert("Precondition is correctly TRIGGERED", equal(test_routine.item([]), ""))
				--assert("Negative Nesting prevented",equal(t1.render (html, -1), "<p>Hard working, you must</p>%N"))
			end
		rescue
			assert("Precondition is of correct type", equal(is_precondition_violated, precon_type))
			tested := True
			retry
		end


	PRECON_PROCEDURE_TRIGGER(test_routine: PROCEDURE[TUPLE[]]; precon_type: STRING)
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_text"
		local
			tested: BOOLEAN
		do
			if not tested then
				test_routine.call
				--assert("Negative Nesting prevented",equal(t1.render (html, -1), "<p>Hard working, you must</p>%N"))
			end
		rescue
			assert("Precondition is of correct type", equal(is_precondition_violated, precon_type))
			tested := True
			retry
		end


	sleep (nanoseconds: INTEGER_64)
		external
			"C blocking use %"eif_misc.h%""
		end

end
