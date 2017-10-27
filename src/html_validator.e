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
		make
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validate_text(element: YODA_TEXT): BOOLEAN
			--validates a text element whether possible in html and returns a boolean
			require
				placeholder: True
				element_not_empty: element /= void

			do
				--check constraints of html text
			ensure
				placeholder: True
			end


		validate_table(element: YODA_TABLE): BOOLEAN
			--validates a table element whether possible in html and returns a boolean
			require
				placeholder: True
				element_not_empty: element /= void
			do
				--check constraints of html table
			ensure
				placeholder: True
			end


		validate_list(element: YODA_LIST): BOOLEAN
			--some fancy comment
			require
				placeholder: True
				element_not_empty: element /= void
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validate_link(element: YODA_LINK): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validate_image(element: YODA_IMAGE): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end

		validate_snippet(element: YODA_IMAGE): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


	invariant
		placeholder: True

end
