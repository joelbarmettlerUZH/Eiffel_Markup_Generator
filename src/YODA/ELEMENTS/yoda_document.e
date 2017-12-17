note
	description: "Concrete Element YODA_DOCUMENT."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"
class
	YODA_DOCUMENT

	create
		make

	feature {ANY}
		--A document is characterized by the elements it contains, its specific user-given name and the information about what output langauges are supported.
		elements: LINKED_LIST[YODA_ELEMENT]
		renderer_instances: ARRAY[RENDERER]
		renderer_names: ARRAY[STRING]
		name: STRING

	feature {ANY}
		make(u_name: STRING)
			--The make procedure sets the name of the document and instanciates the two arrays that represent the possible render outputs.
			--When a new output-language gets supported, the yoda-developers need to add, for each new language, the name of the language
			--to the renderer_names and an instance of the langauge renderer to renderer_instances.
			require
				u_name_exists: attached u_name
				name_not_empty: u_name.count > 0
				name_not_too_long: u_name.count < 150
				name_valid: valid_name(u_name)
			do
				name := u_name
				create elements.make
				--Each index in renderer_names and renderer_instances has to correspond, so the HTML_RENDERER and the String HTML have both index 0.
				renderer_names := <<"html">>
				renderer_instances := <<create {HTML_RENDERER}>>

			ensure
				name_not_empty: name = u_name
				renderer_instances_array_created: attached renderer_instances
				renderer_names_array_created: attached renderer_names
				elements_is_empty: elements.count = 0
			end


		add_element(element: YODA_ELEMENT)
			--This procedure takes a yoda_element and adds appends it to the linked-list of elements that this document currently holds.
			require
				element_exists: attached element
			do
				elements.put_front (element)
			ensure
				first_item_set: element.is_equal(elements.first)
				one_more: elements.count = old elements.count + 1
				has_element: elements.has(element)
			end


		render(output_format: STRING): STRING
			--The render-procedure takes the wished output_format from the user. It then loops through the renderer_names and finds the one name that corresponds to the users wished output format
			--If the users wished output format is not in the supported languages, it choses the HTML_Renderer by default.
			--Next, the renderer loops over the array of elements and, for each element, calls its render-function with the corresponding RENDERER instance.
			--The return value from each element is a string with its representation in the chosen language, this string-representation is added to an overall string
			--named return_string which, after the loop, contains all individual element-representation. This return_string is finally returned to the user.
			require
				output_format_exists: attached output_format
				output_format_not_empty: not output_format.is_empty
				elements_not_empty: not elements.is_empty
			local
				return_string: STRING
				renderer: RENDERER
				i: INTEGER
				next_id: INTEGER
			do
				next_id := 1
				--by default, assume the wished language is HTML. Gets overwritten when the user specifies another supported language
				renderer := create {HTML_RENDERER}
				output_format.to_lower
				return_string := ""
				--instanciation of needed renderer calls sub renderer if existing
				Result := return_string
				--find the wished output-language
				from
					i := 1
				until
					i > renderer_names.count
				loop
					if renderer_names[i].is_equal (output_format) then
						renderer := renderer_instances[i]
					end
					i := i + 1
				end
				next_id := 1
				--render each elemet with the defined renderer, add the returned string representation to the return_string
				across elements.new_cursor.reversed as element
				loop
					return_string := return_string + element.item.render (renderer, 0)
					next_id := next_id + 1
				end
				--instanciation of needed renderer calls sub renderer if existing
				Result := return_string
			end


		print_to_console
			--The print_to_console procedure loops over the elements and calls their printing representation for the console
			local
				print_string: STRING
			do
				print_string := "**********************%N***DOCUMENT: " + name + "***%N**********************%N"
				across elements.new_cursor.reversed as el
				loop
					print_string := print_string + el.item.as_string (1)
				end
				io.output.put_string(print_string + "%N")
			end


		save(output_format,  template: STRING)
			--The save procedure allows the user to save a document to the disk. For this reason, the user specifies an output format like he does in "render"
			--but als a template in which the produces string gets injected. The save-procedure creates a temp_output folder in which the elmenets can save their used content
			--from the disk, like images. He then calls the save_document procedure in itself, which does the actual saving part. Afterwords, the folder gets renamed with a name
			--corresponding to the document name.
			--In fact, we have two save funtions. The function that does the actual rendering and saving is the save_document function. The purpose of this save function here
			--is that the user shall be allowed to only render one document without the whole project, and therefore such a temp_output folder is needed, which is created and renamed
			--by this function here.
			require
				output_format_exists: attached output_format
				elements_not_empty: not elements.is_empty
				template_valid: is_valid_template(template)
			local
				output_folder_name: STRING
				output_folder: DIRECTORY
				new_name: PATH
				document_folder: DIRECTORY
			do
				-- creat temporary output_folder
				output_folder_name := "temp_output"
				create output_folder.make (output_folder_name)
				if
					not output_folder.exists
				then
					output_folder.create_dir
				else
					output_folder.recursive_delete
					output_folder.create_dir
				end
				-- save current document into the output_folder
				current.save_document (output_format, output_folder.path.out , template)
				-- rename output folder from "temp_output" to "DOCUMENTNAME_output"
				create new_name.make_from_string (name+"_output")
				create document_folder.make_with_path (new_name)
				if
					not document_folder.exists
				then
					output_folder.rename_path (new_name)
				else
					document_folder.delete_content
					document_folder.delete
					output_folder.rename_path (new_name)
				end
			end


		save_document(output_format, folder,  template: STRING)
			--The save_document procedure does the actual saving part. The procedure needs an output format, a folder and a template. The output_format and template is user-chosen, the folder
			--is chosen by the save procedure from either document or project. The save_document procedure opens the template and replaces the {{CONTENT}} tag inside the template with
			--the string-representation of the document, which is produced by the render function of the document. The save_document procedure then saves the document with the correct
			--filename and filetype into the specified folder.
			--The content will be wriiten into the template where the placeholder-tag "{{content}}" is placed
			require
				output_format_exists: attached output_format
				elements_not_empty: not elements.is_empty
				template_valid: is_valid_template(template)
			local
				input_file: PLAIN_TEXT_FILE
				output_file: PLAIN_TEXT_FILE
				file_content: STRING
				rendered_string: STRING
			do
				--open template
				create input_file.make_open_read (template)
				input_file.read_stream (input_file.count)
				file_content := input_file.last_string
				--render document
				rendered_string := current.render (output_format)
				--replace content tag by rendered content
				file_content.replace_substring_all ("{{CONTENT}}", rendered_string)
				input_file.close
				--output the file with documentname + filetype to the given folder
				create output_file.make_open_write (folder + "/" + current.name + "." + output_format)
				output_file.put_string (file_content)
				output_file.close
			end


		valid_name(document_name: STRING): BOOLEAN
			--function to check if the name applied to the document is vaild, means it can be used as a file name for the
			--generation of the output file.
			local
				prohibited_characters: ARRAY[CHARACTER]
			do
				prohibited_characters := << '"','~','#','*','&','{','}','\',':','>','<','/','+','%%','|','?','.' >>
				Result := True
				across prohibited_characters as prohib
				loop
					if document_name.has(prohib.item)then
						Result := False
					end
				end
			end

		is_valid_template(path_string: STRING): BOOLEAN
			--function to check if the template given via the path-string is a valid template, so if it exists and if it contains the
			--correct placeholder tag "{{CONTENT}}"
			local
				input_file: RAW_FILE
			do
				--check whether the file acutally exists locally
				create input_file.make_with_name (path_string)
				if not input_file.exists then
					Result := False
				else
					create input_file.make_open_read (path_string)
					input_file.read_stream (input_file.count)
					Result := input_file.last_string.has_substring("{{CONTENT}}")
					input_file.close
				end
			end


	invariant
		name_set: attached name
		name_not_empty: name.count > 0
		at_lest_one_renderer: renderer_instances.count > 0 and renderer_names.count > 0
		elements_existing: attached elements
end
