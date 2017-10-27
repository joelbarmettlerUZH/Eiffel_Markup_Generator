note
	description: "Summary description for {TEXT_DECORATOR_TITLE}."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

class
	TEXT_DECORATOR_TITLE

inherit
	TEXT_DECORATOR
		redefine
			render
		end

create
	make_style,
	make_style_with_attribute

feature
	strength: INTEGER

feature {NONE}

	make_style_with_attribute (u_component: like component; u_attribute: like strength)
			-- Set `component' to `u_component'.
			-- Set `additional_attribute' to `an_attribute'.
		require
			u_component_not_void: u_component /= Void
			u_attribute_not_void: u_attribute > 0
			u_attribute_not_void: u_attribute < 7
		do
			--make (u_component)
			--strength := u_attribute
		ensure
			component_set: component = u_component
			attribute_set: strength = u_attribute
		end

feature
	render(render_obj: RENDERER; nesting: INTEGER): STRING
		-- Apply TEXT_DECORATOR_TITLE render to renderer.
		require
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
			-- Calls Renderer.render_title(current, int)
		ensure
		end

end
