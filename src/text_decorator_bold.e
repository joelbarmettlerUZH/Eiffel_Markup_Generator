note
	description: "Summary description for {TEXT_DECORATOR_BOLD}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEXT_DECORATOR_BOLD

inherit
	TEXT_DECORATOR
		redefine
			add_style
		end

create
	make_style

feature
	style_render(render_obj: RENDERER; nesting: INTEGER): STRING
	do
		--add bold tags
	end

end
