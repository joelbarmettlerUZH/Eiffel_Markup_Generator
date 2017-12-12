note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_4_2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
factory: YODA
link1: YODA_LINK
link3: YODA_LINK
text: YODA_TEXT
element2: YODA_TEXT
--some_text: STRING


	on_prepare
			-- <Precursor>
		do
			create factory
			create text.make("some test text to get linked of element 1")
			create element2 .make("some test text to get linked of element 2")
			create link1.make_external(element2, "http://www.jedipedia.wikia.com/wiki/Yoda")
			--dürfte eigentlich nicht funktionieren, kein valider link?
			create link3.make_external(text, "some text, no link")
			--some_text :=

		end

feature -- Test routines

	TEST_1_3_4_2
			-- New test routine
		note
			testing:  "covers/{YODA_LINK}.make_external", "covers/{HTML_VALIDATOR}.validate_link",
			          "covers/{YODA}.link_external"
		local
			obiwan : YODA_LINK
		do
			--test link1.make_external(element2,"http://www.jedipedia.wikia.com/wiki/Yoda")
			assert ("test external link with parameter text and http://www.jedipedia.wikia.com/wiki/Yoda", equal(equal(
			equal(link1.url.count > 0, True),
			equal(link1.name, "external Link")),
			equal(link1.content = element2, True)))
			assert ("link1 is of type YODA_LINK", equal(attached {YODA_LINK} link1, True))
			assert ("link1.content is of type YODA_TEXT", equal(attached {YODA_TEXT} link1.content, True))

			precon_function_trigger(agent factory.link_external(text,""), "url_not_empty")
			precon_function_trigger(agent factory.text (""), "text_not_empty")

			--test link3.make_external(text, "some text, no link")
			assert ("test external link with parameter text and some text, no link", equal(equal(
			equal(link3.url.count > 0, True),
			equal(link3.name, "external Link")),
			equal(link3.content = text, True)))

			--test through factory {YODA}
			obiwan := factory.link_external (text, "http://www.jedipedia.wikia.com/wiki/Yoda")
			assert ("test external link with parameter text and http://www.jedipedia.wikia.com/wiki/Yoda", equal(equal(
			equal(obiwan.url.count > 0, True),
			equal(obiwan.name, "external Link")),
			equal(obiwan.content = text, True)))
			assert ("obiwan is of type YODA_LINK", equal(attached {YODA_LINK} obiwan, True))
			assert ("obiwan.content is of type YODA_TEXT", equal(attached {YODA_TEXT} obiwan.content, True))

			--untenstehender factory.link_external ist unnötig, da zuerst einmal ein text("") created werden muss, was durch die precon von YODA_TEXT verhindert wird
			--precon_function_trigger(agent factory.link_external(factory.text (""),"some text, no link"), "text_not_empty")


		end

end


