note
	description: "Deferred validator for each concrete element."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	VALIDATOR

--shared features are deferred
	feature
		validate_image(element: YODA_IMAGE): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end

		validate_extern_image(element: YODA_IMAGE): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end

		validate_link(element: YODA_LINK): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_intern_link(element: YODA_LINK): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_email(element: YODA_LINK): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_table(element: YODA_TABLE): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--Deferred validate function. Has no other purpose than ensuring this function is shared between all its children.
			deferred
			end

end
