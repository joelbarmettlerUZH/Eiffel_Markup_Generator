note
	description: "The YODA Class allows direct interaction from the user. It contains factories that create all the YODA_ELEMENTS simply with one line without local instances."
	description: "Beside the Document and Project class, the YODA Class serves as the interface for the user and guarantees that the object are instanciatet correctly."
	author: "Joel Barmettler"
	date: "$26.10.17$"
	revision: "$15.11.2017$"

class
	YODA

	feature {ANY}
		text(content: STRING): YODA_TEXT
			--Factory that creates an instance of YODA_TEXT with the content-string the user passed as an argument, and returns it to the user
			--the interaction with this factory looks as follows: yoda.text("Some String")
--			require
--				text_content_exists: attached content
--				text_not_empty: not content.is_empty
			do
				Result := create {YODA_TEXT}.make(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_TEXT: attached {YODA_TEXT} Result
			end


		table(content: ARRAY2[YODA_ELEMENT]): YODA_TABLE
			--Factory that creates an instance of YODA_TABLE with the two-dimensional content in form of an ARRAY2 the user passed as an argument, and returns it to the user
			--In order to create such a table, the user first needs a local ARRAY2 of YODA_ELEMENTS: array2: ARRAY2[YODA_ELEMENT]
			--Then, the user needs to create it and make it filled with some YODA_ELEMENTS of any kind, here we use text.
			--As an additional argument, he specifies the number of rows and collumns, here 2 and 4.
			--create array2.make_filled (yoda.text("Some String"), 2, 4)
			--The previous steps were just to create a 2D-Structure in Eiffel. The interaction with YODA is now fairly simple. Just pass the array to the libarary - Done.
			--yoda.table(array2)
--			require
--				table_content_exists: attached content
--				array_not_empty: not content.is_empty
			do
				Result := create {YODA_TABLE}.make(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_TABLE: attached {YODA_TABLE} Result
			end


		list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--This factory serves as an interface for the user. When he just want to create a list and does not specify what kind of list, we assume he likes to have a bulletpoint list.
			--So this factory then calls the yoda bulletpoint list factory width the same argumetns, a content array with YODA_ELEMENTS, and returns whatever this factory might return.
			--For this reason, it does neither require or ensure anything, the bulletpoint factory is taking care of such things.
			--The interaction with this libary looks as follows:
			--First the user needs to create a local instance of a ARRAY of YODA_ELEMENTS: local array: ARRAY[YODA_ELEMENTS]
			--Next, he needs to create such an array and fill it with some elements, here we used two text elements: array := <<yoda.text("First entry"),yoda.text("Second Entry")>>
			--Now, the interaction with yoda starts. He simply calls this factory: yoda.list(array)
			do
				Result := bulletpoint_list(content)
			end


		numbered_list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates an instance of YODA_LIST with the content-array of YODA_ELEMENTS the user passed as an argument, and returns it to the user
			--There are different kind of lists, like numbered or bullet-point, but all share the same creation procedure "make"
			--This factory calls the standard make procedure with an additional boolean "True" that indicates that the list is_numbered.
			--This is later on an important attribte for the render visitor.
			--The interaction needs the same set-up steps as the list factory described above, with the factory call being: yoda.numbered_lsit(array)
--			require
--				list_content_exists: attached content
--				array_not_empty: not content.is_empty
			do
				Result := create {YODA_LIST}.make(content, True)
			ensure
				result_not_void: attached Result
				result_is_YODA_LIST: attached {YODA_LIST} Result
			end


		bulletpoint_list(content: ARRAY[YODA_ELEMENT]): YODA_LIST
			--Factory that creates an instance of YODA_LIST with the content-array of YODA_ELEMENTS the user passed as an argument, and returns it to the user
			--This factory calls the standard make procedure with an additional boolean "False" that indicates that the list is not is_numbered.
			--The interaction needs the same set-up steps as the list factory described above, with the factory call being: yoda.bulletpoint_list(array)
--			require
--				list_content_exists: attached content
--				array_not_empty: not content.is_empty
			do
				Result := create {YODA_LIST}.make(content, False)
			ensure
				result_not_void: attached Result
				result_is_YODA_LIST: attached {YODA_LIST} Result
			end


		link(content: YODA_ELEMENT; url: STRING): YODA_LINK
			--This factory serves as an interface for the user. When he just want to create a link and does not specify what kind of link, we assume he likes to have an external link to some webpage.
			--So this factory simply calls the link_extern factory in the YODA class with the same arguments, an element which is clickable and will link to the provided page, and the url he want to lik to.
			--For this reason, it does neither require or ensure anything, the bulletpoint factory is taking care of such things.
			--The interaction width this factory is simple. The user create a link element width a yoda_element and a url as arguments:
			--yoda.link(yoda.text("Click here!"), "wwww.yoda.ch")
			do
				Result := link_external(content, url)
			end


		link_intern(content: YODA_ELEMENT; linked_doc: YODA_DOCUMENT): YODA_LINK
			--Factory that creates an instance of YODA_LINK with the content, the clickable YODA_ELEMENT and the linked document, and returns it to the user
			--There are four different links in YODA. This one represents an internal link, so a link to another document instance created with YODA.
			--For this reason, this factory calls the make_internal link funciton in the LINK class which automatically creates an URL according to the provided DOCUMENT name
			--The interaction width this factory, the user create a link element width a yoda_element and a existing yoda document as arguments:
			--local document: YODA_DOCUMENT
			--yoda.link(yoda.text("Click here!"), document)
--			require
--				link_intern_content_exists: attached content
--				linked_doc_exists: attached linked_doc
--				linked_doc_correct_type: attached {YODA_DOCUMENT} linked_doc
			do
				Result := create {YODA_LINK}.make_internal(content, linked_doc)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		link_external(content: YODA_ELEMENT; url: STRING): YODA_LINK
			--Factory that creates an instance of YODA_LINK with the content, the clickable YODA_ELEMENT and the linked url, and returns it to the user
			--There are four different links in YODA. This one represents an external link, so a link to some webpage in some network.
			--For this reason, this factory calls the make funciton in the LINK class which just takes a standard url that is linked.
			--The interaction width this factory is simple. The user create a link element width a yoda_element and a url as arguments:
			--yoda.link(yoda.text("Click here!"), "wwww.yoda.ch")
--			require
--				content_exists: attached content
--				url_exists: attached url
--				url_not_empty: not url.is_empty
			do
				Result := create {YODA_LINK}.make_external(content, url)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		link_anchor(u_content: YODA_ELEMENT; u_linked_anchor: YODA_ANCHOR): YODA_LINK
			--Factory that creates an instance of YODA_LINK with the content, the clickable YODA_ELEMENT and a specific anchor-element, and returns it to the user
			--There are four different links in YODA. This one represents an anchor link, so a jump inside a document to a specific place where an anchor is located
			--For this reason, this factory calls the make_anchor funciton in the LINK class which takes such a specific anchor object to link to
			--To interacti width this factory needs just a local anchor object and the clickable element
			--local anchor: YODA_ANCHOR
			--anchor := yoda.anchor("TopOfDocument")
			--yoda.link_anchor(yoda.text("Click here!"), anchor)
--			require
--				u_content_exists: attached u_content
--				anchor_exists: attached u_linked_anchor
--				u_linked_anchor_correct_type: attached {YODA_ANCHOR} u_linked_anchor
			do
				Result := create {YODA_LINK}.make_anchor (u_content, u_linked_anchor)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		email(mail_address: STRING): YODA_LINK
			--Factory that creates an instance of YODA_LINK with the content, the e-mail that should be sent to, and returns it to the user
			--There are four different links in YODA. This one represents an e-mail link, so clicking on it shall open the standard mailing software with the provided mail as the receiver
			--For this reason, this factory calls the make_email funciton in the LINK class which just takes an e-mail and makes it clickable
			--To interact with this factory, the user passes an e-mail, but NO yoda_element. The e-mail will be shown as a text and is linkable.
			--yoda.email("admin@yoda.ch")
--			require
--				mail_address_exists: attached mail_address
--				string_not_empty: not mail_address.is_empty
			do
				Result := create {YODA_LINK}.make_email(mail_address)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_LINK} Result
			end


		anchor(id: STRING): YODA_ANCHOR
			--Factory that creates an instance of YODA_ANCHOR with the id-string the user passed as an argument, and returns it to the user
			--Such an anchor is an empty element with just an iD, it is not visible in the document itself. Its only purpose is to mark a special place of interest that can be linked.
			--the interaction with this factory looks as follows:
			--First, the user creates an local feature of such an anchor element
			--local anchor: YODA_ANCHOR
			--Next, the user creates such an anchor using this factory here: anchor := yoda.anchor("Some ID/name")
--			require
--				id_exists: attached id
--				id_not_empty: not id.is_empty
			do
				Result := create {YODA_ANCHOR}.make(id)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_ANCHOR} Result
			end


		image(content: STRING): YODA_IMAGE
			--This factory serves as an interface for the user. When he just want to create an image and does not specify what kind of image, we assume he likes to have an internal one.
			--So this factory just calls the image_intern factory with the same arguments. For this reason, no contracts are needed, they are all located inthe image_intern factory.
			--the interaction with this factory looks as follows: yoda.image("../images/yoda.gif")
			do
				Result := image_local(content)
			end


		image_local(content: STRING): YODA_IMAGE
			--Factory that creates an instance of YODA_IMAGE with a string containing the local path to this image that the user passed as an argument, and returns it to the user
			--the interaction with this factory looks as follows: yoda.image("../images/yoda.gif")
