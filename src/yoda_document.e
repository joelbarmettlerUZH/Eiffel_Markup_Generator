note
	description: "Summary description for {YODA_DOCUMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_DOCUMENT

	create
		make

	feature {ANY}
		--name and elements shall be public, allow access for everybody
		elements: LINKED_LIST[YODA_ELEMENT]
		name: STRING



	feature {ANY}
		make(u_name: STRING)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		add_element(element: YODA_ELEMENT)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render(output_format: STRING): STRING
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
