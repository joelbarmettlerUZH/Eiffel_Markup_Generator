note
	description: "Summary description for {YODA_ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	YODA_ELEMENT

	feature {NONE}
		validation_languages: LINKED_LIST[VALIDATOR]

	feature {ANY}
		validate(element: YODA_ELEMENT; validation_function: PREDICATE[VALIDATOR,YODA_ELEMENT]): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_ELEMENT render to renderer.
			require else
				renderer_exists: renderer /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end


	invariant
		placeholder: True

end
