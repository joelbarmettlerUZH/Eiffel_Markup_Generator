note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_5_2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
img1 : YODA_IMAGE
factory: YODA

	on_prepare
			-- <Precursor>
		do
			create img1.make_local("resources/yoda.gif")
			create factory
		end

feature -- Test routines

	TEST_1_3_5_2
			-- New test routine
		note
			testing:  "covers/{YODA}.image", "covers/{HTML_VALIDATOR}.validate_image", "covers/{YODA_IMAGE}.make_local", "covers/{YODA}.image_local"
		local
			obiwan1: YODA_IMAGE
			trooper1: YODA_IMAGE
		do
			--check img1.make_local("resources/yoda.gif")
			assert ("test internal image with parameter resources/yoda.gif", equal(equal(
			equal(img1.name, "local image"),
			equal(img1.content, "resources/yoda.gif")),equal(
			equal(attached {YODA_IMAGE} img1 , True),
			equal(img1.is_extern, False))))

			--check precon "string_not_empty" in YODA
			precon_function_trigger(agent factory.image_local (""), "string_not_empty")

			--check through factory {YODA}
			obiwan1 := factory.image_local ("resources/yoda.gif")
			assert ("test of internal image with factory and parameter resources/yoda.gif", equal(equal(
			equal(obiwan1.name, "local image"),
			equal(obiwan1.content, "resources/yoda.gif")),equal(
			equal(attached {YODA_IMAGE} obiwan1 , True),
			equal(obiwan1.is_extern, False))))

			--check precon "File_exists" in YODA_IMAGE
			precon_function_trigger(agent factory.image_local ("some text, no image or such"), "file_exists")

			--check precon "String_not_empty" in YODA_IMAGE
			precon_function_trigger(agent factory.image_local (""), "string_not_empty")

		end

end


