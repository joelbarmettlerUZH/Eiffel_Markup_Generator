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

	make_style_with_attribute (u_component: YODA_TEXT_INTERFACE; u_attribute: INTEGER)
			-- Set `component' to `u_component'.
			-- Set `additional_attribute' to `an_attribute'.
		require
			u_component_not_void: u_component /= Void
			u_attribute_not_void: u_attribute > 0
			u_attribute_not_void: u_attribute < 7
		do
			component := u_component
			strength := u_attribute
		ensure
			component_set: component = u_component
			attribute_set: strength = u_attribute
		end

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		-- Apply render_title renderer to TEXT_DECORATOR_TITLE.
		require else
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
    		Result := renderer.render_title(current, nesting)
		ensure then
    		result_exists: attached result
		end

end
