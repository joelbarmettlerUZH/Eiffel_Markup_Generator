note
	description: "Deferred Yoda Element."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	YODA_ELEMENT

	feature {NONE}
		validation_languages: LINKED_LIST[VALIDATOR]

	feature {ANY}
		validate(element: YODA_ELEMENT; validation_function: PREDICATE[VALIDATOR,YODA_ELEMENT]): BOOLEAN
			--some fancy comments
			require
				element_not_void: element /= void
			do
				--validation through the yoda_element and
				--the specific validation_function predicate is done, boolean gets returned
			ensure
			--some fancy comments
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_ELEMENT render to renderer.
			deferred
			end

	invariant
		validation_languages_list_instantiated: validation_languages /= void
end
