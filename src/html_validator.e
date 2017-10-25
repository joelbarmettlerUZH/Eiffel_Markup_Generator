note
	description: "Summary description for {HTML_VALIDATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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


		validata_text(element: YODA_TEXT): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validata_table(element: YODA_TABLE): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validata_list(element: YODA_LIST): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validata_link(element: YODA_LINK): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		validata_image(element: YODA_IMAGE): BOOLEAN
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
