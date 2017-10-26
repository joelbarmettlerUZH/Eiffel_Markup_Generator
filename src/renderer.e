note
	description: "Summary description for {RENDERER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	RENDERER

	feature {ANY}
		render_multiple_elements(elements: ARRAY[YODA_ELEMENT]; render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--describe what is done
			ensure
				placeholder: True
			end



		render(element: YODA_ELEMENT): STRING
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end
			


	invariant
		placeholder: True

end
