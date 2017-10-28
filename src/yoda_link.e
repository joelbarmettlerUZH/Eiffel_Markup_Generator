note
	description: "Concrete element Yoda link."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

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
			--Creates the YODA_LINK, validates it and sets the feature variables
			require
				u_content_not_void: u_content /= void
				u_url_not_void: u_url /= void
				u_content_count_not_zero: u_content.count > 0
				u_url_count_not_zero: u_url.count > 0
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
				content_set: content = u_content
			end


		make_internal(u_content: STRING; u_linked_doc: YODA_DOCUMENT)
			--some fancy comment
			require else
				placeholder: True
				u_content_not_void: u_content /= void
				u_linked_doc_not_void: u_linked_doc /= void
			do
				--comment what is done
			ensure then
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


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Apply YODA_LINKE render to renderer.
			require else
				renderer_exists: renderer /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Calls Renderer.render_link(current, int).
			ensure then
				placeholder: True
			end

	invariant
		placeholder: True

		--content_text_instantiated: content /= void
		--linked_doc_instantiate: linked_doc: YODA_DOCUMENT


end
