note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_10_1_S5

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text1: YODA_TEXT
	doc1: YODA_DOCUMENT
	link1: YODA_LINK
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create text1.make("Clicking here, you must")
			create doc1.make("about")
			create link1.make_internal(text1, doc1)
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s5
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_link", "covers/{YODA_LINK}.render"
		do
			assert("The link gets properly rendered with linking another document as document_name+.html while assuming the document is located in the same folder",equal(link1.render(renderer, 0),"<a href='about.html'>%N%T<p>Clicking here, you must</p>%N</a>%N"))
		end

end


