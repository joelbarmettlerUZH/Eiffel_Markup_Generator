note
	description: "[
		Tests creation of 1.3.4.5 Anchor link and 1.3.3.1 Anchor element.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.5 + 2 = 5.5 Percent"

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
			--check anchor1.make_email("yoda@power.yedi") & precons that everything should be attached
			assert ("test anchor link around text to anchor", anchor_link1.url.count > 0)
			assert ("test anchor link around text to anchor name", equal(anchor_link1.name, "anchor Link"))
			assert ("test anchor link around text to anchor attached", attached {YODA_LINK} anchor_link1)
			assert ("email url is of type YODA_TEXT", equal(attached {YODA_TEXT} anchor_link1.content, True))
			assert ("anchor link has substring #", equal(anchor_link1.url.has_substring ("#"),true))

			--not void precon check
			assert ("anchor_link1 is of type YODA_LINK", attached {YODA_LINK} anchor_link1)
			assert ("anchor_link1.content is of type YODA_ELEMENT", attached {YODA_ELEMENT} anchor_link1.content)

			--check through factory {YODA}
			obiwan := factory.link_anchor (button1, anchor1)
			assert ("test of anchor link with factory and the parameter text and doc content name", equal(obiwan.content.name, "text"))
			assert ("test of anchor link with factory and the parameter text and doc url count", obiwan.url.count > 0)
			assert ("test of anchor link with factory and the parameter text and doc name", equal(obiwan.name, "anchor Link"))
			assert ("anchor link contains #",obiwan.url.has_substring("#"))

			precon_function_trigger(agent factory.anchor (""), "id_not_empty")

		end
end
