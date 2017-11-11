note
	description: "Concretete element Yoda list."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_LIST

	inherit
		YODA_ELEMENT

	redefine
		as_string
	end

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: ARRAY[YODA_ELEMENT]
		is_ordered: BOOLEAN


	feature {ANY}
		make(u_content: ARRAY[YODA_ELEMENT]; u_is_ordered: BOOLEAN)
			--Creates the YODA_LIST, validates it and sets the feature variables
			require else
				u_content_not_void: attached u_content
				u_content_not_empty: u_content.count > 0
			do
				content := u_content
				is_ordered := u_is_ordered
				name := "list"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_list(CURRENT))
				content_array_instantiated: content /= void
				is_ordered_set: is_ordered = u_is_ordered
				content_set: content = u_content
				name_set: name.is_equal("list")
			end

		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_LIST render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			do
				Result := renderer.render_yoda_list (current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
			end

		as_string(nesting: INTEGER): STRING
			local
				result_string: STRING
			do
				result_string := spaces("-", nesting) + name + ":%N"
				across content as element
				loop
					result_string := result_string + element.item.as_string (nesting+1)
				end
				Result := result_string
			end

	invariant
		content_not_empty: content.count > 0
end
