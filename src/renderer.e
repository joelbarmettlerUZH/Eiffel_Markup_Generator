note
	description: "Deferred renderer."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	RENDERER

	feature {ANY}
--		render_multiple_elements(elements: ARRAY[YODA_ELEMENT]; render_obj: RENDERER; nesting: INTEGER): STRING
--			--some fancy comment
--			require
--				placeholder: True
--			do
--				--describe what is done
--			ensure
--				placeholder: True
--			end



--		render(element: YODA_ELEMENT): STRING
--			--some fancy comment
--			require
--				placeholder: True
--			deferred
--			ensure
--				placeholder: True
--			end
--

		render_text(element: YODA_TEXT; nesting: INTEGER): STRING
			--Perform render operation on YODA_TEXT
			require
				text_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			ensure
				placeholder: True
			end

		render_table(element: YODA_TABLE; nesting: INTEGER): STRING
			--Perform render operation on YODA_TABLE
			require
				table_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_list(element: YODA_LIST; nesting: INTEGER): STRING
			--Perform render operation on YODA_LIST
			require
				list_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_link(element: YODA_LINK; nesting: INTEGER): STRING
			--Perform render operation on YODA_LINK
			require
				link_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			--Perform render operation on YODA_IMAGE
			require
				image_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_snipped(element: YODA_SNIPPET; nesting: INTEGER): STRING
			--Perform render operation on YODA_SNIPPET
			require
				snipped_exists: element /= Void
				valid_number_of_nesting: nesting >= 0
			deferred
			end

	invariant
		placeholder: True

end
