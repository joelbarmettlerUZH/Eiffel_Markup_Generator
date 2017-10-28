note
	description: "Summary description for {YODA_SNIPPET}."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	YODA_SNIPPET

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: STRING


	feature {ANY}
		make(u_content: STRING)
			--Creates the YODA_SNIPPET, validates it and sets the feature variables
			require else
				placeholder: True
			do
				--comment what is done
			ensure then
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_snippet(?))
				placeholder: True
			end



		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_SNIPPET render to renderer.
			require else
				renderer_exists: renderer /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Calls Renderer.render_snippet(current, int).
			ensure then
				placeholder: True = True
			end


	invariant
		placeholder: True

end
