note
	description: "Deferred Yoda Element."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	YODA_ELEMENT

	feature {ANY}
		name: STRING

	feature {ANY}
		validation_langauges: ARRAY[VALIDATOR]
			--The validation commander iterates validates a provided element with the corresponding validation_function for all validation_languages
			local
				languages_array: ARRAY[VALIDATOR]
			do
				create languages_array.make_empty
				languages_array.force (create {HTML_VALIDATOR}, languages_array.count)
				Result := languages_array
			ensure
				result_not_void: attached Result
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- deferred function that allows all elements to get visited by a Renderer
			deferred
			end

		as_string(nesting: INTEGER): STRING
			require
				valid_nesting: nesting >= 0
			do
				Result := spaces("-", nesting) + name + "%N"
			end


		spaces(repeat_str: STRING; n: INTEGER): STRING
			local
				i: INTEGER
				str: STRING
			do
				str := ""
				from
					i := 1
				until
					i > n
				loop
					str := str + repeat_str
					i := i + 1
				end
				Result := str
			end


end
