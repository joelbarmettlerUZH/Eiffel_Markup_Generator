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
		make_email

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: YODA_ELEMENT
		url: STRING


	feature {ANY}
		make(u_content: YODA_ELEMENT; u_url: STRING)
			--Creates the external YODA_LINK, validates it and sets the feature variables
			require
				u_content_not_void: attached u_content
				u_url_not_void: attached u_url
				u_url_count_not_zero: u_url.count > 0
			do
				content := u_content
				url := u_url
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_link(CURRENT))
				content_set: content = u_content
			end


		make_internal(u_content: YODA_ELEMENT; u_linked_doc: YODA_DOCUMENT)
			--Creates the internal YODA_LINK, validates it and sets the feature variables
			require else
				u_content_not_void: attached u_content
				u_linked_doc_not_void: attached u_linked_doc
			do
				content := u_content
				url := u_linked_doc.name + "{{doctype}}"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_intern_link(CURRENT))
			end


		make_email(u_content: STRING)
			--Creates the YODA_LINK as an E-Mail Mailto, validates it and sets the feature variables
			require
				u_content_not_void: attached u_content
			do
				content := create {YODA_TEXT}.make(u_content)
				url := "mailto:"+u_content
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_email(CURRENT))
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Apply YODA_LINK render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			do
				Result := renderer.render_yoda_link (current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
    			url_not_changed: url.is_equal (old url)
			end

	invariant

		content_text_instantiated: attached content
		--linked_doc_instantiate: linked_doc: YODA_DOCUMENT


end
