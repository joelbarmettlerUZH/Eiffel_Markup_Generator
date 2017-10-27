note
	description: "Summary description for {TEXT_DECORATOR_UNDERLINE}."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

class
	TEXT_DECORATOR_UNDERLINE

inherit
	TEXT_DECORATOR
		redefine
			style_render
		end

create
	make_style

feature
	style_render(render_obj: RENDERER; nesting: INTEGER): STRING

	do
		--call underline renderer
	end

end

