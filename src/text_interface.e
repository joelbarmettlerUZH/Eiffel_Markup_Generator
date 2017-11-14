note
	description: "Summary description for {TEXT_INTERFACE}."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$27.10.2017$"

deferred class
	YODA_TEXT_INTERFACE

	inherit
		YODA_ELEMENT


	feature {ANY}
		render(renderer: RENDERER; nesting: INTEGER): STRING
			--some fancy comment
			deferred
			end

end
