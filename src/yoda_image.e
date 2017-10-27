note
	description: "Summary description for {YODA_IMAGE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

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


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				render_obj /= void

			do
				--comment what is done
			ensure then
			end


	invariant
		content_text_instantiated: content /= void

end
