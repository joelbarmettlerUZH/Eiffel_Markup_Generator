note
	description: "Concretete element Yoda list."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

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
			require else
				u_content_not_void: u_content /= void
				u_content_not_empty: u_content.count > 0

			do

				--validation
				--comment what is done
				--make instance of ARRAY
				--sets content = u_content
				--set is_ordered = u_is_ordered
			ensure then
				is_valid: validate(CURRENT, agent {VALIDATOR}.validate_list(?))
				content_array_instantiated: content /= void
				is_ordered_set: is_ordered = u_is_ordered
				content_set: content = u_content
			end

		render(renderer: RENDERER; nesting: INTEGER): STRING
			-- Apply YODA_LIST render to renderer.
			require else
				renderer_exists: renderer /= Void
				valid_number_of_nesting: nesting >= 0
			do
				-- Calls Renderer.render_list(current, int).
				--recieves STRING with rendered text inc. tags.
			ensure then
				placeholder: True
			end



	invariant
		content_not_empty: content.count > 0
end
