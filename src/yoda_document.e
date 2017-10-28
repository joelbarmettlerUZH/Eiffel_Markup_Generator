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
				attached u_name
				u_name_not_empty: u_name /= void
			do
				--class variable name = u_name
				--instanciate document
			ensure
				name_not_empty: name = u_name
			end


		add_element(element: YODA_ELEMENT)
			--adds a Yoda element to the class variable elements: linked list
			require
				element_not_empty: element /= void
			do
				--add element to list of elements
			ensure
				elements_not_empty: not elements.is_empty
			end


		render(output_format: STRING): STRING
			require
				output_format_not_void: output_format /= void
				output_format_not_empty: not output_format.is_empty
			do
				--instanciation of needed renderer calls sub renderer if existing
			end


	invariant
		name_never_void: name /= void implies name.count > 0
end
