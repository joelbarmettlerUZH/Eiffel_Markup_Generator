note
	description: "Concrete element Yoda text."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_TEXT

	inherit
		YODA_TEXT_INTERFACE

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_TEXT, validates it and sets the feature variables
			require
				u_content_not_void: attached u_content
				u_content_not_empty: u_content.count > 0
			do
				content := u_content
				name := "text"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_text(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("text")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_TEXT render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			do
    			Result := renderer.render_yoda_text(current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
			end


	invariant
		content_text_instantiated: attached content
end

