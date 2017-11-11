note
	description: "Document that contain elements."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"
class
	YODA_DOCUMENT

	create
		make

	feature {ANY}
		--name and elements shall be public, allow access for everybody
		elements: LINKED_LIST[YODA_ELEMENT]
		renderer_instances: ARRAY[RENDERER]
		renderer_names: ARRAY[STRING]
		name: STRING

	feature {ANY}
		make(u_name: STRING)
			--creates instance of document, uses name for it
			require
				u_name_exists: attached u_name
			do
				name := u_name
				create elements.make
				renderer_names := <<"HTML">>
				renderer_instances := <<create {HTML_RENDERER}>>

			ensure
				name_not_empty: name = u_name
				renderer_instances_array_created: attached renderer_instances
				renderer_names_array_created: attached renderer_names
			end


		add_element(element: YODA_ELEMENT)
			--adds a Yoda element to the class variable elements: linked list
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
			require
				output_format_exists: attached output_format
				output_format_not_empty: not output_format.is_empty
			local
				return_string: STRING
				renderer: RENDERER
				i: INTEGER
			do
				renderer := create {HTML_RENDERER}
				output_format.to_upper
				return_string := ""
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
				across elements.new_cursor.reversed as element
				loop
					return_string := return_string + element.item.render (renderer, 0)
				end
				--instanciation of needed renderer calls sub renderer if existing
				Result := return_string
			end

		print_to_console
			local
				print_string: STRING
			do
				print_string := "**********************%N***DOCUMENT: " + name + "***%N**********************%N"
				across elements.new_cursor.reversed as el
				loop
					print_string := print_string + el.item.as_string (1)
				end
				print(print_string + "%N")
			end


		save(output_format,folder,  template: STRING)
			require
				valid_template: True
			local
				input_file: PLAIN_TEXT_FILE
				output_file: PLAIN_TEXT_FILE
				file_content: STRING
				rendered_string: STRING
			do
				create input_file.make_open_read (template)
				input_file.read_stream (input_file.count)
				file_content := input_file.last_string
				rendered_string := current.render (output_format)
				file_content.replace_substring_all ("{{CONTENT}}", rendered_string)
				input_file.close
				create output_file.make_open_write (folder + "/" + current.name + "." + output_format)
				output_file.put_string (file_content)
				output_file.close
			end


	invariant
		name_never_void: name /= void implies name.count > 0
end
