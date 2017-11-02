note
	description: "Concrete validator that validates the concrete elements in terms of the constraints given by html."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	HTML_VALIDATOR

	inherit
		VALIDATOR

	feature {ANY}
		prohibited_sub_strings: ARRAY[STRING]
			--The validate_element function iterates over these sub_stings and removes them from the string
			local
				prohibited_sub_strings_array: ARRAY[STRING]
			do
				prohibited_sub_strings_array := << "</pre>", "{{b}}", "{{u}}", "{{i}}" >>
				Result := prohibited_sub_strings_array
			ensure
				result_not_void: attached Result
			end

	feature {ANY}
		validate_text(element: YODA_TEXT): BOOLEAN
			--validates a YODA_TEXT whether it's content is conforming with the HTML text rules. Returns True if so
			require else
				element_not_empty: attached element
			local
				prohibited_strings: ARRAY[STRING]
				string_position: INTEGER
				string_length: INTEGER
			do
					-- Create Array with prohibited sub-strings
				prohibited_strings := prohibited_sub_strings
					-- check if the text does contain any closing preventing-tags or own tags ({{b}} that would mess up our structure.
				across prohibited_strings as prohib
					-- loop over all prohibited tags
				loop
					from
					until
							-- as long as the prohibited tag is part of the text-string
						not element.content.has_substring(prohib.item)
					loop
							-- remove the sub-string (the prohibited tag)
						string_position := element.content.substring_index(prohib.item,0)
						string_length := prohib.item.count
						element.content.remove_substring(string_position,string_position+string_length)
					end
				end
					--return True when no exception occured allong the way
				Result := True

			ensure then
				returnes_true: Result = True
			end


		validate_table(element: YODA_TABLE): BOOLEAN
				--validates a YODA_TABLE whether it's content is conforming with the HTML text rules. Returns True if so
			require else
				element_not_empty: attached element
			do
				--check if all table entries are of valid type
					-- checked already in YODA_TABLE since HTML allowes all elements as entries
				--check if table has at least one entries
					-- checked already in YODA_TABLE				
				--raise acception otherwise
				--return True when no exception occured allong the way
				Result := True
			ensure then
				returnes_true: Result = True
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--validates a YODA_LIST whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do
				--check if all table entries are of valid type
					-- checked already in YODA_LIST since HTML allowes all elements as entries
				--check if list has at least one entries
					-- checked already in YODA_TLIST
				--raise acception otherwise
				--return True when no exception occured allong the way
				Result := True
			ensure then
				returnes_true: Result = True
			end


		validate_link(element: YODA_LINK): BOOLEAN
			--validates a YODA_LINK whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do

				if  --check whether the link is external
					element.is_internal = False
				then
					if --if it does, see whether it corresponds to a RegEx of a valid Link
						--match(element.content, "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$") = True
						True
					then
						if --if it does, add http:// to make it (when not already there), else raie an exception
							--match(element.content, "^[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$") = True
							True
						then
							--element.content.prepend ("https://")
						end
					else
						-- raise exception
					end
				end



				--if it does, add http:// to make it (when not already there), else raie an exception
				--check whether the link is internal
				--if it does, check whether the provided file has a valid name (does not contain any points, like file.one etc.
				--if not, raise an exception
				--check whether link is e-mail
				--if it is, check whether it matches RegEx of a valid E-Mail
				--if it does not, raise an exception
				--return True when no exception occured allong the way
			ensure then
				returnes_true: Result = True
			end


		validate_image(element: YODA_IMAGE): BOOLEAN
			--validates a YODA_IMAGE whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do
				--check whether the image is a valid link on the internet via RegEx
				--If it is not, raise an exception
				--check whether the image is local
				--check whether the local image is on a relatively defined path
				--if it is not, raise an exception
				--return True when no exception occured allong the way
			ensure then
				returnes_true: Result = True
			end

		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--validates a YODA_SNIPPET whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do
				--check whether snippet contains tags like </HTML> or </body> that would lead to messed up output
				--if so, throw an exception
				--return True when no exception occured allong the way
			ensure then
				returnes_true: Result = True
			end

end
