note
	description: "Summary description for {TEXT_DECORATOR_CODE}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	TEXT_DECORATOR_CODE

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
		--call code renderer
	end

end
