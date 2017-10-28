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
			--The validation commander iterates validates a provided element with the corresponding validation_function for all validation_languages
			require
				element_not_void: attached element
			local
				is_valid: BOOLEAN
			do
				--Create the array validation_langauges with instances of all supported output-langauges
				--create a is_valid boolean, set to True
				--iterate thorugh the array
				--for each array, call the provided validation function and pass the element as its argument
				--the returned value is now either True or False, update is_valid via is_valid AND Result
				--return is_valid
			ensure
				return_is_valid: Result = is_valid implies Result = True
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- deferred function that allows all elements to get visited by a Renderer
			deferred
			end

	invariant
		validation_languages_list_instantiated: attached validation_languages
end
