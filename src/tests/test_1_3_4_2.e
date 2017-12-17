note
	description: "[
		Testing creation link extern.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "4.5 Percent"

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

	on_prepare
			-- <Precursor>
		do
			create factory
			create text.make("some test text to get linked of element 1")
			create element2 .make("some test text to get linked of element 2")
			create link1.make_external(element2, "http://www.jedipedia.wikia.com/wiki/Yoda")
			create link3.make_external(text, "some text, no link")
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
			assert ("test external link with parameter text and http://www.jedipedia.wikia.com/wiki/Yoda", link1.url.count > 0)
			assert ("test external link with parameter text and link + name", equal(link1.name, "external Link"))
			assert ("test external link with parameter text and link + content", link1.content = element2)
			assert ("link1 is of type YODA_LINK", equal(attached {YODA_LINK} link1, True))
			assert ("link1.content is of type YODA_TEXT", equal(attached {YODA_TEXT} link1.content, True))

			precon_function_trigger(agent factory.link_external(text,""), "url_not_empty")
			precon_function_trigger(agent factory.text (""), "text_not_empty")

			--test link3.make_external(text, "some text, no link")
			assert ("test external link with parameter text and some text, no link", equal(link3.name, "external Link"))
			assert ("test external link with parameter text and some text, no link", link3.url.count > 0)
			assert ("test external link name", equal(link3.name, "external Link"))
			assert ("test external link content", equal(link3.content = text, True))

			--test through factory {YODA}
			obiwan := factory.link_external (text, "http://www.jedipedia.wikia.com/wiki/Yoda")
			assert ("test external link with parameter text and http://www.jedipedia.wikia.com/wiki/Yoda", obiwan.url.count > 0)
			assert ("test external link name", equal(obiwan.name, "external Link"))
			assert ("test external link content", obiwan.content = text)
			assert ("obiwan is of type YODA_LINK", equal(attached {YODA_LINK} obiwan, True))
			assert ("obiwan.content is of type YODA_TEXT", equal(attached {YODA_TEXT} obiwan.content, True))
		end
end


