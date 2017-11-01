note
	description: "Concretete element Yoda list."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_LIST

	inherit
		YODA_ELEMENT

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
				--validation
				--comment what is done
				--make instance of ARRAY
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_list(CURRENT))
				content_array_instantiated: content /= void
				is_ordered_set: is_ordered = u_is_ordered
				content_set: content = u_content
			end

		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_LIST render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			local
    			return_string: STRING
			do
				-- Set return_string = Renderer.render_YODA_list(current, int).
    			-- Return return_string.
			end



	invariant
		content_not_empty: content.count > 0
end
