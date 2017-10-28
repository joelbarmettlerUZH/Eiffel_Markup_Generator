note
	author: "Joel Barmettler"
	date: "$26.10.17$"
	revision: "$27.10.2017$"

class
	YODA

	feature {ANY}
		project: YODA_PROJECT
		document: YODA_DOCUMENT
		element: YODA_ELEMENT

		text(content: STRING): YODA_TEXT
			--Factory that creates a TEXT object and returns it to the user
			require
				text_content_exists: attached content
				text_not_empty: not content.is_empty
			local
				text: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via YODA_TEXT.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_TEXT: {t: YODA_TEXT} Result
			end


		table(content: ARRAY2[YODA_ELEMENT]): YODA_TABLE
			--Factory that creates a TABLE object and returns it to the user
			require

				table_content_exists: attached content
				array_not_empty: not content.is_empty
			local
				table: 	YODA_TABLE
			do
				--creates an instance of YODA_TABLE via YODA_TABLE.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_TABLE: {t: YODA_TABLE} Result
			end


		list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates a LIST object and returns it to the user
			require
				list_content_exists: attached content
				array_not_empty: not content.is_empty
			local
				list: YODA_LIST
			do
				--creates an instance of YODA_LIST via YODA_LIST.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LIST: {t: YODA_LIST} Result
			end


		link_intern(content: STRING; linked_doc: YODA_DOCUMENT): YODA_LINK
			--Factory that creates an internal LINK object and returns it to the user
			require
				link_intern_content_exists: attached content
				string_not_empty: not content.is_empty
				linked_doc_exists: attached linked_doc
				linked_doc_correct_type: {t: YODA_DOCUMENT} linked_doc
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make_internal and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		link_extern(content, url: STRING): YODA_LINK
			--Factory that creates an external LINK object and returns it to the user
			require
				content_exists: attached content
				url_exists: attached url
				linked_doc_exists: attached linked_doc
				linked_doc_correct_type: {t: YODA_DOCUMENT} linked_doc
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		email(mail_address: STRING): YODA_LINK
			--Factory that creates an email LINK object and returns it to the user
			require
				mail_address_exists: attached content
				string_not_empty: not content.is_empty
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make_email and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		image(content: STRING): YODA_IMAGE
			--Factory that creates an IMAGE object and returns it to the user
			require
				image_content_exists: attached content
				string_not_empty: not content.is_empty
			local
				image: YODA_IMAGE
			do
				--creates an instance of YODA_IMAGE via YODA_IMAGE.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_IMAGE} Result
			end


		snippet(content: STRING): YODA_SNIPPET
			--Factory that creates a SNIPPET object and returns it to the user
			require
				snippet_content_exists: attached content
				string_not_empty: not content.is_empty
			local
				snippet: YODA_SNIPPET
			do
				--creates an instance of YODA_SNIPPET via YODA_SNIPPET.make and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_SNIPPET} Result
			end


		bold(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				bold_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_BOLD.make_style and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end


		code(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				code_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_CODE.make_style and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end


		italic(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				italic_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_ITALIC.make_style and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end


		quote(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				quote_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_QUOTE.make_style and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end

		underline(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				underline_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_UNDERLINE.make_style and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end

		title(content: YODA_TEXT_INTERFACE; strength: INTEGER): YODA_TEXT_INTERFACE
			--Factory that creates a text decorator of type YODA_TEXT_INTERFACE which decorates a casual yoda text object
			require
				title_content_exists: attached content
				element_type_YODA_TEXT: {t: YODA_TEXT_INTERFACE} content
			local
				decorator: YODA_TEXT_INTERFACE
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_TITLE.make_style_with_attribute and returns it
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: {t: YODA_TEXT_INTERFACE} Result
			end



		b(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			local
				bold_text: STRING
			do
				--puts our self-defined BOLD-Tags {{b}} around STRING and returns it
			ensure
				result_not_void: attached Result
				bold_text_not_empty: not bold_text.is_empty
				valid_start_tag: return_string.has_prefix("{{b}}")
				valid_end_tag: return_string.has_suffix ("{{/b}}")
			end


		i(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			local
				italic_text: STRING
			do
				--puts our self-defined ITALIC-Tags {{i}} around STRING and returns it
			ensure
				result_not_void: attached Result
				italic_text_not_empty: not italic_text.is_empty
				valid_start_tag: return_string.has_prefix("{{i}}")
				valid_end_tag: return_string.has_suffix ("{{/i}}")
			end


		u(content: STRING): STRING
			--takes a String, puts corresponding tags to it
			require
				content_not_empty: attached content
				content_not_empty: not content.is_empty
			local
				underline_text: STRING
			do
				--puts our self-defined BOLD-Tags {{u}} around STRING and returns it
			ensure
				result_not_void: attached Result
				underline_text_not_empty: not underline_text.is_empty
				valid_start_tag: return_string.has_prefix("{{u}}")
				valid_end_tag: return_string.has_suffix ("{{/u}}")
			end

end
