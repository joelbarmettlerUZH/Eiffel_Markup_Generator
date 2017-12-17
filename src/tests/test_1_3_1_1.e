note
	description: "[
		Testing creation text and text factory
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.55 Percent"

class
	TEST_1_3_1_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text: YODA_TEXT
	text2: YODA_TEXT
	content: STRING
	content2: STRING
	factory: YODA

	on_prepare
			-- <Precursor>
		do
			content := "May the Force be with you"
			create text.make(content)
			content2:= "<body>Have patience my little padawan<\body>"
			create text2.make(content2)
			create factory
		end

feature -- Test routines

	TEST_1_3_1_1
			-- New test routine
		note
			testing:  "covers/{YODA}.text", "covers/{YODA_TEXT}.make", "covers/{HTML_VALIDATOR}.validate_text"
		local
			obiwan: YODA_TEXT
		do
			obiwan := factory.text(content)
			assert ("make YODA_TEXT with a String content", equal(text.content, content))
			assert ("make YODA_TEXT with a String name", equal(text.name,"text"))
			assert ("make YODA_TEXT is attached", attached {YODA_TEXT} text)
			assert ("make YODA_TEXT with a String content2", equal(text2.content, content2))
			assert ("make YODA_TEXT with a String name2", equal(text2.name,"text"))

			precon_function_trigger(agent factory.text(""),"text_not_empty")

			assert ("make YODA_TEXT with factory and content attached", attached {YODA_TEXT} obiwan)
			assert ("make YODA_TEXT with factory and ontent name", equal(obiwan.name,"text"))
		end
end


