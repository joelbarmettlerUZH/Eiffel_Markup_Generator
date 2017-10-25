note
	description: "Summary description for {VALIDATOR}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

deferred class
	VALIDATOR

	feature {ANY}
		validate(element: YODA_ELEMENT): BOOLEAN
			--some fancy comment
			require
				placeholder: True
			deferred
			ensure
				placeholder: True
			end

	invariant
		placeholder: True

end
