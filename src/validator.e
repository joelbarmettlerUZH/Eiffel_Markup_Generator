note
	description: "Deferred validator for each concrete element."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	VALIDATOR

	feature
		validate_image(element: YODA_IMAGE): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end


		validate_link(element: YODA_LINK): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end


		validate_snippet(element: YODA_SNIPPET): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end


		validate_table(element: YODA_TABLE): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end

	invariant
		placeholder: True

end
