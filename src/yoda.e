note
	author: "Joel Barmettler"
	date: "$26.10.17$"
	revision: "$27.10.2017$"

class
	YODA

	feature {ANY}
		text(content: STRING): YODA_TEXT
			--Factory that creates a TEXT object and returns it to the user
			require
				text_content_exists: attached content
				text_not_empty: not content.is_empty
			do
				print("Enter Text Factory%N")
				Result := create {YODA_TEXT}.make(content)
				print("Left Text Factory%N")
			ensure
				result_not_void: attached Result
				result_is_YODA_TEXT: attached {YODA_TEXT} Result
			end


		table(content: ARRAY2[YODA_ELEMENT]): YODA_TABLE
			--Factory that creates a TABLE object and returns it to the user
			require

				table_content_exists: attached content
				array_not_empty: not content.is_empty
			do
				Result := create {YODA_TABLE}.make(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_TABLE: attached {YODA_TABLE} Result
			end

		list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			do
				Result := bulletpoint_list(content)
			end


		numbered_list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates a LIST object and returns it to the user
			require
				list_content_exists: attached content
				array_not_empty: not content.is_empty
			do
				Result := create {YODA_LIST}.make(content, True)
			ensure
				result_not_void: attached Result
				result_is_YODA_LIST: attached {YODA_LIST} Result
			end

		bulletpoint_list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates a LIST object and returns it to the user
			require
				list_content_exists: attached content
				array_not_empty: not content.is_empty
			do
				Result := create {YODA_LIST}.make(content, False)
			ensure
				result_not_void: attached Result
				result_is_YODA_LIST: attached {YODA_LIST} Result
			end


		link_intern(content: STRING; linked_doc: YODA_DOCUMENT): YODA_LINK
			--Factory that creates an internal LINK object and returns it to the user
			require
				link_intern_content_exists: attached content
				string_not_empty: not content.is_empty
				linked_doc_exists: attached linked_doc
				linked_doc_correct_type: attached {YODA_DOCUMENT} linked_doc
			do
				Result := create {YODA_LINK}.make_internal(content, linked_doc)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		link_extern(content, url: STRING): YODA_LINK
			--Factory that creates an external LINK object and returns it to the user
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
				url_exists: attached url
				url_not_empty: not url.is_empty
			do
				Result := create {YODA_LINK}.make(content, url)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		email(mail_address: STRING): YODA_LINK
			--Factory that creates an email LINK object and returns it to the user
			require
				mail_address_exists: attached mail_address
				string_not_empty: not mail_address.is_empty
			do
				Result := create {YODA_LINK}.make_mail(mail_address)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		image(content: STRING): YODA_IMAGE
			--Factory that creates an IMAGE object and returns it to the user
			require
				image_content_exists: attached content
				string_not_empty: not content.is_empty
			do
				Result := create {YODA_IMAGE}.make(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_IMAGE} Result
			end


		snippet(content: STRING): YODA_SNIPPET
			--Factory that creates a SNIPPET object and returns it to the user
			require
				snippet_content_exists: attached content
				string_not_empty: not content.is_empty
			do
				Result := create {YODA_SNIPPET}.make(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_SNIPPET} Result
			end


		bold(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				bold_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_BOLD}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		code(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				code_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_CODE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		italic(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				italic_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_ITALIC}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		quote(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				quote_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_QUOTE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end

		underline(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				underline_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_UNDERLINE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end

		title(content: YODA_TEXT_INTERFACE; strength: INTEGER): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				title_content_exists: attached content
				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_TITLE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end



		b(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{b}}"+content+"{{/b}}"
			ensure
				result_not_void: attached Result
				bold_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{b}}")
				valid_end_tag: Result.has_substring ("{{/b}}")
			end


		i(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{i}}"+content+"{{/i}}"
			ensure
				result_not_void: attached Result
				italic_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{i}}")
				valid_end_tag: Result.has_substring ("{{/i}}")
			end


		u(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_not_empty: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{u}}"+content+"{{/u}}"
			ensure
				result_not_void: attached Result
				underline_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{u}}")
				valid_end_tag: Result.has_substring ("{{/u}}")
			end

end
