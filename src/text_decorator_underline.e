note
	description: "Applies the styling to make the content underline. (Actual implementations are in the _RENDERER classes)"
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

class
	TEXT_DECORATOR_UNDERLINE

inherit
	TEXT_DECORATOR
		redefine
			render
		end

create
	make_style

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Apply render_underline renderer to TEXT_DECORATOR_UNDERLINE.
		require else
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
    		Result := renderer.render_underline(current, nesting)
		ensure then
    		result_exists: attached result
		end

end

