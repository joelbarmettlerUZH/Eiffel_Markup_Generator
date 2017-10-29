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
				--instantiates a table
				--sets feature variables
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_table(?))
			end



		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_TABLE render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			local
    			return_string: STRING
  			do
    			-- Set return_string = Renderer.render_YODA_table(current, int).
    			-- Return return_string.	
			end



	invariant
		content_exists: attached content

end
