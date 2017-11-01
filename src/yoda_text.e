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
		is_quote, is_code, is_bold, is_italic, is_underline: BOOLEAN
		strenght: INTEGER


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_TEXT, validates it and sets the feature variables
			require else
				u_content_not_void: attached u_content
				u_content_not_empty: u_content.count > 0
			do
				--validation
				--comment what is done
				--make instance of TEXT
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_list(CURRENT))
				content_set: content = u_content
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_TEXT render to renderer.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			local
    			return_string: STRING
 			do
    			-- Set return_string = Renderer.render_YODA_text_interface(current, int).
    			-- Return return_string.
			end


	invariant
		content_text_instantiated: attached content
end
