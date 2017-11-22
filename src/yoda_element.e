note
	description: "Deferred Yoda Element acts as parent class for all YODA_* classes."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

deferred class
	YODA_ELEMENT

	feature {YODA_ELEMENT, RENDERER, VALIDATOR, TEXT_DECORATOR}
		name: STRING

	feature {NONE}




		validation_langauges: ARRAY[VALIDATOR]
			--array of validators that act as validation languages, needs to be extendet by marksdown
			--validator or other extensible markup languages
			local
				languages_array: ARRAY[VALIDATOR]
			do
				create languages_array.make_empty
				languages_array.force (create {HTML_VALIDATOR}, languages_array.count)
				Result := languages_array
			ensure
				result_not_void: attached Result
			end


		spaces(repeat_str: STRING; n: INTEGER): STRING
			--Iterates such that empty string "" gets concatenated with the string input exactly n times
			--and returns the resulted string.
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


	feature{ANY}
		is_valid_file(path_string: STRING): BOOLEAN
			local
				input_file: RAW_FILE
			do
				--check whether the file acutally exists locally
				create input_file.make_with_name (path_string)
				if not input_file.exists then
					Result := FALSE
				else
					Result := TRUE
				end
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--deferred function that allows all elements to get visited by a Renderer
			require
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			deferred
			ensure
    			result_exists: attached result
    			--content_not_changed: content.is_equal (old content)
			end


		as_string(nesting: INTEGER): STRING
			--Adds amount of nesting and concatenates the strings with a new line at the end.
			require
				nesting_not_void: attached nesting
				valid_nesting: nesting >= 0
			do
				Result := spaces("-", nesting) + name + "%N"
			end


end
