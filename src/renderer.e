note
	description: "Deferred renderer."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

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
