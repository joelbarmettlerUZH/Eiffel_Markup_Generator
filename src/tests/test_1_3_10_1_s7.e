note
	description: "[
		Each YODA-Element shall offer the functionality of being rendered, meaning to be outputted as a proper
		string-based representation in the chosen output language.
		Whenever a certain nested element composition is not directly supported by the chosen output language,
		YODA shall render the element composition in an alternative, acceptable way.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0.41 Percent"

class
	TEST_1_3_10_1_S7

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	anchor1: YODA_ANCHOR
	text1: YODA_TEXT
	link1: YODA_LINK
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create anchor1.make("myID")
			create text1.make("Up, I bring you")
			create link1.make_anchor(text1, anchor1)
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s7
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_link", "covers/{YODA_LINK}.render"
		do
			assert("Anchor links properly points to the ID of the provided Anchor-Element.",
				equal(link1.render(renderer, 0), "<a href='#myID'>%N%T<p>Up, I bring you</p>%N</a>%N"))
		end

end


