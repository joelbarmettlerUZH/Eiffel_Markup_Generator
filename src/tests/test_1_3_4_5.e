note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_4_5

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	anchor1: YODA_ANCHOR
	anchor_link1: YODA_LINK
	factory: YODA
	button1: YODA_TEXT

	on_prepare
			-- <Precursor>
		do
			create factory
			create anchor1.make("test_anchor")
			create button1.make("click me!")
			create anchor_link1.make_anchor(button1, anchor1)
		end

feature -- Test routines

	TEST_1_3_4_5
			-- New test routine
		note
			testing:  "covers/{YODA_LIST}.make_anchor", "covers/{YODA}.link_anchor", "covers/{HTML_VALIDATOR}.validate_anchor"
		local
			obiwan: YODA_LINK
		do
			--check email1.make_email("yoda@power.yedi")
			assert ("test anchor link around text to anchor", equal(equal(
			equal(anchor_link1.url.count > 0, True),
			equal(anchor_link1.name, "anchor Link")),
			equal(attached {YODA_LINK} anchor_link1 , True)))

			assert ("email url is of type YODA_TEXT", equal(attached {YODA_TEXT} anchor_link1.content, True))

			--not void precon check
			assert ("anchor_link1 is of type YODA_LINK", equal(attached {YODA_LINK} anchor_link1, True))
			assert ("anchor_link1.content is of type YODA_ANCHOR", equal(attached {YODA_ELEMENT} anchor_link1.content, True))

			--check through factory {YODA}
			obiwan := factory.link_anchor (button1, anchor1)
			assert ("test of anchor link with factory and the parameter text and doc", equal(equal(
			equal(obiwan.url.count > 0, True),
			equal(obiwan.name, "anchor Link")),
			equal(obiwan.content.name, "text")))
			assert ("anchor link contains #",obiwan.url.has_substring("#"))
		end
end
