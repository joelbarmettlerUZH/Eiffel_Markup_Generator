note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_10_1_S3

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	anchor1: YODA_ANCHOR
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create anchor1.make("myID")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s3
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_link", "covers/{YODA_LINK}.render"
		do
			assert("Anchors are properly rendered as empty spans with id = content.",equal(anchor1.render(renderer, 0), "<span id='myID'></span>%N"))
			precon_function_trigger(agent anchor1.render (renderer, -1), "is_valid_nesting")
			assert("Anchors are properly rendered as empty spans with id = content.",equal(anchor1.render(renderer, 3), "%T%T%T<span id='myID'></span>%N"))
		end

end


