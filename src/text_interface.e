note
	description: "Summary description for {TEXT_INTERFACE}."
	author: "Marius H�gger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

deferred class
	TEXT_INTERFACE

	inherit
		YODA_ELEMENT


	feature {ANY}
		make(u_content: STRING)
			--some fancy comment
			deferred
			end

		render(render_obj: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			deferred
			end

end