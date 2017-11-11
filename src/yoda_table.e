note
	description: "Summary description for {YODA_TABLE}."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_TABLE

	inherit
		YODA_ELEMENT

	redefine
		as_string
	end

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
				name := "table"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_table(CURRENT))
				name_set: name.is_equal("table")
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


		as_string(nesting: INTEGER): STRING
			local
				result_string: STRING
				row, column: INTEGER
			do
				result_string := spaces("-", nesting)+ name + ":%N" + spaces(" ", nesting+1) + " " + spaces("-", content.width*5) + "%N"
				from row := 1
				until row > content.height
				loop
					result_string := result_string + spaces("-", nesting+1)
					from column := 1
					until column > content.width
					loop
						result_string := result_string + "|" + content[row, column].name
						column := column + 1
					end
					result_string := result_string + "|%N" + spaces(" ", nesting+1) + " " + spaces("-", content.width*5) + "%N"
					row := row + 1
				end
				Result := result_string
			end


	invariant
		content_exists: attached content

end
