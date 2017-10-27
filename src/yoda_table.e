note
	description: "Summary description for {YODA_TABLE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_TABLE

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: ARRAY2[YODA_ELEMENT]


	feature {ANY}
		make(u_content: ARRAY2[YODA_ELEMENT])
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_table(?))
				placeholder: True
			end



		render(render_obj: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_TABLE render to renderer.
			require
				renderer_exists: renderer /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Calls Renderer.render_table(current, int).
			ensure then
				placeholder: True
			end


	invariant
		placeholder: True

end
