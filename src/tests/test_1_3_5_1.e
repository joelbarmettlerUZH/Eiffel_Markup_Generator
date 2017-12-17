note
	description: "[
		Testing creation Image, extern resource.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.2 Percent"

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
			assert ("test external image with parameter https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg", img1.content.count > 0)
			assert ("test external image with correct parameter attached img1.content", attached {STRING} img1.content)
			assert ("test external image with correct parameter attached img1", attached {YODA_IMAGE} img1)

			assert ("attributes of external image are not set correctly", img1.content.count > 0)
			assert ("attributes of external image are not set correctly img1.name", equal(img1.name, "external image"))
			assert ("attributes of external image are not set correctly img1.is_extern", img1.is_extern)
			assert ("name of image is not image", equal(img1.name, "external image"))

			--check img1.make_external(valid url string)
			assert ("test external image with parameter some text, no image or such", img2.content.count > 0)
			assert ("test external image attached img2.content", attached {STRING} img2.content)
			assert ("test external image attached img2", attached {YODA_IMAGE} img2)

			assert ("attributes of external image are not set correctly", equal(img2.name, "external image"))
			assert ("attributes of external image img2.content.count", img2.content.count > 0)
			assert ("attributes of external image img2.name", equal(img2.name, "external image"))
			assert ("attributes of external image img2.is_extern", img2.is_extern)

			--check through factory {YODA}
			obiwan := factory.image_external("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg")
			assert ("test of external image with factory obiwan.content.count", equal(obiwan.content.count > 0,True))
			assert ("test of external image with facty obiwan.name", equal(obiwan.name, "external image"))
			assert ("test of external image with facty obiwan.is_extern", obiwan.is_extern)

			--check precon string_not_empty
			precon_function_trigger(agent factory.image_external (""), "string_not_empty")

			--check if attached from factory instances
			assert ("obiwan is not a YODA_IMAGE", equal(attached {YODA_IMAGE} obiwan, True))
		end

end


