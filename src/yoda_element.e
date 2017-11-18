note
	description: "Deferred Yoda Element acts as parent class for all YODA_* classes."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

deferred class
	YODA_ELEMENT

	feature {ANY}
		name: STRING

	feature {ANY}

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


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--deferred function that allows all elements to get visited by a Renderer
			deferred
			end

		as_string(nesting: INTEGER): STRING
			--Adds amount of nesting and concatenates the strings with a new line at the end.
			require
				nesting_not_void: attached nesting
				valid_nesting: nesting >= 0
			do
				Result := spaces("-", nesting) + name + "%N"
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


end
