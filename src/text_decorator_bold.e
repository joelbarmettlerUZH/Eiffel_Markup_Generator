note
	description: "Applies the styling to make the contet bold. (Actual implementations are in the _RENDERER classes)"
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

class
	TEXT_DECORATOR_BOLD

inherit
	TEXT_DECORATOR
		redefine
			render
		end

create
	make_style

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Apply render_bold renderer to TEXT_DECORATOR_BOLD.
		require else
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
    		Result := renderer.render_bold(current, nesting)
		ensure then
    		result_exists: attached result
		end

end
