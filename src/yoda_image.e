note
	description: "Concrete element Yoda image."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_IMAGE

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			require
				placeholder: True
				String_not_void: u_content /= void
				String_not_empty: u_content.count > 0
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_image(?))
				placeholder: True
			end


		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_IMAGE render to renderer.
			require
				renderer_exists: renderer /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Calls Renderer.render_image(current, int)
			ensure then
				result_is_YODA_LINK: {t: String} Result
			end


	invariant
		content_text_instantiated: content /= void

end
