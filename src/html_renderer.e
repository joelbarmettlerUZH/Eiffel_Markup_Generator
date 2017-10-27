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
			-- Create HTML_Renderer.
			require
				placeholder: True
			do
				-- Create HTML_Renderer.
			ensure
				placeholder: True
			end


		render_text(element: YODA_TEXT; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT.
			require
				text_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end


		render_table(element: YODA_TABLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TABLE.
			require
				table_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end


		render_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LIST.
			require
				list_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end


		render_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			require
				link_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end


		render_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			require
				image_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end

		render_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			require
				snipped_exists: element /= Void
				nesting_exists: nesting /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with HTML-tags.
			ensure
				placeholder: True
			end


	invariant
		placeholder: True

end
