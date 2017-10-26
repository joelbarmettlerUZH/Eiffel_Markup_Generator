note
	description: "Summary description for {HTML_RENDERER}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	HTML_RENDERER

	inherit
		RENDERER

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		keys, values: ARRAY[STRING]


	feature {ANY}
		make()
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render_text(element: YODA_TEXT; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render_table(element: YODA_TABLE; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render_list(element: YODA_LIST; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render_link(element: YODA_LINK; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end

		render_image(element: YODA_SNIPPET; nesting: INTEGER): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


	invariant
		placeholder: True

end
