note
	description: "Summary description for {YODA}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA

	create
		make

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

end
