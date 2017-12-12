note
	description: "Concrete Element YODA_LINK."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

class
	YODA_LINK

	inherit
		YODA_ELEMENT

	create
		make_external,
		make_internal,
		make_email,
		make_anchor

	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		--Content and url public, allow access for everybody
		content: YODA_ELEMENT
		url: STRING


	feature {ANY}
		make_external(u_content: YODA_ELEMENT; u_url: STRING)
			--Creates the external YODA_LINK, validates it and sets the feature variables.
			--Validator gets called in order to ensure that a link remains valid for all languages.
			require
				content_exists: attached u_content
				url_exists: attached u_url
				url_not_empty: u_url.count > 0
			do
				--Validate input on general constraints (independent of output language)
					--For complete validation of links/Url's it would be very good to use RegEx (regular expressions)
					--However, since we don't want other libraries to be required for the user od YODA and since RegEx is not
					--supported by the Eiffel standart libraries we are not able to user RegEX for now.
					--If at any point in the the use uf RegEx is easely available we could use checks like the following:
					--	u_url <-> "^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"
					--	u_url <-> "^[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$"

				--Check if link contains "https://" or "http://"
				if
					not (u_url.has_substring("https://") or u_url.has_substring("http://"))
				then
				--if not prepend "https://"
					u_url.prepend("http://")
				end
				content := u_content
				url := u_url
				name := "external Link"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_link(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("external Link")
			end


		make_internal(u_content: YODA_ELEMENT; u_linked_doc: YODA_DOCUMENT)
			--Creates the internal YODA_LINK, validates it and sets the feature variables
			--Validator gets called in order to ensure that a link remains valid for all languages.
			require else
				link_intern_content_exists: attached u_content
				linked_doc_exists: attached u_linked_doc
				linked_doc_correct_type: attached {YODA_DOCUMENT} u_linked_doc
			do
				content := u_content
				url := u_linked_doc.name + "{{doctype}}"
				name := "internal Link"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_link(CURRENT))
				name_set: name.is_equal("internal Link")
			end


		make_anchor(u_content: YODA_ELEMENT; u_linked_anchor: YODA_ANCHOR)
			--Creates the anchor that marks a hypertext link, validates it and sets the feature variables
			--Validator gets called in order to ensure that a link remains valid for all languages.
			require else
				u_content_exists: attached u_content
				anchor_exists: attached u_linked_anchor
				u_linked_anchor_correct_type: attached {YODA_ANCHOR} u_linked_anchor
			do
				content := u_content
				url := "#"+u_linked_anchor.content
				name := "anchor Link"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_link(CURRENT))
				name_set: name.is_equal("anchor Link")
			end


		make_email(u_content: STRING)
			--Creates the YODA_LINK as an E-Mail Mailto, validates it and sets the feature variables
			--Validator gets called in order to ensure that a link remains valid for all languages.
			require
				mail_address_exists: attached u_content
				string_not_empty: not u_content.is_empty
				u_content_valid: is_valid_email(u_content)
			do
				-- Set attributes
				content := create {YODA_TEXT}.make(u_content)
				url := "mailto:"+u_content
				name := "eMail"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_link(CURRENT))
				name_set: name.is_equal("eMail")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Applies YODA_LINK render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_link(current, nesting) returns a String that replaces the YODA_tags with the corresponding HTML tags
			--and assigns it to the Result.
			do
				Result := renderer.render_link (current, nesting)
			end


	invariant
		content_not_void: attached content
		has_url: attached url
		url_not_empty: current.url.count > 0

end
