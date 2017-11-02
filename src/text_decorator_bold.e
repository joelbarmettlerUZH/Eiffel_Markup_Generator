note
	description: "Summary description for {TEXT_DECORATOR_BOLD}."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

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
		-- Apply render_bold renderer to TEXT_DECORATOR_BOLD.
		require else
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
    		Result := renderer.render_bold(current, nesting)
		ensure then
    		result_exists: attached result
		end

end
