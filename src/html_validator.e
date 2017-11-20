note
	description: "Concrete validator that validates the concrete elements in terms of the constraints given by html."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	HTML_VALIDATOR

	inherit
		VALIDATOR

	feature {YODA_ELEMENT}

		exc: EXCEPTIONS
			--Creates a instance of exceptio
			--Needed for raising exceptions
			local
				e: EXCEPTIONS
			do
				create e
				Result := e
			end


		prohibited_text_sub_strings: ARRAY[STRING]
			--Creates list of prohibited substrings for a YODA_TEXT element.
			local
				prohibited_sub_strings_array: ARRAY[STRING]
			do
				--add prohibited substring in the following array
				prohibited_sub_strings_array := << >>
				Result := prohibited_sub_strings_array
			end


		prohibited_snippet_sub_strings: ARRAY[STRING]
			--Creates list of prohibited substrings for a YODA_SNIPPET element.
			local
				prohibited_sub_strings_array: ARRAY[STRING]
			do
				prohibited_sub_strings_array := << "<html>", "</html>", "<body>", "</body>" >>
				Result := prohibited_sub_strings_array
			end


		remove_probibited_sub_strings(content: STRING; prohibited_sub_strings: ARRAY[STRING])
			--Removes all substring of the prohibited_sub_strings array from the content.
			require
				prohibited_sub_strings_not_empty: attached prohibited_sub_strings
				content_not_empty: attached content
			local
				string_position: INTEGER
				string_length: INTEGER
			do
				across prohibited_sub_strings as prohib
					--loop over all prohibited substrings
				loop
					from
					until
						--as long as there is still a ouccurence of the prohibited substring in the string
						not content.has_substring(prohib.item)
					loop
						--remove the substring
						string_position := content.substring_index(prohib.item,1)
						string_length := prohib.item.count
						content.remove_substring(string_position,string_position+string_length-1)
					end
				end
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--validates a YODA_TEXT whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			local
				prohibited_strings: ARRAY[STRING]
			do
				--Calls function prohibited_text_sub_strings to create array of prohibited substrings.
				prohibited_strings := prohibited_text_sub_strings
				--Calls remove_probibited_sub_strings function to remove the prohibited substrings.
				remove_probibited_sub_strings(element.content, prohibited_strings)
				Result := True
			end


		validate_table(element: YODA_TABLE): BOOLEAN
				--validates a YODA_TABLE whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			do
				--The only constraints that the tables has is that the table has to contain at least one element
				--and that the elements of the table are allowed in a table
				--The make function of the YODA_TABLE arleady covers the case that the table can't be empty.
				--HTML allowes all other elements to be placed in a table which is also already checked in the
				--make function of the YODA_TABLE which only allows valid YODA_ELEMENTS as entries.

				--return True when no exception occured allong the way
				Result := True
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--validates a YODA_LIST whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			do
				--The only constraints that the list has is that the link has to contain at least one element
				--and that the elements of the table are allowed in a table
				--The make function of the YODA_LIST arleady covers the case that the list can't be empty.
				--HTML allowes all other elements to be placed in a list which is also already checked in the
				--make function of the YODA_LIST which only allows valid YODA_ELEMENTS as entries.

				--return True when no exception occured allong the way
				Result := True
			end


		validate_link(element: YODA_LINK): BOOLEAN
			--validates a YODA_LINK whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			--Checks if the url-string contains "https://" or "http://", if not prepends "http://"
			do
				--For complete validation of links/Url's it would be very good to use RegEx (regular expressions)
				--However, since we don't want other libraries to be required for the user od YODA and since RegEx is not
				--supported by the Eiffel standart libraries we are not able to user RegEX for now.
				--If at any point in the the use uf RegEx is easely available we could use checks like the following:
				--	element.content <-> "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
				--	element.content <-> "^[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"

				--Check if link contains "https://" or "http://"
				if
					not (element.url.has_substring("https://") or element.url.has_substring("http://"))
				then
				--if not prepend "https://"
					element.url.prepend("http://")
				end

				--return True when no exception occured allong the way
				Result := True
			end


		validate_intern_link(element: YODA_LINK): BOOLEAN
			--validates a intern YODA_LINK (link to a different document of the project) whether it's content is conforming with the HTML text rules.
			--Returns True if so, raise exceptions otherwise
			do
				--Only requirement for the intern Link in HTML is that the document exists
				--This is already checked in the YODA_LINK class where it only allows existing YODA_DOCUMENTs as arguments
				Result := True
			end


		validate_anchor(element: YODA_LINK): BOOLEAN
			--validates a YODA_ANCHOR whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			do
				--Nothing to be done. HTML has no hard constraints on anchors since it's only an empty element.
				Result := True
			ensure then
				returnes_true: Result = True
			end


		validate_email(element: YODA_LINK): BOOLEAN
			--validates a YODA_LINK for an email, whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			--checks is the url/emai-string contains exactly one @ and checks if there is a "." after the "@". Else raise exceptions
			local
				at_position: INTEGER
				point_position: INTEGER
			do
				-- check if link contains "@"
				if element.url.occurrences ('@')=0 then
					exc.raise("Validation Error 101 - eMail adress does not contain '@'")
				elseif element.url.occurrences ('@')>1 then
					exc.raise("Validation Error 102 - eMail adress has more than one occurence of '@'")
				else
					--check if link contains "." somewhere after the "@"
					at_position := element.url.index_of ('@', 1)
					point_position := element.url.index_of ('.', at_position)
					if point_position=0 then
						exc.raise("Validation Error 103 - eMail adress does not contain a '.xy' suffix")
					else
						Result := True
					end
				end
			end


		validate_image(element: YODA_IMAGE): BOOLEAN
			--validates a YODA_IMAGE of a local image, whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			--checks if path to the source image exists
			local
				input_file: RAW_FILE
			do
				--check whether the file acutally exists locally
				create input_file.make_with_name (element.content)
				if not input_file.exists then
					exc.raise("Validation Error 104 - image input file can not be found")
				else
					--return True when no exception occured along the way
					Result := True
				end
			end


		validate_extern_image(element: YODA_IMAGE): BOOLEAN
			--validates a YODA_IMAGE of a extern image, whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			do
				--For complete validation of links/Url's it would be very good to use RegEx (regular expressions)
				--However, since we don't want other libraries to be required for the user od YODA and since RegEx is not
				--supported by the Eiffel standart libraries we are not able to user RegEX for now.
				--If at any point in the the use uf RegEx is easely available we could use checks like the following:
				--	element.content <-> "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
				--	element.content <-> "^[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"

				--Check if link contains "https://" or "http://"
				if not (element.content.has_substring("https://") or element.content.has_substring("http://")) then
				--if not prepend "https://"
					element.content.prepend("http://")
				end

				--return True when no exception occured allong the way
				Result := True
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--validates a YODA_SNIPPET whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			--checks if there are any occurences of prohibited substrings
			local
				prohibited_strings: ARRAY[STRING]
			do
				--Calls function prohibited_text_sub_strings to create array of prohibited substrings.
				prohibited_strings := prohibited_snippet_sub_strings
				--Calls remove_probibited_sub_strings function to remove the prohibited substrings.
				remove_probibited_sub_strings(element.content, prohibited_strings)
				Result := True
			end

end
