note
	description: "Applies the styling to make the content italic. (Actual implementations are in the _RENDERER classes)"
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

class
	TEXT_DECORATOR_ITALIC

inherit
	TEXT_DECORATOR
		redefine
			render
		end


create
	make_style


feature {ANY}
	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Apply render_italic renderer to TEXT_DECORATOR_ITALIC.
		do
    		Result := renderer.render_italic(current, nesting)
		end

end
