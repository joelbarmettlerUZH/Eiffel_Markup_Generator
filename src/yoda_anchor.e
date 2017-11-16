note
	description: "Concrete element Yoda link."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_ANCHOR

	inherit
		YODA_ELEMENT

	create
		make

	feature	{ANY}
		id: STRING

	feature {ANY}
		make(u_id: STRING)
			--Creates the external YODA_ANCHOR, validates it and sets the feature variables
			require
				u_id_not_void: attached u_id
				u_id_not_zero: u_id.count > 0
			do
				name := "anchor Link"
				id := u_id
			ensure
				id_set: u_id.is_equal (id)
				name_set: name.is_equal("anchor Link")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Applies YODA_ANCHOR render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_anchor(current, nesting) returns a String that replaces the YODA_tags
			--with the corresponding HTML tags, inserts the spacing and
			--the needed span id (element.id) and assigns it to the Result.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			do
				Result := renderer.render_anchor (current, nesting)
			ensure then
    			result_exists: attached result
    		end
end
