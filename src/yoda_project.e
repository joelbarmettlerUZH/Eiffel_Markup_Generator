note
	description: "Yoda project that contains documents."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_PROJECT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		documents: LINKED_LIST[YODA_DOCUMENT]
		name: STRING



	feature {ANY}
		make(u_name: STRING)
			--Create a new Project with a user chosen Name, instantiate the "documents" Linked-List
			require
				name_not_empty: attached u_name
			do
				name := u_name
				create documents.make
			ensure
				name_set: name = u_name
				doc_array_created: attached documents
				doc_is_empty: documents.count = 0
			end


		add_document(doc: YODA_DOCUMENT)
			--appends a YODA document to the projects documents-array
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
			--calls render for it's documents
			require else
				output_format_exists: attached output_format
				documents_not_empty: not documents.is_empty
			local
				return_array: ARRAY[STRING]
				i: INTEGER
			do
				create return_array.make_empty
				from i := documents.count
				until
					i <= 0
				loop
					return_array.force (documents[i].render (output_format), return_array.count)
					i := i - 1
				end
				Result := return_array
			ensure then
				documents_not_changed: documents.is_equal(old documents)
			end

		print_to_console
			do
				print("######################%N###PROJECT: " + name + "###%N######################%N")
				across documents.new_cursor.reversed as el
				loop
					el.item.print_to_console
				end
			print("%N")
			end


		save(output_format, folder, template: STRING)
			do
				across documents.new_cursor.reversed as el
				loop
					el.item.save (output_format, folder, template)
				end
			end

end
