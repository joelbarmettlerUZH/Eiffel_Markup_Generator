note
	description: "Concrete Element YODA_ANCHOR."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

class
	YODA_ANCHOR

	inherit
		YODA_ELEMENT

	create
		make


	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		content: STRING


	feature {ANY}
		make(u_id: STRING)
			--Creates the external YODA_ANCHOR, validates it and sets the feature variables
			require
				id_exists: attached u_id
				id_not_empty: u_id.count > 0
			do
				name := "anchor point"
				content := u_id
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_anchor(CURRENT))
				id_set: u_id.is_equal (content)
				name_set: name.is_equal("anchor point")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Applies YODA_ANCHOR render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_anchor(current, nesting) returns a String that replaces the YODA_tags
			--with the corresponding HTML tags, inserts the spacing and
			--the needed span id (element.id) and assigns it to the Result.
			do
				Result := renderer.render_anchor (current, nesting)
    		end


    invariant
		content_not_void: attached content
		content_not_empty: content.count > 0

end
