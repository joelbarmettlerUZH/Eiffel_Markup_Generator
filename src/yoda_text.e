note
	description: "Summary description for {YODA_TEXT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_TEXT

	inherit
		TEXT_INTERFACE

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: STRING
		is_quote, is_code, is_bold, is_italic, is_underline: BOOLEAN
		strenght: INTEGER


	feature {ANY}
		make(u_content: STRING)
			--some fancy comment
			require else
				u_content_not_void: u_content /= void
				u_content_not_empty: u_content.count > 0
			do
				--validation
				--comment what is done
				--make instance of TEXT
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure then
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_text(?))
				content_text_instantiated: content /= void
				content_set: content = u_content
			end


		bold(u_content: STRING): STRING
			--some fancy comment
			require
				u_content_not_empty: not u_content.is_empty
			do
				--comment what is done
			ensure
				result_is_String: {t: String} Result
			end


		italic(u_content: STRING): STRING
			--some fancy comment
			require
				placeholder: True
				u_content_not_empty: not u_content.is_empty
			do
				--comment what is done
			ensure
				placeholder: True
				result_is_String: {t: String} Result
			end


		underline(u_content: STRING): STRING
			--some fancy comment
			require
				placeholder: True
				u_content_not_empty: not u_content.is_empty
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
				result_is_String: {t: String} Result
			end


		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				placeholder: True
				render_obj_not_null: render_obj /= void
			do
				--comment what is done
			ensure then
				placeholder: True
				result_is_String: {t: String} Result
			end


	invariant
		placeholder: True
		content_text_instantiated: content /= void
end
