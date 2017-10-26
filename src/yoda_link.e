note
	description: "Summary description for {YODA_LINK}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_LINK

	inherit
		YODA_ELEMENT

	create
		make,
		make_internal

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content, url: STRING
		linked_doc: YODA_DOCUMENT
		is_internal: BOOLEAN


	feature {ANY}
		make(u_content, u_url: STRING)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
				placeholder: True
			end


		make_internal(u_content: STRING; u_linked_doc: YODA_DOCUMENT)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
				placeholder: True
			end


		make_mail(u_content: STRING)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
				placeholder: True
			end


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				placeholder: True
			do
				--comment what is done
			ensure then
				placeholder: True
			end

	invariant
		placeholder: True

end
