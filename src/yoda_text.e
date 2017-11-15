note
	description: "Concrete element Yoda text."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	YODA_TEXT

	inherit
		YODA_TEXT_INTERFACE

	create
		make

	feature {ANY}
		--content of text is public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_TEXT that will be created in the factory of the YODA class, validates it and sets the content and name variables
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
			--Applies YODA_TEXT render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_text(current, nesting) returns a String that replaces the YODA_tags with the corresponding HTML tags
			--and assigns it to the Result.
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

