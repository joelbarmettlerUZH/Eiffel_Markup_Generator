note
	description: "Applies the styling to make the content to look like a title. (Actual implementations are in the _RENDERER classes)"
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

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


feature {RENDERER, EQA_TEST_SET}
	strength: INTEGER


feature {ANY}
	make_style_with_attribute (u_component: YODA_TEXT_INTERFACE; u_attribute: INTEGER)
		--Creates the decorator with an additional argument. The additional argument is used for the strength of the title.
		require
			u_component_not_void: u_component /= Void
			u_attribute_not_to_small: u_attribute > 0
			u_attribute_not_to_bigl: u_attribute < 7
		do
			component := u_component
			strength := u_attribute
			name := "title"
		ensure
			component_set: component = u_component
			attribute_set: strength = u_attribute
			positive_strength: strength > 0
			strength_not_to_big: strength < 7
			name_set: name.is_equal ("title")
		end


	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Apply render_title renderer to TEXT_DECORATOR_TITLE.
		do
    		Result := renderer.render_title(current, nesting)
		end


	invariant
		positive_strength: strength > 0
		strength_not_to_big: strength < 7
end
