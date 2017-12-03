note
	description: "Deferred validator for each concrete element."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

deferred class
	VALIDATOR

--shared features are deferred
	feature {YODA_ELEMENT, EQA_TEST_SET}
		validate_image(element: YODA_IMAGE): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
				element_content_not_empty: attached element.content
			deferred
			ensure
				returnes_true: Result = True
			end


		validate_link(element: YODA_LINK): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require else
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end


		validate_table(element: YODA_TABLE): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end

		validate_anchor(element: YODA_ANCHOR): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			require
				element_not_empty: attached element
			deferred
			ensure
				returnes_true: Result = True
			end

end
