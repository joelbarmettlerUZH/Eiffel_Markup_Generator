note
	description: "Summary description for {TEXT_DECORATOR_QUOTE}."
	author: "Marius H�gger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

class
	TEXT_DECORATOR_QUOTE

inherit
	TEXT_DECORATOR
		redefine
			render
		end

create
	make_style

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		-- Apply�render_quote renderer to TEXT_DECORATOR_QUOTE.
		require else
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
			-- Calls Renderer.render_quote(current, int)
		end

end
