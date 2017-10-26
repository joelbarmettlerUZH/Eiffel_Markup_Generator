note
	description: "Summary description for {YODA_TEXT}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_TEXT

	inherit
		YODA_ELEMENT

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
			require
				u_content_not_void: u_content /= void
				u_content_not_empty: u_content.count > 0
			do
				--validation
				--comment what is done
				--make instance of TEXT
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_text(?))
				content_text_instantiated: content /= void
				content_set: content = u_content
			end


		bold(u_content: STRING): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		italic(u_content: STRING): STRING
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		underline(u_content: STRING): STRING
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
