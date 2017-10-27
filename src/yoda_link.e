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
				u_content_not_void: u_content /= void
				u_url_not_void: u_url /= void
				u_content_count_not_zero: u_content.count > 0
				u_url_count_not_zero: u_url.count > 0
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
				u_content_not_void: u_content /= void
				u_linked_doc_not_void: u_linked_doc /= void
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
				u_content_not_void: u_content /= void
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
				render_obj_not_void: render_obj /= void
			do
				--comment what is done
			ensure then
				placeholder: True
				result_is_String: {t: String} Result
			end

	invariant
		placeholder: True

		--content_text_instantiated: content /= void
		--linked_doc_instantiate: linked_doc: YODA_DOCUMENT


end
