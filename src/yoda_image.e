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
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				placeholder: True
			do
				--comment what is done
			ensure then
				placeholder: True
			end


	invariant
		placeholder: True

end
