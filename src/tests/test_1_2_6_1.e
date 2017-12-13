note
	description: "[
		A document of a project shall be saved into the project folder in the working directory. 
		If a document is saved individually a new folder shall be created in the working directory, 
		named according to the document name. This folder shall contain the document-file and resources if used.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "3.06 Percent"

class
	TEST_1_2_6_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare,
			on_clean
		end


feature {NONE} -- Events
	Yoda_Quotes: YODA_DOCUMENT
	Yoda_Quotes2: YODA_DOCUMENT
	Yoda_Quotes3: YODA_DOCUMENT
	text1: YODA_TEXT
	image1: YODA_IMAGE


	on_prepare
			-- <Precursor>
		local
			del_output_folder: DIRECTORY
		do
			create Yoda_Quotes.make("Yoda_Quotes")
			create Yoda_Quotes2.make("Yoda_Quotes2")
			create Yoda_Quotes3.make("Yoda_Quotes3")
			create text1.make("You will find only what you bring in.")
			create image1.make_local("./tests/Testdata/yoda_1.gif")
			create del_output_folder.make ("./temp_output")
			if del_output_folder.exists then
					del_output_folder.recursive_delete
			end
		end


		on_clean
			--<Postcursor>
			local
				created_output_folder: DIRECTORY
				created_output_folder2: DIRECTORY
			do
				create created_output_folder.make ("./Yoda_Quotes_output")
				if created_output_folder.exists then
					created_output_folder.recursive_delete
				end
				create created_output_folder2.make ("./Yoda_Quotes2_output")
				if created_output_folder2.exists then
					created_output_folder2.recursive_delete
				end
			end

feature -- Test routines

	test_1_2_6_1
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.save", "execution/isolated"
		local
			created_output_folder: DIRECTORY
			created_output_file: RAW_FILE
			created_output_folder2: DIRECTORY
			created_resource_folder2: DIRECTORY
			created_output_file2: RAW_FILE
		do
			precon_procedure_trigger(agent Yoda_Quotes.save ("html", "tests/Testdata/template.txt"),"elements_not_empty")
			Yoda_Quotes.add_element (text1)
			Yoda_Quotes.save ("html", "tests/Testdata/template.txt")
			create created_output_folder.make ("./Yoda_Quotes_output")
			assert ("save document with one element (not local image), folder created", created_output_folder.exists)
			create created_output_file.make_open_read ("./Yoda_Quotes_output/Yoda_Quotes.html")
			assert ("save document with one element (not local image), document created", created_output_file.exists)
			created_output_file.close
			Yoda_Quotes2.add_element (image1)
			Yoda_Quotes2.save ("html", "tests/Testdata/template.txt")
			create created_output_folder2.make ("./Yoda_Quotes2_output")
			assert ("save document with one local image., folder created", created_output_folder2.exists)
			create created_resource_folder2.make ("./Yoda_Quotes2_output/resources")
			create created_output_file2.make_open_read ("./Yoda_Quotes2_output/Yoda_Quotes2.html")
			assert ("save document with one local image., document created", created_output_file2.exists)
			assert ("save document with one local image., resources folder created", created_resource_folder2.has_entry ("yoda_1.gif"))
			created_output_file2.close
			Yoda_Quotes3.add_element (text1)
			precon_procedure_trigger(agent Yoda_Quotes3.save ("html", "tests/Testdata/template123.txt"),"template_valid")
			precon_procedure_trigger(agent Yoda_Quotes3.save ("html", "tests/Testdata/template_invalid.txt"),"template_valid")
		end

end


