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
				--class variable name = u_name
				--instanciate document
				name := u_name
				create elements.make
				create renderer_instances.make_empty
				create renderer_names.make_empty
				renderer_instances.force (create {HTML_RENDERER}, renderer_instances.count)
				renderer_names.force ("HTML", renderer_names.count)
			ensure
				name_not_empty: name = u_name
			end


		add_element(element: YODA_ELEMENT)
			--adds a Yoda element to the class variable elements: linked list
			require
				element_exists: attached element
			do
				--add element to list of elements
			ensure
				elements_not_empty: not elements.is_empty
			end


		render(output_format: STRING): STRING
			require
				output_format_exists: attached output_format
				output_format_not_empty: not output_format.is_empty
			do
				--instanciation of needed renderer calls sub renderer if existing
				Result := "TEST: YODA DOCUMENT RENDERED"
			end


	invariant
		name_never_void: name /= void implies name.count > 0
end
