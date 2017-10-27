note
	description: "Summary description for {TEXT_DECORATOR_CODE}."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

class
	TEXT_DECORATOR_CODE

inherit
	TEXT_DECORATOR
		redefine
			render
		end

create
	make_style

feature
	style_render(render_obj: RENDERER; nesting: INTEGER): STRING
		-- Apply TEXT_DECORATOR_CODE render to renderer.
		require
			renderer_exists: renderer /= Void
			valid_number_of_nesting: nesting >= 0
		do
			-- Calls Renderer.render_code(current, int)
		ensure
		end

end
