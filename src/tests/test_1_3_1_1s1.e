note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_1_1S1

inherit
	EQA_TEST_SET


feature -- Test routines

	Test_1_3_1_1_S1
			-- New test routine
		note
			testing:  "covers/{YODA_TEXT}.make"
		local
			text1: YODA_TEXT
			text2: YODA_TEXT
			text3: YODA_TEXT
		do
			create text1.make ("May the force be with you.")
			assert ("Validator in YODA_TEXT", equal("May the force be with you.", text1.content))

			create text2.make ("<body>Have patience my little padawan<\body>")
			assert ("Validator in YODA_TEXT", equal("<body>Have patience my little padawan<\body>", text2.content))

			create text3.make ("")
			assert ("Validator in YODA_TEXT", equal("Precondition violated.", text3.content))
		end



end


