note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

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
--internal2: YODA_LINK
--internal3: YODA_LINK
text: YODA_TEXT
--emptyText: YODA_TEXT
doc: YODA_DOCUMENT

	on_prepare
			-- <Precursor>

		do
			create factory
			create text.make("to be linked")
			create doc.make("Yedi")
			create internal1.make_internal(text,doc)
			--wont work obviously, how do we test void inputs?
			--emptyText already gets tested, not necessary here
			--create internal2.make_internal(text,void)
			--create internal3.make_internal(text,void)
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
			assert ("test internal link with parameter text and doc", equal(equal(
			equal(internal1.url.count > 0, True),
			equal(internal1.name, "internal Link")),
			equal(internal1.content = text, True)))

			--not void precon check
			assert ("internal1 is of type YODA_LINK", equal(attached {YODA_LINK} internal1, True))
			assert ("internal1.content is of type YODA_TEXT", equal(attached {YODA_TEXT} internal1.content, True))

			--test through factory {YODA}
			obiwan := factory.link_intern (text, doc)
			assert ("test of internal link with factory and the parameter text and doc", equal(equal(
			equal(obiwan.url.count > 0, True),
			equal(obiwan.name, "internal Link")),
			equal(obiwan.content = text, True)))
			assert ("test if obiwan url contains parameter text", equal((obiwan.url).has_substring("Yedi"), True))
			assert ("test if obiwan url contains {{doctype}}", equal(obiwan.url.has_substring("{{doctype}}"), True))

			--check precon
			assert ("obiwan is of type YODA_LINK", equal(attached {YODA_LINK} obiwan, True))
			assert ("obiwan.content is of type YODA_TEXT", equal(attached {YODA_TEXT} obiwan.content, True))
		end

end


