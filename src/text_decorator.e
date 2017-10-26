note
	description: "Summary description for {TEXT_DECORATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	TEXT_DECORATOR

inherit
	YODA_TEXT
		redefine
			render
		end

feature {NONE}
	component: YODA_TEXT

feature {NONE}
	make_style(u_component: like component)
			-- Set `component' to `u_component'.
		require
			u_component_not_void: u_component /= Void
		do
			--component := u_component
		ensure
			component_set: component = u_component
		end

feature
	render(render_obj: RENDERER; nesting: INTEGER): STRING
		do
			--add_style(component.render)
		end

feature
	style_renderer(render_obj: RENDERER; nesting: INTEGER): STRING
		do
			require else
				placeholder: True
			do
				--calls render_obj with self and nesting as arguments
				--recieves STRING with rendered text inc. tags.
			ensure then
				placeholder: True
			end
		end



invariant
	component_not_void: component /= void

end
