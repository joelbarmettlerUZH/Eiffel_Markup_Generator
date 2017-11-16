note
	description: "Parent class that is a YODA_ELEMENT."
	author: "Marius Högger"
	date: "$26.10.2017$"
	revision: "$15.11.2017$"

deferred class
	YODA_TEXT_INTERFACE

	inherit
		YODA_ELEMENT


	feature {ANY}
		render(renderer: RENDERER; nesting: INTEGER): STRING
			deferred
			end

end
