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
				elements_of_list_2: ARRAY[YODA_ELEMENT]
				elements_of_list_3: ARRAY[YODA_ELEMENT]
				index: YODA_DOCUMENT
				doc: YODA_DOCUMENT
				about: YODA_DOCUMENT
				yodalib: YODA_PROJECT
				array_2_dim: ARRAY2[YODA_ELEMENT]
				array_2_dim_2: ARRAY2[YODA_ELEMENT]
				array_2_dim_3: ARRAY2[YODA_ELEMENT]
				anchor1: YODA_ANCHOR
			do
				--| Add your code here
				create yoda
--				print((yoda.text("Yoda funktionieren tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda {{b}}funktionieren{{/b}} tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("{{b}}Yoda funktionieren tut!{{/b}}")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda {{u}}funktionieren{{/u}} tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda {{i}}funktionieren{{/i}} tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda {{y}}funktionieren{{/y}} tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda <b>funktionieren</b> tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("Yoda <pre>funktionieren</pre> tut!")).render (create {HTML_RENDERER}, 0))
--				print((yoda.text("%NYoda funktionieren%N tut!%N")).render (create {HTML_RENDERER}, 0))
--					-- %N is not replaced if at beginning or end. it get removed but not replaced!
--				print((yoda.text("{{n}}Yoda funktionieren{{n}} tut!{{n}}")).render (create {HTML_RENDERER}, 0))

--				--List
--				elements_of_list := <<yoda.text("list element 2"),yoda.text("list element 3")>>
--				--print(yoda.list(elements_of_list).render (create {HTML_RENDERER}, 0))
--				elements_of_list_2 := <<yoda.text("list element 1"),yoda.list(elements_of_list),yoda.text("list element 4")>>
--				--print(yoda.list(elements_of_list_2).render (create {HTML_RENDERER}, 1))
--				elements_of_list_3 := <<yoda.list(elements_of_list)>>
--				print(yoda.list(elements_of_list_3).render (create {HTML_RENDERER}, 1))
--				--print(yoda.list().render (create {HTML_RENDERER}, 1)) --Perfect

--				--Decorators
--				print((yoda.bold(yoda.text("Yoda funktionieren tut!"))).render (create {HTML_RENDERER}, 1))
--				print(yoda.italic((yoda.bold(yoda.text("Yoda funktionieren tut!")))).render (create {HTML_RENDERER}, 1))
--				print(yoda.title(yoda.quote(yoda.code(yoda.underline(yoda.italic((yoda.bold(yoda.text("Yoda funktionieren tut!"))))))),4).render (create {HTML_RENDERER}, 1))

--				--Image
--				print((yoda.image_extern("https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 0))
--				print((yoda.image_extern("https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 3))

--				--Image in list
--				elements_of_list := <<yoda.image_extern("https://www.uzh.ch/logo.jpg"),yoda.image_extern("https://www.uzh.ch/logo.jpg")>>
--				print(yoda.numbered_list(elements_of_list).render (create {HTML_RENDERER}, 0))
--				print(yoda.bulletpoint_list(elements_of_list).render (create {HTML_RENDERER}, 0))

--				--link (extern)
--				print((yoda.link(yoda.text("pepe"),"https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 3))
--				print((yoda.link(yoda.text("pepe"),"www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 0))

--				-- link (intern)
--				create doc.make("Opepe")
--				print((yoda.link_intern(yoda.text("Yoda funktionieren tut!"),doc)).render (create {HTML_RENDERER}, 0))
--				print((yoda.link(yoda.image_extern("https://www.uzh.ch/logo.jpg"),"www.yoda.ch")).render (create {HTML_RENDERER}, 1))
--				print((yoda.email("yoda@master.ch")).render (create {HTML_RENDERER}, 1))

--				--snippet
--				print((yoda.snippet("<html>%N%T<head>%N%T%T<title>Page Title</title>%N%T</head>%N%T<body>%N%T<h1>This is a Heading</h1>%N%T<p>This is a paragraph.</p>%N%T</body>%N</html>")).render (create {HTML_RENDERER}, 2))

--				--table oh gott
--				create array_2_dim.make_filled (yoda.text("</table>table entry!"), 2, 4)
--				print((yoda.table(array_2_dim)).render (create {HTML_RENDERER}, 1))
--				create array_2_dim_2.make_filled (yoda.text("table entry!"), 1, 1)
--				print((yoda.table(array_2_dim_2)).render (create {HTML_RENDERER}, 1))
--				create array_2_dim_3.make_filled (yoda.text("table entry!"), 5, 4)
--				array_2_dim_3[1,1]:=yoda.table(array_2_dim)
--				array_2_dim_3[2,1]:=yoda.image_extern("https://www.uzh.ch/logo.jpg")
--				print((yoda.table(array_2_dim_3)).render (create {HTML_RENDERER}, 1))

				create index.make ("index")
				create about.make ("about")
				create yodalib.make ("YODALIB")
				yodalib.add_document (index)
				yodalib.add_document (about)
				index.add_element (yoda.title (yoda.text ("Welcome to the YODA-Homepage"), 1))
				index.add_element (yoda.text ("Let's show what yoda can do:"))
				index.add_element (yoda.title (yoda.text ("Formatting Text"), 2))
				index.add_element (yoda.title (yoda.text ("Inline Formating"), 3))
				index.add_element (yoda.text ("First, you can make your text {{b}}bold{{/b}}, {{i}}italic{{/i}} or {{u}}underline{{/u}} flexible in the text."))
				index.add_element (yoda.title (yoda.text ("Preformatted Styling"), 3))
				index.add_element (yoda.text ("Additionally, we offer styling features like this uote from our lord and saviour:"))
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
				create array_2_dim.make_filled (yoda.text("Entry"), 6, 4)
				index.add_element (yoda.table (array_2_dim))
				index.add_element (yoda.title (yoda.text ("Images"), 2))
				index.add_element (yoda.text ("To show fancy stuff, you can link images online or offline"))
				index.add_element (yoda.image_extern ("https://www.sideshowtoy.com/wp-content/uploads/2014/05/400080-product-feature.jpg"))
				index.add_element (yoda.image ("C:\tmp\yoda.gif"))
				index.add_element (yoda.title (yoda.text ("Links"), 2))
				index.add_element (yoda.text ("You are free to link to other files in your project or online websites"))
				index.add_element (yoda.title (yoda.text ("External link"), 3))
				index.add_element (yoda.link_extern (yoda.text ("Make simple links arround texts"), "http://www.jedipedia.wikia.com/wiki/Yoda"))
				index.add_element (yoda.title (yoda.text ("Local link"), 3))
				index.add_element (yoda.link_intern (yoda.text ("Or, link to other documents like this link here"), about))
				index.add_element (yoda.title (yoda.text ("email link"), 2))
				index.add_element (yoda.email ("support@yoda.ch"))
				index.add_element (yoda.title (yoda.text ("Button as link"), 3))
				index.add_element (yoda.link_extern (yoda.image_extern ("http://icons.iconarchive.com/icons/iconsmind/outline/64/Play-Music-icon.png"), "https://www.youtube.com/watch?v=kDoY_zXf7uQ"))
				index.add_element (yoda.title (yoda.text ("Anchor Link"), 3))
				index.add_element (yoda.link_anchor (yoda.text ("This links up to the table"), anchor1))
				about.add_element (yoda.title (yoda.text ("This is the about us page now :)"), 2))
				about.add_element (yoda.snippet_from_file ("resources/snippet.txt"))
				about.add_element (yoda.link_intern (yoda.text ("Take me back to main, my little padawan"), index))
				print(yodalib.render("html")[0])
				yodalib.print_to_console
				--index.save ("html", "resources/template.txt")
				yodalib.save ("html", "resources/template.txt")
			end


end
