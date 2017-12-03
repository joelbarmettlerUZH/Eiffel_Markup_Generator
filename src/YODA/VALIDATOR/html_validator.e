note
	description: "Concrete validator that validates the concrete elements in terms of the constraints given by html."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	HTML_VALIDATOR

	inherit
		VALIDATOR

	feature {YODA_ELEMENT, EQA_TEST_SET}
		validate_text(element: YODA_TEXT): BOOLEAN
			--validates a YODA_TEXT whether it's content is conforming with the HTML text rules. Returns True if so, raise exceptions otherwise
			do
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
			do
				--No HTML specific requirements
				--return True when no exception occured allong the way
				Result := True
			end


		validate_image(element: YODA_IMAGE): BOOLEAN
			--validates a YODA_IMAGE of a extern image, whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			do
				--No HTML specific requirements
				--return True when no exception occured allong the way
				Result := True
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--validates a YODA_SNIPPET whether it's content is conforming with the HTML text rules. Returns True if so, raise exception otherwise
			do
				Result := True
			end

		validate_anchor(element: YODA_ANCHOR): BOOLEAN
			--validates a YODA_ANCHOR
			do
				--Nothing to be done. HTML has no hard constraints on anchors since it's only an empty element.
				Result := True
			end

end
