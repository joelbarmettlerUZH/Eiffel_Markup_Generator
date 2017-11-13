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
				content := element.content
				content.left_adjust
				content.right_adjust
				YODA_tag := <<"<", ">", "{{b}}", "{{/b}}", "{{u}}", "{{/u}}", "{{i}}", "{{/i}}", "{{n}}", "%N" >>
				corresponding_HTML_tag := << "&lt;", "&gt;", "<b>", "</b>", "<u>", "</u>", "<i>", "</i>", "</br>", "</br>">>
				from i := 1
				until i > YODA_tag.count
				loop
					if content.has_substring (YODA_tag @ i) then
						content.replace_substring_all (YODA_tag @ i, corresponding_HTML_tag @ i)
					end
					i := i + 1
				end
				content := "<p>"+content+"</p>"
				Result := spaces(nesting) + content + "%N"
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
				content := content + spaces(nesting+1) +"<tr>%N"
				from column := 1
				until column > element.content.width
				loop
					content := content + spaces(nesting+2) +"<th>%N" + element.content.item (1, column).render (create {HTML_RENDERER}, nesting+3) + spaces(nesting+2) + "</th>%N"
					column := column + 1
				end
				content := content + spaces(nesting+1) +"</tr>%N"
				from row := 2
				until row > element.content.height
				loop
					content := content + spaces(nesting+1) +"<tr>%N"
					from column := 1
					until column > element.content.width
					loop
					content := content + spaces(nesting+2) +"<td>%N" + element.content.item (row, column).render (create {HTML_RENDERER}, nesting+3) + spaces(nesting+2) + "</td>%N"
						column := column + 1
					end
				content := content + spaces(nesting+1) +"</tr>%N"
				row := row + 1
				end
				content.replace_substring_all ("<p>", "")
				content.replace_substring_all ("</p>", "")
				Result := content + spaces(nesting) + "</table>%N"
			ensure then
				valid_start_tag: result.has_substring("<table>")
				valid_end_tag: result.has_substring("</table>")
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
					content := content + spaces(nesting+1) + "<li>%N" +list_element.item.render (create {HTML_RENDERER}, nesting+2) + spaces(nesting+1) + "</li>%N"
				end
				if element.is_ordered then
					content := content + spaces(nesting) + "</ol>%N"
				else
					content := content + spaces(nesting) + "</ul>%N"
				end
				content.replace_substring_all ("<p>", "")
				content.replace_substring_all ("</p>", "")
				Result := content
			ensure then
				valid_start_tag: result.has_substring("<ul>") or result.has_substring("<ol>")
				valid_end_tag: result.has_substring("</ul>") or result.has_substring("</ol>")
			end


		render_YODA_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			local
				doc_url: STRING
			do
				doc_url := element.url
				doc_url.replace_substring_all ("{{doctype}}", ".html")
				Result := spaces(nesting) + "<a href='" + doc_url + "'> %N" + element.content.render(create {HTML_RENDERER},nesting+1) + spaces(nesting) + "</a>%N"
			ensure then
				valid_start_tag: result.has_substring("<a href='")
				valid_end_tag: result.has_substring("</a>")
			end


		render_YODA_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			local
				input_file: RAW_FILE
				output_file: RAW_FILE
				output_path: PATH
				input_file_name: STRING
				output_folder: DIRECTORY
				output_folder_name: STRING
			do
				--print(element.name)
				if	-- if intern image: copy immage to "resource" folder and change path acordingly
					element.name.is_equal("local image")
				then
					-- creat "temp_output" folder if not already exists
					output_folder_name := "temp_output"
					create output_folder.make (output_folder_name)
					if
						not output_folder.exists
					then
						output_folder.create_dir
					end
					-- create "resources" folder if not exists
					create output_folder.make (".\temp_output\resources")
					if
						not output_folder.exists
					then
						output_folder.create_dir
					end

					-- copy file into resources folder
					input_file_name := element.content.substring (element.content.last_index_of('\', element.content.count)+1, element.content.count)
					create output_path.make_current
					output_path:=output_path.appended ("\temp_output\resources\" + input_file_name)
					create input_file.make_open_read (element.content)
					create output_file.make_with_path (output_path)
					output_file.open_write
					input_file.copy_to(output_file)
					output_file.close
					
					-- write relative path for HTML
					Result := spaces(nesting) + "<img src='" + ".\resources\"+ input_file_name + "'>%N"

				else
				-- if extern link use linke as content
					Result := spaces(nesting) + "<img src='" + element.content + "'>%N"
				end
			ensure then
				valid_start_tag: result.has_substring("<img src='")
				valid_end_tag: result.has_substring("'>")
			end

		render_YODA_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			local
				snippet_content: STRING
			do
				snippet_content := element.content
				snippet_content.replace_substring_all ("%N", "%N" + spaces(nesting))
				Result := element.content + "%N"
			end

		render_bold(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				Result := spaces(nesting) + "<b>" + return_string + "</b>%N"
			ensure then
				valid_start_tag: result.has_substring("<b>")
				valid_end_tag: result.has_substring("</b>")
			end

		render_code(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				return_string.replace_substring_all ("<p>", "")
				return_string.replace_substring_all ("</p>", "")
				Result := spaces(nesting) + "<code>" + return_string + "</code>%N"
			ensure then
				valid_start_tag: result.has_substring("<code>")
				valid_end_tag: result.has_substring("</code>")
			end

		render_italic(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				Result := spaces(nesting) + "<i>" + return_string + "</i>%N"
			ensure then
				valid_start_tag: result.has_substring("<i>")
				valid_end_tag: result.has_substring("</i>")
			end

		render_qoute(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				return_string.replace_substring_all ("<p>", "")
				return_string.replace_substring_all ("</p>", "")
				Result := spaces(nesting) + "<blockquote>" + return_string + "</blockquote>%N"
			ensure then
				valid_start_tag: result.has_substring("<blockquote>")
				valid_end_tag: result.has_substring("</blockquote>")
			end

		render_title(element: TEXT_DECORATOR_TITLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				Result := spaces(nesting) + "<h" + element.strength.out + ">" + return_string + "</h" + element.strength.out + ">%N"	--need to add strenght via element.strength
			ensure then
				valid_start_tag: Result.has_substring("<h")
				valid_end_tag: Result.has_substring("</h")
			end

		render_underline(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				Result := spaces(nesting) + "<u>" + return_string + "</u>%N"
			ensure then
				valid_start_tag: Result.has_substring("<u>")
				valid_end_tag: Result.has_substring("</u>")
			end

end
