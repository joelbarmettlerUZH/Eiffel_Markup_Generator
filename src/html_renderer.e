note
	description: "Concrete renderer that converts the concrete elements into html."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	HTML_RENDERER

	inherit
		RENDERER

	feature {ANY}
		corresponding_HTML_tag: ARRAY[STRING]
			-- Store the HTML equivalents for all YODA tags.


	feature {ANY}

		render_YODA_text_interface(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				content: STRING
			do
				-- What to do here??
				-- Loop through YODA-tag and replace in scan element.Content for each YODA_tag the corresponding HTML tag and update content.
				-- Add content to return_string
				-- Add <\p> to return_string
				-- Return return_string
			ensure then
				valid_start_tag: return_string.has_prefix("<p>")
				valid_end_tag: return_string.has_suffix ("<\p>")
			end

		render_YODA_text(element: YODA_TEXT; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				content: STRING
				i: INTEGER
			do
				content := element.content
				content := "<p><pre>"+content+"</pre></p>"
				YODA_tag := <<"{{b}}", "{{/b}}", "{{u}}", "{{/u}}", "{{i}}", "{{/i}}">>
				corresponding_HTML_tag := <<"<b>", "</b>", "<u>", "</u>", "<i>", "</i>">>
				from i := 0
				until i = YODA_tag.count
				loop
					if content.has_substring (YODA_tag @ i) then
						content.replace_substring_all (YODA_tag @ i, "</pre>"+corresponding_HTML_tag @ i+"<pre>")
					end
				end
				Result := content
			ensure then
				valid_start_tag: return_string.has_prefix("<p>")
				valid_end_tag: return_string.has_suffix ("<\p>")
			end


		render_YODA_table(element: YODA_TABLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TABLE.
			local
				return_string: STRING
				content: STRING
			do
				-- Add <table> to return_string.
				-- Set content = element.Content.
				-- Loop through all element.Content elements and surround each tablerow with <tr>...</tr> and each element with <th>...</th> and update content.
				-- Add content to return_string
				-- Add <\table> to return_string
				-- Return return_string
			ensure then
				valid_start_tag: return_string.has_prefix("<table>")
				valid_end_tag: return_string.has_suffix ("<\table>")
			end


		render_YODA_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LIST.
			local
				return_string: STRING
				content: STRING
			do
				-- Add <ul> to return_string.
				-- Set content = element.Content.
				-- Loop through all element.Content elements and surround each element with <li>...</li> and update content.
				-- Add content to return_string
				-- Add <\ul> to return_string
				-- Return return_string
			ensure then
				valid_start_tag: return_string.has_prefix("<ul>")
				valid_end_tag: return_string.has_suffix("<\ul>")
			end


		render_YODA_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag.
			ensure then
				valid_start_tag: return_string.has_prefix("<link href='")
				valid_end_tag: return_string.has_suffix("'>")
			end


		render_YODA_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			local
				return_string: STRING
				content: STRING
			do
				-- Add <img src= to return_string.
				-- Add element.Content to return_string.
				-- Add > to return_string
				-- Return return_string
			ensure then
				valid_start_tag: return_string.has_prefix("<img src='")
				valid_end_tag: return_string.has_suffix("'>")
			end

		render_YODA_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			do
				-- return YODA_SNIPPET.content
			end

		render_bold(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag bold.
			ensure then
				valid_start_tag: return_string.has_prefix("<b>")
				valid_end_tag: return_string.has_suffix("<\b>")
			end

		render_code(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag for code.
			ensure then
				valid_start_tag: return_string.has_prefix("<code>")
				valid_end_tag: return_string.has_suffix("<\code>")
			end

		render_italic(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag for italic.
			ensure then
				valid_start_tag: return_string.has_prefix("<i>")
				valid_end_tag: return_string.has_suffix("<\i>")
			end

		render_qoute(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag for quote.
			ensure then
				valid_start_tag: return_string.has_prefix("<blockquote>")
				valid_end_tag: return_string.has_suffix("<\blockquote>")
			end

		render_title(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag for title with the corresponding strength.
				Result := "TEST: RENDERING TITLE"
			ensure then
				valid_start_tag: Result.has_prefix("<h"+strength+">")
				valid_end_tag: Result.has_suffix("<\h"+strength+">")
			end

		render_underline(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
				content: STRING
			do
				-- Surround element.Content with the corresponding HTML-tag for underline.
				Result := "TEST: RENDERING UNTERLINE"
			ensure then
				valid_start_tag: Result.has_prefix("<u>")
				valid_end_tag: Result.has_suffix("<\u>")
			end

end
