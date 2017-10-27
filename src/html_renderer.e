note
	description: "Concrete renderer that converts the concrete elements into html."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	HTML_RENDERER

	inherit
		RENDERER

	create
		make

	feature {ANY}
		corresponding_HTML_tag: ARRAY[STRING]
			-- Store the HTML equivalents for all YODA tags.


	feature {ANY}
		make()
			-- Create HTML_Renderer.
			do
				-- Create HTML_Renderer.
			end


		render_YODA_text_interface(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				text_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			local
				return_string: STRING
				content: STRING
			do
				-- Add <p> to return_string.
				-- Set content = element.Content.
				-- Loop through YODA-tag and replace in scan element.Content for each YODA_tag the corresponding HTML tag and update content.
				-- Add content to return_string
				-- Add <\p> to return_string
				-- Return return_string
			ensure
				valid_start_tag: return_string.has_prefix("<p>")
				valid_end_tag: return_string.has_suffix ("<\p>")
			end


		render_YODA_table(element: YODA_TABLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TABLE.
			require
				table_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			local
				return_string: STRING
				content: STRING
			do
				-- Add <table> to return_string.
				-- Set content = element.Content.
				-- Loop through all element.Content elements and surround each tablerow with <tr>...</tr> and each element with <th>...</th> and update content.
				-- Add content to return_string
				-- Add <\table> to return_string
				-- Return return_string
			ensure
				valid_start_tag: return_string.has_prefix("<table>")
				valid_end_tag: return_string.has_suffix ("<\table>")
			end


		render_YODA_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LIST.
			require
				list_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			local
				return_string: STRING
				content: STRING
			do
				-- Add <ul> to return_string.
				-- Set content = element.Content.
				-- Loop through all element.Content elements and surround each element with <li>...</li> and update content.
				-- Add content to return_string
				-- Add <\ul> to return_string
				-- Return return_string
			ensure
				valid_start_tag: return_string.has_prefix("<ul>")
				valid_end_tag: return_string.has_suffix("<\ul>")
			end


		render_YODA_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			require
				link_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Surround element.Content with the corresponding HTML-tag.
			ensure
				valid_start_tag: return_string.has_prefix("<link href='")
				valid_end_tag: return_string.has_suffix("'>")
			end


		render_YODA_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			require
				image_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			local
				return_string: STRING
				content: STRING
			do
				-- Add <img src= to return_string.
				-- Add element.Content to return_string.
				-- Add > to return_string
				-- Return return_string
			ensure
				valid_start_tag: return_string.has_prefix("<img src='")
				valid_end_tag: return_string.has_suffix("'>")
			end

		render_YODA_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			require
				snipped_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- return YODA_SNIPPET.content
			end

end
