note
	description: "Concrete Element YODA_IMAGE."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$15.11.2017$"

class
	YODA_IMAGE

	inherit
		YODA_ELEMENT

	create
		make,
		make_extern

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_IMAGE with a local image, validates it and sets the feature variables
			require
				String_not_void: attached u_content
				String_not_empty: u_content.count > 0
			do
				content := u_content
				name := "local image"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_image(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("local image")
			end

		make_extern(u_content: STRING)
			--Creates the YODA_IMAGE with a extern image(URL), validates it and sets the feature variables
			require
				String_not_void: attached u_content
				String_not_empty: u_content.count > 0
			do
				content := u_content
				name := "extern image"
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_extern_image(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("extern image")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Apply render_YODA_IMAGE renderer to YODA_IMAGE.
			require else
				renderer_exists: attached renderer
				valid_number_of_nesting: nesting >= 0
			do
				Result := renderer.render_yoda_image (current, nesting)
			ensure then
    			result_exists: attached result
    			content_not_changed: content.is_equal (old content)
			end


	invariant
		content_text_instantiated: attached content

end