--			require
--				image_content_exists: attached content
--				string_not_empty: not content.is_empty
--				File_exists: is_valid_file(u_content)
			do
				Result := create {YODA_IMAGE}.make_local(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_IMAGE} Result
			end


		image_external(content: STRING): YODA_IMAGE
			--Factory that creates an instance of YODA_IMAGE with a string containing an online link to some image that the user passed as an argument, and returns it to the user
			--the interaction with this factory looks as follows: yoda.image_extern("http://www.yoda.ch/logo.jpg")
--			require
--				image_content_exists: attached content
--				string_not_empty: not content.is_empty
			do
				Result := create {YODA_IMAGE}.make_external(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_IMAGE} Result
			end


		snippet(content: STRING): YODA_SNIPPET
			do
				Result := current.snippet_from_file(content)
			end

		snippet_from_string(content: STRING): YODA_SNIPPET
			--Factory that creates an instance of YODA_SNIPPET with a string containing some text the user wants to insert into the document, and returns it to the user
			--the interaction with this factory looks as follows: yoda.snippet("Some freely chosen text that is not parsed")
--			require
--				snippet_content_exists: attached content
--				string_not_empty: not content.is_empty
			do
				Result := create {YODA_SNIPPET}.make_string(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_SNIPPET} Result
			end


		snippet_from_file(content: STRING): YODA_SNIPPET
			--Factory that creates an instance of YODA_SNIPPET with a string containing a local path to a file containing the text to insert, and returns it to the user
			--the interaction with this factory looks as follows: yoda.snippet_from_file("../snippets/snippet.txt")
