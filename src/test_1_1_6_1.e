note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_1_6_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare,
			on_clean
		end


feature {NONE} -- Events
	Jedi: YODA_PROJECT
	Jedi2: YODA_PROJECT
	Jedi3: YODA_PROJECT
	Yoda: YODA_DOCUMENT
	Yaddle: YODA_DOCUMENT
	text1: YODA_TEXT
	image1: YODA_IMAGE
	del_output_folder: DIRECTORY

	on_prepare
			-- <Precursor>
		do
			create Jedi.make("Jedi")
			create Jedi2.make("Jedi2")
			create Jedi3.make("Jedi3")
			create Yoda.make("Yoda")
			create Yaddle.make("Yaddle")
			create text1.make("You will find only what you bring in.")
			create image1.make_local("./resources/yoda_1.gif")
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
				--temp_output_folder: DIRECTORY
			do
				create created_output_folder.make ("./Jedi_output")
				if created_output_folder.exists then
					created_output_folder.recursive_delete
				end
				create created_output_folder2.make ("./Jedi2_output")
				if created_output_folder2.exists then
					created_output_folder2.recursive_delete
				end
			end

feature -- Test routines

	test_1_1_6_1
			-- New test routine
		note
			testing:  "covers/{YODA_PROJECT}.save", "execution/isolated", "covers/{YODA_DOCUMENT}.save_document"
		local
			created_output_folder: DIRECTORY
			created_resource_folder: DIRECTORY
			created_output_file: RAW_FILE
			created_output_folder2: DIRECTORY
			created_output_file2: RAW_FILE
			created_output_file3: RAW_FILE
		do
			precon_procedure_trigger(agent Jedi.save ("html", "resources/template.txt"),"documents_not_empty")
			Yoda.add_element(text1)
			Jedi.add_document(Yoda)
			Jedi.save ("html", "resources/template.txt")
			create created_output_folder.make ("./Jedi_output")
			assert ("save project with one document. (without local image), outputfolder created", created_output_folder.exists)
			create created_output_file.make_open_read ("./Jedi_output/Yoda.html")
			assert ("save document with one element (not local image), document created", created_output_file.exists)
			created_output_file.close
			Yaddle.add_element(image1)
			Jedi2.add_document(Yoda)
			Jedi2.add_document(Yaddle)
			Jedi2.save ("html", "resources/template.txt")
			create created_output_folder2.make ("./Jedi2_output")
			assert ("save project with two documents.", created_output_folder2.exists)
			create created_output_file2.make_open_read ("./Jedi2_output/Yoda.html")
			create created_resource_folder.make ("./Jedi2_output/resources")
			assert ("save project with two documents, document 1 created", created_output_file2.exists)
			assert ("save project with document with with one local image., resources folder created", created_resource_folder.has_entry ("yoda_1.gif"))
			create created_output_file3.make_open_read ("./Jedi2_output/Yoda.html")
			assert ("save project with two documents, document 1 created", created_output_file3.exists)
			create created_output_file3.make_open_read ("./Jedi2_output/Yaddle.html")
			assert ("save project with two documents, document 2 created", created_output_file3.exists)
			Jedi3.add_document(Yoda)
			Jedi3.add_document(Yaddle)
			precon_procedure_trigger(agent Jedi3.save ("html", "resources/template123.txt"),"template_valid")
			precon_procedure_trigger(agent Jedi3.save ("html", "resources/template_invalid.txt"),"template_valid")
		end

end


