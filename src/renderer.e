note
	description: "Deferred renderer."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	RENDERER

	feature {ANY}

		spaces(n: INTEGER): STRING
			local
				str: STRING
				i: INTEGER
			do
				str := "" --Markdown is not indented
				from
					i := 1
				until
					i > n
				loop
					str := str + "%T"
					i := i + 1
				end
				Result := str
			end


		render_YODA_text(element: YODA_TEXT; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT.
			require
				text_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_YODA_table(element: YODA_TABLE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TABLE.
			require
				table_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_YODA_list(element: YODA_LIST; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LIST.
			require
				list_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_YODA_link(element: YODA_LINK; nesting: INTEGER): STRING
			-- Perform render operation on YODA_LINK.
			require
				link_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_YODA_image(element: YODA_IMAGE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_IMAGE.
			require
				image_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_YODA_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			-- Perform render operation on YODA_SNIPPET.
			require
				snipped_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_bold(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				bold_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_code(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				code_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_italic(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				italic_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_qoute(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				quote_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end

		render_title(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				quote_exists: attached element
				valid_number_of_nesting: nesting >= 0
				--stength is validated by the decorator
			deferred
			end

		render_underline(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				underline_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end


		render_anchor(element: YODA_ANCHOR; nesting: INTEGER): STRING
			-- Perform render operation on YODA_TEXT_INTERFACE.
			require
				underline_exists: attached element
				valid_number_of_nesting: nesting >= 0
			deferred
			end


end
