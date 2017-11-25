note
	description: "Deferred renderer."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

deferred class
	RENDERER

	feature {YODA_ELEMENT, EQA_TEST_SET}

		spaces(n: INTEGER): STRING
			--When rendering a certain output language, we need to have the right number of indentations, corresponding to the nesting factor of an element.
			--In html, an element that is nested into another one has one more indentation, so one more tab.
			--This short function here takes the number of indentation, n, and returns a string with n Tabs in it, so n*%T
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


		render_text(element: YODA_TEXT; nesting: INTEGER): STRING
			--Takes a YODA_TEXT element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				text_exists: attached element
			deferred
			end


		render_table(element: YODA_TABLE; nesting: INTEGER): STRING
			--Takes a YODA_TABLE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				table_exists: attached element
			deferred
			end


		render_list(element: YODA_LIST; nesting: INTEGER): STRING
			--Takes a YODA_TEXT element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				list_exists: attached element
			deferred
			end


		render_link(element: YODA_LINK; nesting: INTEGER): STRING
			--Takes a YODA_TEXT element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				link_exists: attached element
			deferred
			end


		render_image_local(element: YODA_IMAGE; nesting: INTEGER): STRING
			--Takes a YODA_IMAGE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				image_exists: attached element
			deferred
			end

		render_image_external(element: YODA_IMAGE; nesting: INTEGER): STRING
			--Takes a YODA_IMAGE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				image_exists: attached element
			deferred
			end


		render_snippet(element: YODA_SNIPPET; nesting: INTEGER): STRING
			--Takes a YODA_SNIPPET element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				snipped_exists: attached element
			deferred
			end


		render_bold(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				bold_exists: attached element
			deferred
			end


		render_code(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				code_exists: attached element
			deferred
			end


		render_italic(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				italic_exists: attached element
			deferred
			end


		render_qoute(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				quote_exists: attached element
			deferred
			end


		render_title(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				quote_exists: attached element
				--stength is validated by the decorator
			deferred
			end


		render_underline(element: YODA_TEXT_INTERFACE; nesting: INTEGER): STRING
			--Takes a YODA_TEXT_INTERFACE element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				underline_exists: attached element
			deferred
			end


		render_anchor(element: YODA_ANCHOR; nesting: INTEGER): STRING
			--Takes a YODA_ANCHOR element, renders it according to the languages standards and returns a String representing the content in the specific language
			require
				underline_exists: attached element
			deferred
			end


end
