note
	description: "Summary description for {YODA_TABLE}."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_TABLE

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: ARRAY2[YODA_ELEMENT]


	feature {ANY}
		make(u_content: ARRAY2[YODA_ELEMENT])
			--Creates the YODA_TABLE, validates it and sets the feature variables
			require
				u_content_exists: attached u_content
				u_content.count > 0
			do
				content := u_content
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_table(CURRENT))
			end



		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_TABLE render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
  			do
    			Result := renderer.render_yoda_table (current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
			end



	invariant
		content_exists: attached content

end
