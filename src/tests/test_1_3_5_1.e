note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_5_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
img1: YODA_IMAGE
img2: YODA_IMAGE
factory: YODA

	on_prepare
			-- <Precursor>
		do
			create img1.make_external ("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg")
			create img2.make_external ("some text, no image or such")
			create factory
		end

feature -- Test routines

	TEST_1_3_5_1
			-- New test routine
		note
			testing:  "covers/{YODA_IMAGE}.make_external", "covers/{YODA}.image_external"
		local
			obiwan: YODA_IMAGE
		do
			--check img1.make_external(valid url string)
			assert ("test external image with parameter https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg", equal(equal(
			equal(img1.content.count > 0, True),
			equal(attached {STRING} img1.content, True)),
			equal(attached {YODA_IMAGE} img1 , True)))

			assert ("attributes of external image are not set correctly", equal(equal(
			equal(img1.content.count > 0, True),
			equal(img1.name, "external image")),
			equal(img1.is_extern , True)))

			assert ("name of image is not image", equal(img1.name, "external image"))

			--check img1.make_external(valid url string)
			assert ("test external image with parameter some text, no image or such", equal(equal(
			equal(img2.content.count > 0, True),
			equal(attached {STRING} img2.content, True)),
			equal(attached {YODA_IMAGE} img2, True)))

			assert ("attributes of external image are not set correctly", equal(equal(
			equal(img2.content.count > 0, True),
			equal(img2.name, "external image")),
			equal(img2.is_extern , True)))

			--check through factory {YODA}
			obiwan := factory.image_external("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg")
			assert ("test of external image with factory and parameter https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg", equal(equal(
			equal(obiwan.content.count > 0, True),
			equal(obiwan.name, "external image")),
			equal(obiwan.is_extern , True)))

			--check precon string_not_empty
			precon_function_trigger(agent factory.image_external (""), "string_not_empty")

			--check if attached from factory instances
			assert ("obiwan is not a YODA_IMAGE", equal(attached {YODA_IMAGE} obiwan, True))
		end

end


