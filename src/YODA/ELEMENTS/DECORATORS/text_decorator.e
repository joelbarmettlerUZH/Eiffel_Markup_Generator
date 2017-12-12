note
	description: "Deferred component of the decorator."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

deferred class
	TEXT_DECORATOR

inherit
	YODA_TEXT_INTERFACE
		redefine
			render,
			as_string
		end


feature {RENDERER, EQA_TEST_SET}
	component: YODA_TEXT_INTERFACE


feature {ANY}
	make_style(u_component: YODA_TEXT_INTERFACE)
		--Creates a new instance of a decorator with the given YODA_ELEMENT as sontent, also sets it's name to "style"
			-- Set `component' to `u_component'.
		require
			content_exists: attached u_component
			element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} u_component
		do
			component := u_component
			name := "style"
		ensure
			component_set: component = u_component
			name_set: name.is_equal("style")
		end


	render(renderer: RENDERER; nesting: INTEGER): STRING
		--Defined here to be used by all subclasses
		deferred
		end


	as_string(nesting: INTEGER): STRING
		--Creates the default string representation of the decorator. This string is used to show the content of a project/document
		do
			Result := spaces("-", nesting) + name + "(" + component.name + ")%N"
		end


invariant
	component_not_void: attached component

end
