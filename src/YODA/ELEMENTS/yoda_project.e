note
	description: "A Yoda Project serves as a container for Yoda Documents. It allows the user to render/save all documents at once into a seperate output folder"
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	YODA_PROJECT

	create
		make

	feature	{ANY}
		--A Yoda Project has a name (which defines the name of the output folder) as well as a linked list of yoda documents it contains.
		documents: LINKED_LIST[YODA_DOCUMENT]
		name: STRING



	feature {ANY}
		make(u_name: STRING)
			--Creates a new Yoda Project with a user chosen Name and instanciates an empty linked list where the yoda documents will be stored
			require
				name_not_void: attached u_name
				name_not_empty: u_name.count > 0
				name_not_too_long: u_name.count < 150
				name_valid: valid_name(u_name)
			do
				name := u_name
				create documents.make
			ensure
				name_set: name = u_name
				doc_array_created: attached documents
				doc_is_empty: documents.count = 0
			end


		add_document(doc: YODA_DOCUMENT)
			--the add_document procedure takes a yoda document and appends it to the linnked list of documents.
			require
				doc_not_void: attached doc
			do
				documents.put_front(doc)
			ensure
				first_item_set: doc.is_equal(documents.first)
				one_more: documents.count = old documents.count + 1
				has_doc: documents.has(doc)
			end


		render(output_format: STRING): ARRAY[STRING]
			--The render function takes a string output_format that defines in what language the output shall be assembled.
			--It is required that the documents linked list is not empty.
			--For every document in the linked list, the document-render function is called with the output format as an argument
			--From the document rendering, a string is returned which gets inserted at the end of an array of strings
			--after the loop finished, this array contains string-representations of each document in the right order
			--Finally, this array is returned to the user.
			require else
				output_format_exists: attached output_format
				documents_not_empty: not documents.is_empty
			local
				return_array: ARRAY[STRING]
				i: INTEGER
			do
				create return_array.make_empty
				--loop over all documents
				from i := documents.count
				until
					i <= 0
				loop
					--render document and save result string to return_array at corresponding position i
					return_array.force (documents[i].render (output_format), return_array.count)
					i := i - 1
				end
				Result := return_array
			ensure then
				documents_not_changed: documents.is_equal(old documents)
			end


		print_to_console
			--This procedure allows the user to print all documents that he's got in the current project, as well as all the elements these documents contain
			--So the procedure just prints the name of the project and then calls, for each document, its print_to_console procedure again
			do
				print("######################%N###PROJECT: " + name + "###%N######################%N")
				across documents.new_cursor.reversed as el
				loop
					el.item.print_to_console
				end
			print("%N")
			end


		save(output_format, template: STRING)
			--The save-procedure creates a temporary output folder temp_output (deletes old one first when already existing) in which the elements will store their resources when being rendered
			--Then, for every document in the project, the project is being saved with the save_document procedure, and the temp folder is renamed with the corresponding project name
			--stores those file in a new folder
			--The content will be wriiten into the template where the placeholder-tag "{{CONTENT}}" is placed
			require else
				output_format_exists: attached output_format
				documents_not_empty: not documents.is_empty
				template_valid: is_valid_template(template)
			local
				output_folder: DIRECTORY
				new_name: PATH
				project_folder: DIRECTORY
				output_folder_name: STRING
			do
				-- creat temp folder
				output_folder_name := "temp_output"
				create output_folder.make (output_folder_name)
				if
					not output_folder.exists
				then
					output_folder.create_dir
				else
					output_folder.delete_content
					output_folder.delete
					output_folder.create_dir
				end
				-- save documents to temp folder
				across documents.new_cursor.reversed as el
				loop
					el.item.save_document (output_format, output_folder.path.out , template)
				end
				--rename temp folder to projectname_output folder
				create new_name.make_from_string (name+"_output")
				create project_folder.make_with_path (new_name)
				if
					not project_folder.exists
				then
					output_folder.rename_path (new_name)
				else
					project_folder.delete_content
					project_folder.delete
					output_folder.rename_path (new_name)
				end
			end


		valid_name(project_name: STRING): BOOLEAN
			--function to check if the name applied to the project is vaild, means it can be used as a folder name for the
			--generation of the output folder.
			local
				prohibited_characters: ARRAY[CHARACTER]
			do
				prohibited_characters := << '"','~','#','*','&','{','}','\',':','>','<','/','+','%%','|','?','.' >>
				Result := True
				across prohibited_characters as prohib
				loop
					if project_name.has(prohib.item)then
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
		documents_existing: attached documents
		name_set: attached name
		name_not_empty: name.count > 0

end
