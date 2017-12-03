note
	description: "Applies styling to content to emphasise content/string is code. (Actual implementations are in the _RENDERER classes)"
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

class
	TEXT_DECORATOR_CODE

inherit
	TEXT_DECORATOR
		redefine
			render
		end


create
	make_style


feature {ANY}
	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Apply render_code renderer to TEXT_DECORATOR_TITLE.
		do
    		Result := renderer.render_code(current, nesting)
		end

end
