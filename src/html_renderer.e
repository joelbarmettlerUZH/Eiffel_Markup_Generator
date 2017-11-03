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
		render_YODA_text(element: YODA_TEXT; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				corresponding_HTML_tag: ARRAY[STRING]
				YODA_tag: ARRAY[STRING]
				content: STRING
				i: INTEGER
			do
				print("Enter render_text%N")
				content := element.content
				content.left_adjust
				content.right_adjust
				content := "<p><pre>"+content+"</pre></p>"
				YODA_tag := <<"{{b}}", "{{/b}}", "{{u}}", "{{/u}}", "{{i}}", "{{/i}}", "%N">>
				corresponding_HTML_tag := <<"<b>", "</b>", "<u>", "</u>", "<i>", "</i>", "</br">>
				from i := 1
				until i = YODA_tag.count
				loop
					print("Replacing Character "+YODA_tag @ i+"%N")
					if content.has_substring (YODA_tag @ i) then
						content.replace_substring_all (YODA_tag @ i, "</pre>"+corresponding_HTML_tag @ i+"<pre>")
					end
					i := i + 1
				end
				print("Left render_text%N")
				Result := spaces(nesting) + content
			ensure then
				valid_start_tag: result.has_substring ("<p>")
				valid_end_tag: result.has_substring ("</p>")
			end


		render_YODA_table(element: YODA_TABLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TABLE.
			local
				content: STRING
				row, column: INTEGER
			do
				content := spaces(nesting) + "<table>%N"
				from column := 0
				until column = element.content.width
				loop
					content := content + spaces(nesting+2) +"<th>" + element.content.item (0, column).render (create {HTML_RENDERER}, 0) + "</th>%N"
					column := column + 1
				end
				from row := 1
				until row = element.content.height
				loop
					content := content + spaces(nesting+1) +"<tr>%N"
					from column := 0
					until column = element.content.width
					loop
						content := content + spaces(nesting+2) +"<td>" + element.content.item (row, column).render (create {HTML_RENDERER}, 0) + "</td>%N"
						column := column + 1
					end
				row := row + 1
				end
				Result := content + spaces(nesting) + "<table>%N"
			ensure then
				valid_start_tag: result.has_substring("<table>")
				valid_end_tag: result.has_substring ("<\table>")
			end


		render_YODA_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LIST.
			local
				content: STRING
			do
				if element.is_ordered then
					content := spaces(nesting) + "<ol>%N"
				else
					content := spaces(nesting) + "<ul>%N"
				end
				across element.content as  list_element
				loop
					content := content + spaces(nesting+1) + "<li>" +list_element.item.render (create {HTML_RENDERER}, 0) + "</li>%N"
				end
				if element.is_ordered then
					content := content + spaces(nesting) + "</ol>%N"
				else
					content := content + spaces(nesting) + "</ul>%N"
				end
				Result := content
			ensure then
				valid_start_tag: result.has_substring("<ul>")
				valid_end_tag: result.has_substring("<\ul>")
			end


		render_YODA_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			do
				Result := spaces(nesting) + "<a href:'" + element.url + "'> " + element.content + "</a>%N"
			ensure then
				valid_start_tag: result.has_substring("<a href='")
				valid_end_tag: result.has_substring("</a>")
			end


		render_YODA_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			do
				Result := spaces(nesting) + "<img src='" + element.content + "'>%N"
			ensure then
				valid_start_tag: result.has_substring("<img src='")
				valid_end_tag: result.has_substring("'>")
			end

		render_YODA_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			do
				Result := spaces(nesting) + element.content + "%N"
			end

		render_bold(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<b>" + element.component.render(create {HTML_RENDERER}, 0) + "</b>%N"
			ensure then
				valid_start_tag: result.has_substring("<b>")
				valid_end_tag: result.has_substring("<\b>")
			end

		render_code(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<code>" + element.component.render(create {HTML_RENDERER}, 0) + "</code>%N"
			ensure then
				valid_start_tag: result.has_substring("<code>")
				valid_end_tag: result.has_substring("<\code>")
			end

		render_italic(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<i>" + element.component.render(create {HTML_RENDERER}, 0) + "</i>%N"
			ensure then
				valid_start_tag: result.has_substring("<i>")
				valid_end_tag: result.has_substring("<\i>")
			end

		render_qoute(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<blockquote>" + element.component.render(create {HTML_RENDERER}, 0) + "</blockquote>%N"
			ensure then
				valid_start_tag: result.has_substring("<blockquote>")
				valid_end_tag: result.has_substring("<\blockquote>")
			end

		render_title(element: TEXT_DECORATOR_TITLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<h>" + element.component.render(create {HTML_RENDERER}, 0) + "</h>%N"	--need to add strenght via element.strength
			ensure then
				valid_start_tag: Result.has_substring("<h")
				valid_end_tag: Result.has_substring("</h>")
			end

		render_underline(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			do
				Result := spaces(nesting) + "<u>" + element.component.render(create {HTML_RENDERER}, 0) + "</u>%N"
			ensure then
				valid_start_tag: Result.has_substring("<u>")
				valid_end_tag: Result.has_substring("<\u>")
			end

end
