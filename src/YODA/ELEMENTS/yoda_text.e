note
	description: "Concrete Element YODA_TEXT."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	YODA_TEXT

	inherit
		YODA_TEXT_INTERFACE

	create
		make

	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		--content of text is public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_TEXT that will be created in the factory of the YODA class, validates it and sets the content and name variables
			require
				text_content_exists: attached u_content
				text_not_empty: u_content.count > 0
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
			do
    			Result := renderer.render_text(current, nesting)
			end


	invariant
		content_not_void: attached content
		content_not_empty: content.count > 0
end

