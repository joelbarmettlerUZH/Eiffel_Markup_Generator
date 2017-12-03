note
	description: "YODA application root class"
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"

class
	APPLICATION

	inherit
		ARGUMENTS

	create
		make

	feature {ANY}
		yoda: YODA

	feature {NONE} -- Initialization

		make
				 --Run application.
			local
				elements_of_list: ARRAY[YODA_ELEMENT]
				index: YODA_DOCUMENT
				about: YODA_DOCUMENT
				yodalib: YODA_PROJECT
				table1: ARRAY2[YODA_ELEMENT]
				table2: ARRAY2[YODA_ELEMENT]
				anchor1: YODA_ANCHOR
			do
				--| Add your code here
				create yoda
				create index.make ("index")
				create about.make ("about")
				create yodalib.make ("yodalib")
				yodalib.add_document (index)
				yodalib.add_document (about)
				index.add_element (yoda.title (yoda.text ("Welcome to the YODA-Homepage"), 1))
				index.add_element (yoda.text ("Let's show what yoda can do:"))
				index.add_element (yoda.title (yoda.text ("Formatting Text"), 2))
				index.add_element (yoda.title (yoda.text ("Inline Formating"), 3))
				index.add_element (yoda.text ("First, you can make your text {{b}}bold{{/b}}, {{i}}italic{{/i}} or {{u}}underline{{/u}} flexible in the text."))
				index.add_element (yoda.underline(yoda.italic(yoda.bold(yoda.text ("And by using the decorators, even all together")))))
				index.add_element (yoda.title (yoda.text ("Preformatted Styling"), 3))
				index.add_element (yoda.text ("Additionally, we offer styling features like this quote from our lord and saviour:"))
				index.add_element (yoda.title (yoda.text ("Quote"), 4))
				index.add_element (yoda.quote (yoda.text ("May the Force be with you, my little padawan")))
				index.add_element (yoda.title (yoda.text ("Code"), 4))
				index.add_element (yoda.code (yoda.text ("Yoda also offers the ability to show code{{n}}even over multiple lines{{n}}like we did here")))
				index.add_element (yoda.title (yoda.text ("Complex Data Structure"), 2))
				index.add_element (yoda.text ("For more complex data, you have the ability to create lists"))
				index.add_element (yoda.title (yoda.text ("Bulletpoint List"), 3))
				elements_of_list := <<yoda.text("First Entry"),yoda.text("Second Entry"), yoda.text("Third Entry")>>
				index.add_element (yoda.bulletpoint_list (elements_of_list))
				index.add_element (yoda.title (yoda.text ("Numbered List"), 3))
				index.add_element (yoda.numbered_list (elements_of_list))
				anchor1 := yoda.anchor ("Table1")
				index.add_element (anchor1)
				index.add_element (yoda.title (yoda.text ("Table"), 3))
				index.add_element (yoda.text ("Or even tables:"))
				create table1.make_filled (yoda.text("Entry"), 5, 4)
				create table2.make_filled (yoda.text("Table in Table"), 2, 2)
				table1[5,1] := yoda.image ("resources/yoda.gif")
				table1[5,2] := yoda.numbered_list (elements_of_list)
				table1[5,3] := yoda.list (elements_of_list)
				table1[5,4] := yoda.table (table2)
				index.add_element (yoda.table (table1))
				index.add_element (yoda.title (yoda.text ("Images"), 2))
				index.add_element (yoda.text ("To show fancy stuff, you can link images online or offline"))
				index.add_element (yoda.image_external ("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg"))
				index.add_element (yoda.title (yoda.text ("Links"), 2))
				index.add_element (yoda.text ("You are free to link to other files in your project or online websites"))
				index.add_element (yoda.title (yoda.text ("External link"), 3))
				index.add_element (yoda.link_external (yoda.text ("Make simple links around texts"), "http://www.jedipedia.wikia.com/wiki/Yoda"))
				index.add_element (yoda.title (yoda.text ("Local link"), 3))
				index.add_element (yoda.link_intern (yoda.text ("Or, link to other documents like this link here"), about))
				index.add_element (yoda.title (yoda.text ("email link"), 2))
				index.add_element (yoda.email ("support@yoda.ch"))
				index.add_element (yoda.title (yoda.text ("Button as link"), 3))
				index.add_element (yoda.link_external (yoda.image_external ("http://icons.iconarchive.com/icons/iconsmind/outline/64/Play-Music-icon.png"), "https://www.youtube.com/watch?v=kDoY_zXf7uQ"))
				index.add_element (yoda.title (yoda.text ("Anchor Link"), 3))
				index.add_element (yoda.link_anchor (yoda.text ("This links up to the table"), anchor1))
				about.add_element (yoda.title (yoda.text ("This is the about us page now :)"), 3))
				about.add_element (yoda.snippet_from_file ("resources/snippet.txt"))
				about.add_element (yoda.link_intern (yoda.text ("Take me back to main, my little padawan"), index))
				print(yodalib.render("html")[0])
				print(yodalib.render("html")[1])
				yodalib.print_to_console
				--index.save ("html", "resources/template.txt")
				yodalib.save ("html", "resources/template.txt")
			end


end
