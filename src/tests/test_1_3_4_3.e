note
	description: "[
		Testing creation link intern.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "4.5 Percent"

class
	TEST_1_3_4_3

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	factory: YODA
	internal1: YODA_LINK
	text: YODA_TEXT
	doc: YODA_DOCUMENT

	on_prepare
			-- <Precursor>
		do
			create factory
			create text.make("to be linked")
			create doc.make("Yedi")
			create internal1.make_internal(text,doc)
		end

feature -- Test routines

	TEST_1_3_4_3
			-- New test routine
		note
			testing:  "covers/{YODA}.link", "covers/{YODA_LINK}.make_internal", "covers/{YODA}.link_intern",
			          "covers/{HTML_VALIDATOR}.validate_link"
		local
			obiwan: YODA_LINK
		do
			--test link1.make_external(element2,"http://www.jedipedia.wikia.com/wiki/Yoda")
			assert ("test internal link with parameter text and doc", equal(internal1.name, "internal Link"))
			assert ("test internal link with parameter text and doc url.count", internal1.url.count > 0)
			assert ("test internal link with parameter text and doc internal1.name", equal(internal1.name, "internal Link"))
			assert ("test internal link with parameter text and doc internal1.content", equal(internal1.content = text, True))

			--not void precon check
			assert ("internal1 is of type YODA_LINK", equal(attached {YODA_LINK} internal1, True))
			assert ("internal1.content is of type YODA_TEXT", equal(attached {YODA_TEXT} internal1.content, True))

			--test through factory {YODA}
			obiwan := factory.link_intern (text, doc)
			assert ("test of internal link with factory and the parameter text and doc", obiwan.url.count > 0)
			assert ("test of internal link with factory and the parameter text and doc obiwan.name", equal(obiwan.name, "internal Link"))
			assert ("test of internal link with factory and the parameter text and doc obiwan.content", obiwan.content = text)
			assert ("test if obiwan url contains parameter text", equal((obiwan.url).has_substring("Yedi"), True))
			assert ("test if obiwan url contains {{doctype}}", equal(obiwan.url.has_substring("{{doctype}}"), True))

			--check precon
			assert ("obiwan is of type YODA_LINK", equal(attached {YODA_LINK} obiwan, True))
			assert ("obiwan.content is of type YODA_TEXT", equal(attached {YODA_TEXT} obiwan.content, True))
		end

end
