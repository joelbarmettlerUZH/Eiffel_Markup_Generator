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
		make_string,
		make_file

	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		--content public, allow access for everybody
		content: STRING


	feature {ANY}
		make_string(u_content: STRING)
			--Creates the YODA_SNIPPET, validates it and sets the feature variables
			--Validator gets called in order to ensure that a snippet remains valid for all languages.
			require
				snippet_content_exists: attached u_content
				string_not_empty: u_content.count > 0
			do
				content := u_content
				name := "snippet"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_snippet(CURRENT))
				name_set: name.is_equal("snippet")
				content_set: content = u_content
			end


		make_file(filepath: STRING)
			--Creates the YODA_SNIPPET with content from file at filepath, sets content to the file-content, validates it and sets the feature variables
			--Validator gets called in order to ensure that a snippet remains valid for all languages.
			require
				snippet_content_exists: attached filepath
				string_not_empty: not filepath.is_empty
				file_is_valid: is_valid_file(filepath)
			local
				input_file: PLAIN_TEXT_FILE
			do
				create input_file.make_open_read (filepath)
				input_file.read_stream (input_file.count)
				content := input_file.last_string
				name := "snippet"
			ensure then
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_snippet(CURRENT))
				name_set: name.is_equal("snippet")
			end



		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Applies YODA_Snippet render to a class of type renderer as for example HTML_RENDERER.
			--renderer.render_yoda_snippet(current, nesting) returns a String that replaces the YODA_tags with the corresponding HTML tags
			--and assigns it to the Result.
			do
				Result := renderer.render_snippet (current, nesting)
			end


	invariant
		content_not_void: attached content
		content_not_empty: content.count > 0

end
