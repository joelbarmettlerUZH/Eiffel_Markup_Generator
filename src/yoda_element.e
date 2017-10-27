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
			require
				element_not_void: element /= void
			do
				--validation through the yoda_element and
				--the specific validation_function predicate is done, boolean gets returned
			ensure

			end


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			require else
				render_obj_not_void: render_obj /= void
				--no nesting check yet

			deferred
			ensure then
				validation_languages_not_empty: not validation_languages.is_empty
			end

	invariant
		placeholder: True
		validation_languages_list_instantiated: validation_languages /= void
end
