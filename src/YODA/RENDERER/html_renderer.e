note
	description: "HTML Render class that receives YODA_ELEMENTS and returns a string of their representation in HTML"
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	HTML_RENDERER

	inherit
		RENDERER

	feature {YODA_ELEMENT, EQA_TEST_SET}
		render_text(element: YODA_TEXT; nesting: INTEGER): STRING
			--The render_YODA_Text function takes a YODA_TEXT element and replaces all yoda stling tags with the corresponding html-tag.
			--Then, it returns the content of the yoda_text surrounded with paragraph tags.
			local
				corresponding_HTML_tag: ARRAY[STRING]
				YODA_tag: ARRAY[STRING]
				content: STRING
				i: INTEGER
			do
				content := element.content.out
				content.left_adjust
				content.right_adjust
				--Replace not-allowed symbols like "<" with a code that tells HTML to display a "<" but not interpret it.
				--also, replace all yoda syling tags with the corresponding one.
				YODA_tag := <<"<", ">", "{{b}}", "{{/b}}", "{{u}}", "{{/u}}", "{{i}}", "{{/i}}", "{{n}}", "%N" >>
				corresponding_HTML_tag := << "&lt;", "&gt;", "<b>", "</b>", "<u>", "</u>", "<i>", "</i>", "<br>", "<br>">>
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


		render_table(element: YODA_TABLE; nesting: INTEGER): STRING
			--To render an table, the have to perform a first loop that surround all elemets the first row in the ARRAY2 with table header th tags. Then, for every following row,
			--surround each row element with td tags. Between each new row, add table row tr tags. Always keep track of the nesting and increase nesting for new rows and new
			--elements in the row. The initial nesting of the table itself is handed to the renderer, so we build up on this one.
			local
				content: STRING
				row, column: INTEGER
			do
				--The content string is the one we want to return. First, add the table tag to it with the right number of spaces in front
				content := spaces(nesting) + "<table>%N"
				--Then, loop over the first row of the table, surround the whole row with th tags and each element with th tags, then render each element itself.
				content := content + spaces(nesting+1) +"<tr>%N"
				from column := 1
				until column > element.content.width
				loop
					content := content + spaces(nesting+2) +"<th>%N" + element.content.item (1, column).render (create {HTML_RENDERER}, nesting+3) + spaces(nesting+2) + "</th>%N"
					column := column + 1
				end
				--Next, render all the rest of the table with two loops, one going over all the rows starting from row 2 (first is already rendered as header), the other
				--one going over the elements of that row.
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
				--Even though the table may contain text, we remove paragraph tags cause the table content is styled individually.
				content.replace_substring_all ("<p>", "")
				content.replace_substring_all ("</p>", "")
				--Close the table with the table-close tag
				Result := content + spaces(nesting) + "</table>%N"
			ensure then
				valid_start_tag: result.has_substring("<table>")
				valid_end_tag: result.has_substring("</table>")
			end


		render_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- To render a list, we have to first differentiate between the ordered or unordered list, in order to set the right list-tag. Then, we loop
			--over the list elements, render them and surround the outcome with list tags.
			local
				content: STRING
			do
				--Depending on ordered/unordered, set ol or ul tag.
				if element.is_ordered then
					content := spaces(nesting) + "<ol>%N"
				else
					content := spaces(nesting) + "<ul>%N"
				end
				--loop over elements, render them and surround with list tag. Keep track of the nesting structure.
				across element.content as  list_element
				loop
					content := content + spaces(nesting+1) + "<li>%N" +list_element.item.render (create {HTML_RENDERER}, nesting+2) + spaces(nesting+1) + "</li>%N"
				end
				--again close with the right closing tag.
				if element.is_ordered then
					content := content + spaces(nesting) + "</ol>%N"
				else
					content := content + spaces(nesting) + "</ul>%N"
				end
				--Even though the list may contain text, we remove paragraph tags cause the table content is styled individually.
				content.replace_substring_all ("<p>", "")
				content.replace_substring_all ("</p>", "")
				Result := content
			ensure then
				valid_start_tag: result.has_substring("<ul>") or result.has_substring("<ol>")
				valid_end_tag: result.has_substring("</ul>") or result.has_substring("</ol>")
			end


		render_link(element: YODA_LINK; nesting: INTEGER): STRING
			--A link consists of some content that is clickable and a place it links to. When we were dealing with internal links, the url of the element is just
			--some name of another document. At the stage where this internal link was created, it is not determined yet what document-type this document will be.
			--Therefore, we marked the internal link with a yoda specific {{doctype}} tag that not just symbolizes that a link to another document was used, but also
			--serves as a placeholder where the doctype-ending, ".html", is going to be. We assume that, when the user renders a file as HTML, he also wants to link
			--on oter HTML files, therefore we link to the other document as a HTML document.
			--Finally, we simply add the url after the href and render the clickable content between the link tags.
			local
				doc_url: STRING
			do
				doc_url := element.url
				doc_url.replace_substring_all ("{{doctype}}", ".html")
				Result := spaces(nesting) + "<a href='" + doc_url + "'>%N" + element.content.render(create {HTML_RENDERER},nesting+1) + spaces(nesting) + "</a>%N"
			ensure then
				valid_start_tag: result.has_substring("<a href='")
				valid_end_tag: result.has_substring("</a>")
			end


		render_image_local(element: YODA_IMAGE; nesting: INTEGER): STRING
			--Creates a new folder "resources" in the project/documentc folder if the project/document is saved, othewise
			--creates a folder "temp_output" in the working directory in the working directory.
			--Then copies the image from the local path to the "resources" folder and creates the HTML-image tags
			--with the local path from the project/document/temp folder to the image in the "resources" folder
			local
				input_file: RAW_FILE
				output_file: RAW_FILE
				output_path: PATH
				input_file_name: STRING
				input_file_path: PATH
				output_folder: DIRECTORY
				output_folder_name: STRING
			do
				-- creat "temp_output" folder if not already exists
				output_folder_name := "./temp_output"
				create output_folder.make (output_folder_name)
				if not output_folder.exists then
					output_folder.create_dir
				end
				-- create "resources" folder if not exists
				create output_folder.make (output_folder_name+"/resources")
				if not output_folder.exists then
					output_folder.create_dir
				end

				-- copy file into resources folder
				create input_file_path.make_from_string (element.content)
				input_file_name := ""
				if attached input_file_path.entry as e then
					input_file_name := e.out
				end
				create output_path.make_current
				output_path:=output_path.appended ("/temp_output/resources/" + input_file_name)
				create input_file.make_open_read (element.content)
				create output_file.make_with_path (output_path)
				output_file.open_write
				input_file.copy_to(output_file)
				output_file.close
				input_file.close

				-- write relative path for HTML
				Result := spaces(nesting) + "<img src='" + "./resources/"+ input_file_name + "' alt='" + input_file_name + " missing'><br>%N"
			ensure then
				valid_start_tag: result.has_substring("<img src='")
				valid_end_tag: result.has_substring("'><br>")
			end


		render_image_external(element: YODA_IMAGE; nesting: INTEGER): STRING
			--Creates HTML-image tags for a image with a url.
			do
				Result := spaces(nesting) + "<img src='" + element.content + "' alt='" + element.content + " missing'><br>%N"
			ensure then
				valid_start_tag: result.has_substring("<img src='")
				valid_end_tag: result.has_substring("'><br>")
			end


		render_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			--This function renders a snippet. Nothing is parsed, the whole responsibility lies on the user. The snippet content is just inserted returned with replacing
			--every newline character by a newline with the right amount of nesting spaces.
			local
				snippet_content: STRING
			do
				snippet_content := element.content
				snippet_content.replace_substring_all ("%N", "%N" + spaces(nesting))
				Result := spaces(nesting) + element.content + "%N"
			end


		render_bold(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- The bold renderer renders the text element it contains and surrounds it with html bold tags.
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
			-- The code renderer renders the text element it contains and surrounds it with html code tags.
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
			-- The italic renderer renders the text element it contains and surrounds it with html italic tags.
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
			-- The quote renderer renders the text element it contains and surrounds it with html quote tags.
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
			-- The title renderer renders the text element it contains and surrounds it with html title tags.
			local
				return_string: STRING
			do
				return_string := element.component.render(create {HTML_RENDERER}, 0)
				return_string.replace_substring_all("%N", "")
				return_string.replace_substring_all("<p>", "")
				return_string.replace_substring_all("</p>", "")
				Result := spaces(nesting) + "<h" + element.strength.out + ">" + return_string + "</h" + element.strength.out + ">%N"	--need to add strenght via element.strength
			ensure then
				valid_start_tag: Result.has_substring("<h")
				valid_end_tag: Result.has_substring("</h")
			end


		render_underline(element: TEXT_DECORATOR; nesting: INTEGER): STRING
			-- The underline renderer renders the text element it contains and surrounds it with html underline tags.
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


		render_anchor(element: YODA_ANCHOR; nesting: INTEGER): STRING
			-- Renders a span element with the id corresponding to the anchors set id, returns it as a string with the right nesting amount
			do
				Result := spaces(nesting) + "<span id='" + element.content.out + "'></span>%N"
			ensure then
				--valid_start_tag: result.has_substring("id='")
				--valid_end_tag: result.has_substring(">")
				valid_start_tag: result.has_substring("<span id='")
				valid_end_tag: result.has_substring("'></span>%N")
			end

end
