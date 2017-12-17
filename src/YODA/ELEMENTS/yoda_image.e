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
		make_local,
		make_external

	feature	{RENDERER, VALIDATOR, YODA_ELEMENT, EQA_TEST_SET}
		--name and documents shall be public, allow access for everybody
		content: STRING
		is_extern: BOOLEAN


	feature {ANY}
		make_local(u_content: STRING)
			--Creates the YODA_IMAGE with a local image, validates it and sets the feature variables
			require
				image_content_exists: attached u_content
				string_not_empty: u_content.count > 0
				File_exists: is_valid_file(u_content)
			do
				--set content
				content := u_content
				name := "local image"
				is_extern := FALSE
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_image(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("local image")
			end


		make_external(u_content: STRING)
			--Creates the YODA_IMAGE with a extern image(URL), validates it and sets the feature variables
			require
				image_content_exists: attached u_content
				string_not_empty: u_content.count > 0
			do
				content := u_content
				name := "external image"
				is_extern := TRUE
			ensure
				valid_for_all_langauges: validation_langauges.for_all(agent {VALIDATOR}.validate_image(CURRENT))
				content_set: content = u_content
				name_set: name.is_equal("external image")
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			--Apply render_YODA_IMAGE renderer to YODA_IMAGE.
			do
				if is_extern then
					Result := renderer.render_image_external (current, nesting)
				else
					Result := renderer.render_image_local (current, nesting)
				end
			end


	invariant
		content_not_void: attached content
		content_not_empty: content.count > 0
		is_in_or_extern: attached is_extern

end