--			require
--				snippet_content_exists: attached content
--				string_not_empty: not content.is_empty
--				file_is_valid: is_valid_file(filepath)
			do
				Result := create {YODA_SNIPPET}.make_file(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_SNIPPET} Result
			end


		bold(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "bold", and return it to the user
			--The interacion is simple: yoda.bold( yoda.text("Some text") )
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_BOLD}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		code(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "code", and return it to the user
			--The interacion is simple: yoda.code( yoda.text("Some text") )
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_CODE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		italic(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "italic", and return it to the user
			--The interacion is simple: yoda.italic( yoda.text("Some text") )
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_ITALIC}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		quote(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "quote", and return it to the user
			--The interacion is simple: yoda.quote( yoda.text("Some text") )
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_QUOTE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		underline(content: YODA_TEXT_INTERFACE): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "unterline", and return it to the user
			--The interacion is simple: yoda.underline( yoda.text("Some text") )
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_UNDERLINE}.make_style(content)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		title(content: YODA_TEXT_INTERFACE; strength: INTEGER): YODA_TEXT_INTERFACE
			--Factory that creates an instance of YODA_TEXT_INTERFACE that surrounds some text with a styling attribute, in this case "title", and return it to the user
			--The title styling has an additional attribute "strenght" that defines the size of a title, with 1 being the biggest possible title.
			--The interacion is simple: yoda.title( yoda.text("Some text"), 1)
--			require
--				content_exists: attached content
--				element_type_YODA_TEXT: attached {YODA_TEXT_INTERFACE} content
			do
				Result := create {TEXT_DECORATOR_TITLE}.make_style_with_attribute(content,strength)
			ensure
				result_not_void: attached Result
				result_is_YODA_LINK: attached {YODA_TEXT_INTERFACE} Result
			end


		b(content: STRING): STRING
			--This little function takes a content String from the user and returns it surrounded with yoda-specific bold-tags that tells the renderer to make the text
			--in between bold.
			--The Interaction looks as follwos: yoda.text( "Yoda, make" + yoda.b(" THIS ") + "bold please")
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{b}}"+content+"{{/b}}"
			ensure
				result_not_void: attached Result
				bold_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{b}}")
				valid_end_tag: Result.has_substring ("{{/b}}")
			end


		i(content: STRING): STRING
			--This little function takes a content String from the user and returns it surrounded with yoda-specific italic-tags that tells the renderer to make the text
			--in between italic.
			--The Interaction looks as follwos: yoda.text( "Yoda, make" + yoda.b(" THIS ") + "italic please")
			require
				content_exists: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{i}}"+content+"{{/i}}"
			ensure
				result_not_void: attached Result
				italic_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{i}}")
				valid_end_tag: Result.has_substring ("{{/i}}")
			end


		u(content: STRING): STRING
			--This little function takes a content String from the user and returns it surrounded with yoda-specific underline-tags that tells the renderer to make the text
			--in between underline.
			--The Interaction looks as follwos: yoda.text( "Yoda, make" + yoda.b(" THIS ") + "underline please")
			require
				content_not_empty: attached content
				content_not_empty: not content.is_empty
			do
				Result := "{{u}}"+content+"{{/u}}"
			ensure
				result_not_void: attached Result
				underline_text_not_empty: not Result.is_empty
				valid_start_tag: Result.has_substring("{{u}}")
				valid_end_tag: Result.has_substring ("{{/u}}")
			end

end
