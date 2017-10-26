note
	description: "The {YODA} class is the class on which the user will directly interact, to add new elements thorugh the factory."
	author: "Joel Barmettler"
	date: "$26.10.2017$"
	revision: "$Revision$"

class
	YODA

	create
		make

	feature {ANY}
		project: YODA_PROJECT
		document: YODA_DOCUMENT
		element: YODA_ELEMENT
		make:
			do
				create project
				create document
				create element
			end
		text(content: STRING): YODA_TEXT
			--Factory that creates a TEXT object and returns it to the user
			require
				text_not_void: content /= void
				text_not_empty: not content.is_empty
			local
				text: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via YODA_TEXT.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_TEXT: {t: YODA_TEXT} Result
			end


		table(content: ARRAY2[YODA_ELEMENT]): YODA_TABLE
			--Factory that creates a TABLE object and returns it to the user
			require
				array_not_void: content /= void
				array_not_empty: not content.is_empty
			local
				table: 	YODA_TABLE
			do
				--creates an instance of YODA_TABLE via YODA_TABLE.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_TABLE: {t: YODA_TABLE} Result
			end


		list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates a LIST object and returns it to the user
			require
				array_not_void: content /= void
				array_not_empty: not content.is_empty
			local
				list: YODA_LIST
			do
				--creates an instance of YODA_LIST via YODA_LIST.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LIST: {t: YODA_LIST} Result
			end


		link_intern(content: STRING; linked_doc: YODA_DOCUMENT): YODA_LINK
			--Factory that creates an internal LINK object and returns it to the user
			require
				string_not_void: content /= void
				string_not_empty: not content.is_empty
				linked_doc_not_void: linked_doc =/ void
				linked_doc_correct_type: {t: YODA_DOCUMENT} linked_doc
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make_internal and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		link_extern(content, url: STRING): YODA_LINK
			--Factory that creates an external LINK object and returns it to the user
			require
				string_not_void: content /= void
				string_not_empty: not content.is_empty
				linked_doc_not_void: linked_doc =/ void
				linked_doc_correct_type: {t: YODA_DOCUMENT} linked_doc
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		email(mail_address: STRING): YODA_LINK
			--Factory that creates an email LINK object and returns it to the user
			require
				string_not_void: content /= void
				string_not_empty: not content.is_empty
			local
				link: YODA_LINK
			do
				--creates an instance of YODA_LINK via YODA_LINK.make_email and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_LINK} Result
			end


		image(content: STRING): YODA_IMAGE
			--Factory that creates an IMAGE object and returns it to the user
			require
				string_not_void: content /= void
				string_not_empty: not content.is_empty
			local
				image: YODA_IMAGE
			do
				--creates an instance of YODA_IMAGE via YODA_IMAGE.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_IMAGE} Result
			end


		snippet(content: STRING): YODA_SNIPPET
			--Factory that creates a SNIPPET object and returns it to the user
			require
				string_not_void: content /= void
				string_not_empty: not content.is_empty
			local
				snippet: YODA_SNIPPET
			do
				--creates an instance of YODA_SNIPPET via YODA_SNIPPET.make and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_SNIPPET} Result
			end


		bold(content: YODA_TEXT): YODA_TEXT
			--Factory that creates a text decorator of type BOLD which decorates a casual yoda text object
			require
				element_existing: content /= void
				element_type_YODA_TEXT: {t: YODA_TEXT} content
			local
				decorator: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_BOLD.make_style and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_TEXT} Result
			end


		code(content: YODA_TEXT): YODA_TEXT
			--Factory that creates a text decorator of type CODE which decorates a casual yoda text object
			require
				element_existing: content /= void
				element_type_YODA_TEXT: {t: YODA_TEXT} content
			local
				decorator: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_CODE.make_style and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_TEXT} Result
			end


		italic(content: YODA_TEXT): YODA_TEXT
			--Factory that creates a text decorator of type ITALIC which decorates a casual yoda text object
			require
				element_existing: content /= void
				element_type_YODA_TEXT: {t: YODA_TEXT} content
			local
				decorator: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_ITALIC.make_style and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_TEXT} Result
			end


		quote(content: YODA_TEXT): YODA_TEXT
			--Factory that creates a text decorator of type QUOTE which decorates a casual yoda text object
			require
				element_existing: content /= void
				element_type_YODA_TEXT: {t: YODA_TEXT} content
			local
				decorator: YODA_TEXT
			do
				--creates an instance of YODA_TEXT via TEXT_DECORATOR_QUOTE.make_style and returns it
			ensure
				result_not_void: Result =/ void
				result_is_YODA_LINK: {t: YODA_TEXT} Result
			end

end
