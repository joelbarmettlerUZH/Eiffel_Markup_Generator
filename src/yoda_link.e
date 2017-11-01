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
		make_internal,
		make_mail

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content, url: STRING
		linked_doc: YODA_DOCUMENT
		is_internal: BOOLEAN


	feature {ANY}
		make(u_content, u_url: STRING)
			--Creates the YODA_LINK, validates it and sets the feature variables
			require
				u_content_not_void: attached u_content
				u_url_not_void: attached u_url
				u_content_count_not_zero: u_content.count > 0
				u_url_count_not_zero: u_url.count > 0
			do
				--comment what is done
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_list(CURRENT))
				content_set: content = u_content
			end


		make_internal(u_content: STRING; u_linked_doc: YODA_DOCUMENT)
			--some fancy comment
			require else
				u_content_not_void: attached u_content
				u_linked_doc_not_void: attached u_linked_doc
			do
				--comment what is done
			ensure then
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
			end


		make_mail(u_content: STRING)
			--some fancy comment
			require
				u_content_not_void: attached u_content
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_link(?))
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Apply YODA_LINKE render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			local
   	 			return_string: STRING
			do
			 	-- Set return_string = Renderer.render_YODA_link(current, int).
   				-- Return return_string.
			end

	invariant

		content_text_instantiated: attached content
		--linked_doc_instantiate: linked_doc: YODA_DOCUMENT


end
