note
	description: "Summary description for {TEXT_DECORATOR_QUOTE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEXT_DECORATOR_QUOTE

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
		--call quote renderer
	end

end
