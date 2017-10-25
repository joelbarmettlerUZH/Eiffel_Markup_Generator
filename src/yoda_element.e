note
	description: "Summary description for {YODA_ELEMENT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	YODA_ELEMENT

	feature {NONE}
		validation_languages: LINKED_LIST[VALIDATOR]

	feature {ANY}
		validate(element: YODA_ELEMENT; validator_obj: VALIDATOR; validation_function: FUNCTION[BOOLEAN]): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		text(content: STRING): YODA_TEXT
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		table(content: ARRAY2[YODA_ELEMENT]): YODA_TABLE
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		liste(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		link_intern(content: STRING; linked_doc: YODA_DOCUMENT): YODA_LINK
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		link_extern(content, url: STRING): YODA_LINK
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		email(mail_address: STRING): YODA_LINK
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		image(content: STRING): YODA_IMAGE
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		snippet(content: STRING): YODA_SNIPPET
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				placeholder: True
			deferred
			ensure then
				placeholder: True
			end


	invariant
		placeholder: True

end
