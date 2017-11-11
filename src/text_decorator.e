note
	description: "Deferred component of the decorator."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

deferred class
	TEXT_DECORATOR

inherit
	YODA_TEXT_INTERFACE
		redefine
			render,
			as_string
		end


feature {ANY}
	component: YODA_TEXT_INTERFACE

feature {NONE}
	make_style(u_component: YODA_TEXT_INTERFACE)
			-- Set `component' to `u_component'.
		require
			u_component_not_void: u_component /= Void
		do
			component := u_component
			name := "style"
		ensure
			component_set: component = u_component
			name_set: name.is_equal("style")
		end

feature
	render(renderer: RENDERER; nesting: INTEGER): STRING
		deferred
		end


	as_string(nesting: INTEGER): STRING
		do
			Result := spaces("-", nesting) + name + "(" + component.name + ")%N"
		end


invariant
	component_not_void: component /= void

end
