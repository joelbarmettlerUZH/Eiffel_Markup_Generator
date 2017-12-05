note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_10_1_S6

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	link1: YODA_LINK
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create link1.make_email("obiwan@yoda.ch")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s6
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_link", "covers/{YODA_LINK}.render"
		do
			assert("The link gets properly rendered with the 'mailto:'statement before the mail", equal(link1.render(renderer, 0), "<a href='mailto:obiwan@yoda.ch'>%N%T<p>obiwan@yoda.ch</p>%N</a>%N"))
		end

end


