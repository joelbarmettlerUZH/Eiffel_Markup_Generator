note
	description: "Deferred component of the decorator."
	author: "Marius H�gger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

deferred class
	TEXT_DECORATOR

inherit
	YODA_TEXT_INTERFACE
		redefine
			render
		end

feature {NONE}
	component: YODA_TEXT_INTERFACE

feature {NONE}
	make_style(u_component: YODA_TEXT_INTERFACE)
			-- Set `component' to `u_component'.
		require
			u_component_not_void: u_component /= Void
		do
			--component := u_component
		ensure
			component_set: component = u_component
		end

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		deferred
		end


invariant
	component_not_void: component /= void

end
