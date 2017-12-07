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
	coverage: "1.11 Percent"

class
	TEST_1_3_10_1_S8

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	image1: YODA_IMAGE
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create image1.make_external("http://www.yoda.ch/y.jpg")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s8
			-- New test routine
		note
			testing:  "covers/{YODA_IMAGE}.render", "covers/{HTML_RENDERER}.render_image_external"
		do
			assert("Provided image URL is rendered with proper <img> tags, link is written in the src='***' part. Alt text of the image is properly set.",
				equal(image1.render(renderer, 0), "<img src='http://www.yoda.ch/y.jpg' alt='http://www.yoda.ch/y.jpg missing'><br>%N"))
			precon_function_trigger(agent image1.render(renderer, -1), "is_valid_nesting")
			assert("Image can be rendered with nesting higher than 0",
				equal(image1.render (renderer, 3), "%T%T%T<img src='http://www.yoda.ch/y.jpg' alt='http://www.yoda.ch/y.jpg missing'><br>%N"))
		end

end


