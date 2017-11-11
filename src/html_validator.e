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

		exc: EXCEPTIONS
			local
				e: EXCEPTIONS
			do
				create e
				Result := e
			end

		prohibited_text_sub_strings: ARRAY[STRING]
			--The validate_element function iterates over these sub_stings and removes them from the string
			local
				prohibited_sub_strings_array: ARRAY[STRING]
			do
				prohibited_sub_strings_array := << "<pre>", "</pre>" >>
				Result := prohibited_sub_strings_array
			ensure
				result_not_void: attached Result
			end


		prohibited_snippet_sub_strings: ARRAY[STRING]
			--The validate_element function iterates over these sub_stings and removes them from the string
			local
				prohibited_sub_strings_array: ARRAY[STRING]
			do
				prohibited_sub_strings_array := << "<html>", "</html>", "<body>", "</body>" >>
				Result := prohibited_sub_strings_array
			ensure
				result_not_void: attached Result
			end


		remove_probibited_sub_strings(content: STRING; prohibited_sub_strings: ARRAY[STRING])
			require
				prohibited_sub_strings_not_empty: attached prohibited_sub_strings
				content_not_empty: attached content
			local
				string_position: INTEGER
				string_length: INTEGER
			do
					-- check if the text does contain any prohibited sub-strings
				across prohibited_sub_strings as prohib
					-- loop over all prohibited sub-strings
				loop
					from
					until
							-- as long as the prohibited tag is part of the text-string
						not content.has_substring(prohib.item)
					loop
							-- remove the sub-string (the prohibited tag)
						string_position := content.substring_index(prohib.item,1)
						string_length := prohib.item.count
						content.remove_substring(string_position,string_position+string_length-1)
					end
				end
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--validates a YODA_TEXT whether it's content is conforming with the HTML text rules. Returns True if so
			require else
				element_not_empty: attached element
			local
				prohibited_strings: ARRAY[STRING]
			do
					-- Create Array with prohibited sub-strings for Text-Element
				prohibited_strings := prohibited_text_sub_strings
					-- remove prohibited sub-strings
				remove_probibited_sub_strings(element.content, prohibited_strings)
				-- openting/closing tags for {{b}} etc. after opening first closing before next opening
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

--I commented this out because it leads to trouble, not all link has a "www" in front of
--				if -- check if link contains "www."
--					not element.url.has_substring("www.")
--				then -- if not raise exception
--					 raise exception
--					exc.raise("Validation Error 101 - Invaild URL/Link")
--				end
				if -- check if link contains "https://" or "http://"
					not (element.url.has_substring("https://") or element.url.has_substring("http://"))
				then -- if not prepend "https://"
					element.url.prepend("http://")
				end


				--check whether the link is external
				--if it does, see whether it corresponds to a RegEx of a valid Link
				--	element.content <-> "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
				--if it does, add http:// to make it (when not already there), else raie an exception
				--  element.content <-> "^[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
				--	element.content.prepend ("https://")
				--if it does, add http:// to make it (when not already there), else raie an exception
				--check whether the link is internal
				--if it does, check whether the provided file has a valid name (does not contain any points, like file.one etc.
				--if not, raise an exception
				--check whether link is e-mail
				--if it is, check whether it matches RegEx of a valid E-Mail
				--if it does not, raise an exception
				--return True when no exception occured allong the way
				Result := True
			ensure then
				returnes_true: Result = True
			end

		validate_intern_link(element: YODA_LINK): BOOLEAN
			--validates a YODA_LINK whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do
				Result := True
			ensure then
				returnes_true: Result = True
			end

		validate_email(element: YODA_LINK): BOOLEAN
			--validates a YODA_LINK whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			do
				Result := True
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
				Result := True
			ensure then
				returnes_true: Result = True
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--validates a YODA_SNIPPET whether it's content is conforming with the HTML text rules. Returns True if so, False otherwise
			require else
				element_not_empty: attached element
			local
				prohibited_strings: ARRAY[STRING]
			do
					-- Create Array with prohibited sub-strings for Text-Element
				prohibited_strings := prohibited_snippet_sub_strings
					-- remove prohibited sub-strings
				remove_probibited_sub_strings(element.content, prohibited_strings)
				Result := True
			ensure then
				returnes_true: Result = True
			end

end
