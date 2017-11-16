note
	description: "Concrete Element YODA_SNIPPET."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$16.11.2017$"

class
	YODA_SNIPPET

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--content public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_SNIPPET, validates it and sets the feature variables
			--Validator gets called in order to ensure that a snippet remains valid for all languages.
			do
				content := u_content
				name := "snippet"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_snippet(CURRENT))
				name_set: name.is_equal("snippet")
			end



		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Applies YODA_Snippet render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_snippet(current, nesting) returns a String that replaces the YODA_tags with the corresponding HTML tags
			--and assigns it to the Result.
			require else
				renderer_exists: renderer /= Void
				valid_number_of_nesting: nesting >= 0
			do
				Result := renderer.render_yoda_snippet (current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
			end


	invariant
		placeholder: True

end
