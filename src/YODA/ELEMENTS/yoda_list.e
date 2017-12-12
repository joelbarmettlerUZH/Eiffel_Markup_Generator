note
	description: "Concrete Element YODA_LIST."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

class
	YODA_LIST

	inherit
		YODA_ELEMENT

	redefine
		as_string
	end

	create
		make

	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		--content and is_ordered public, allow access for everybody
		content: ARRAY[YODA_ELEMENT]
		is_ordered: BOOLEAN


	feature {ANY}
		make(u_content: ARRAY[YODA_ELEMENT]; u_is_ordered: BOOLEAN)
			--Creates the YODA_LIST, validates it and sets the feature variables
			--Validator gets called in order to ensure that a list remains valid for all languages.
			require else
				list_content_exists: attached u_content
				array_not_empty: u_content.count > 0
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
			--Applies YODA_LIST render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_list(current, nesting) returns a String that replaces the YODA_tags with the corresponding HTML tags
			--such that it is possible to distinguish for the renderer wether it is a ordered or unordered list
			--and assigns it to the Result.
			do
				Result := renderer.render_list (current, nesting)
			end


		as_string(nesting: INTEGER): STRING
			--Uses spaces function from parent class in order to concatenate the right amount
			--of spaces. Futher it loops through current array of elements to concatenate the resulted
			--string with the nested string representation.
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
		content_not_void: attached content
		content_not_empty: content.count > 0
		ordered_or_unordered: attached is_ordered
end
