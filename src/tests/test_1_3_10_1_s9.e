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
	coverage: "3.33 Percent"

class
	TEST_1_3_10_1_S9

inherit
	TEST_INTERFACE
		redefine
			on_prepare,
			on_clean
		end

feature {NONE} -- Events
	image1: YODA_IMAGE
	image2: YODA_IMAGE
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		local
			yoda_1: RAW_FILE
			yoda_1_content: STRING
			yoda_2: RAW_FILE
			yoda_2_content: STRING
			temp_output_folder: DIRECTORY
		do
			create yoda_1.make_open_read ("./tests/Testdata/yoda_1.gif")
			assert("Local file yoda_1 exists", yoda_1.exists)
			yoda_1.read_stream (yoda_1.count)
			yoda_1_content := yoda_1.last_string
			create yoda_2.make_open_read ("./tests/Testdata/yoda_2.gif")
			assert("Local file yoda_2 exists", yoda_2.exists)
			yoda_2.read_stream (yoda_2.count)
			yoda_2_content := yoda_2.last_string
			assert("Both files are not equals", not equal(yoda_1_content, yoda_2_content))
			yoda_1.close
			yoda_2.close
			create image1.make_local("./tests/Testdata/yoda_1.gif")
			create image2.make_local("./tests/Testdata/yoda_2.gif")
			create temp_output_folder.make ("./temp_output")
			if temp_output_folder.exists then
					temp_output_folder.recursive_delete
			end
			create renderer
		end


	on_clean
		--<Postcursor>
		local
			temp_output_folder: DIRECTORY
		do
			create temp_output_folder.make ("./temp_output")
			if temp_output_folder.exists then
					temp_output_folder.recursive_delete
			end
		end

feature -- Test routines

	test_1_3_10_1_s9
			-- New test routine
		note
			testing:  "covers/{YODA_IMAGE}.render", "covers/{HTML_RENDERER}.render_image_local", "execution/isolated"
		local
			temp_output_folder: DIRECTORY
			original_image_1: RAW_FILE
			original_image_1_content: STRING
			copied_image_1: RAW_FILE
			copied_image_1_content: STRING
			--File 2
			original_image_2: RAW_FILE
			original_image_2_content: STRING
			copied_image_2: RAW_FILE
			copied_image_2_content: STRING
			rendered_image_2: STRING
		do
			assert("Provided local image URL is rendered with proper <img> tags, link is written in the src='***' part. Alt text of the image is properly set.",
				equal(image1.render (renderer, 0), "<img src='./resources/yoda_1.gif' alt='yoda_1.gif missing'><br>%N"))
			create temp_output_folder.make ("./temp_output")
			assert("temp_output/resources directory was created",
				temp_output_folder.exists)
			create original_image_1.make_open_read ("./tests/Testdata/yoda_1.gif")
			original_image_1.read_stream (original_image_1.count)
			original_image_1_content := original_image_1.last_string
			create copied_image_1.make_open_read ("./temp_output/resources/yoda_1.gif")
			copied_image_1.read_stream (copied_image_1.count)
			copied_image_1_content := copied_image_1.last_string
			original_image_1.close
			copied_image_1.close
			--File 2
			assert("local image file is being copied in temp_output/resources folder",
				copied_image_1.exists and then equal(original_image_1_content, copied_image_1_content))
			rendered_image_2 := image2.render (renderer, 0)
			create original_image_2.make_open_read ("./tests/Testdata/yoda_2.gif")
			original_image_2.read_stream (original_image_2.count)
			original_image_2_content := original_image_2.last_string
			create copied_image_2.make_open_read ("./temp_output/resources/yoda_2.gif")
			copied_image_2.read_stream (copied_image_2.count)
			copied_image_2_content := copied_image_2.last_string
			copied_image_2.close
			assert("temp_output folder is deleted and created again with new content when new image rendering is called.",
				copied_image_2.exists and then (equal(original_image_2_content, copied_image_2_content) and not equal(original_image_1_content, copied_image_2_content)))
		end

end


