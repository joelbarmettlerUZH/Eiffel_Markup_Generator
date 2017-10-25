note
	description: "Summary description for {YODA_LIST}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	YODA_LIST

	inherit
		YODA_ELEMENT

	create
		make

	feature {ANY}
		--name and documents shall be public, allow access for everybody
		content: ARRAY[YODA_ELEMENT]
		is_ordered: BOOLEAN


	feature {ANY}
		make(u_content: ARRAY[YODA_ELEMENT]; u_is_ordered: BOOLEAN)
			--some fancy comment
			require
				u_content_not_void: u_content /= void
				u_content_not_empty: u_content.count > 0

			do

				--validation
				--comment what is done
				--make instance of ARRAY
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure
				content_array_instantiated: content /= void
				is_ordered_set: is_ordered = u_is_ordered
				content_set: content = u_content
			end

		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			require else
				placeholder: True
			do
				--calls render_obj with self and nesting as arguments
				--recieves STRING with rendered text inc. tags.
			ensure then
				placeholder: True
			end


	invariant
		content_not_empty: content.count > 0
end
