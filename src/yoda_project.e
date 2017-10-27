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
				name_not_empty: u_name /= VOID and then u_name.is_empty
			do
				name := u_name
				create documents.make
			ensure
				name_set: name = u_name
				doc_array_created: documents /= void
				doc_is_empty: documents.count = 0
			end


		add_document(doc: YODA_DOCUMENT)
			--appends a YODA document to the projects documents-array
			require
				doc_not_void: doc /= Void
			do
				--comment what is done
			ensure
				last_item_set: doc.is_equal(documents.last)
				documents_grew: documents.count = old documents.count + 1
				documents_has_doc: documents.has(doc)
			end


		render(output_format: STRING): STRING
			--calls render for it's documents
			require else
				documents_not_empty: not documents.is_empty
			do
				--comment what is done
			ensure then
				documents_not_changed: documents.is_equal(old documents)
			end


	invariant
		doc_never_void: documents /= void implies documents.count > 0

end
