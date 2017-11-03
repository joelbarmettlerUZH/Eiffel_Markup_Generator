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
				-- Run application.
			local
				elements_of_list: ARRAY[YODA_ELEMENT]
				elements_of_list_2: ARRAY[YODA_ELEMENT]
				elements_of_list_3: ARRAY[YODA_ELEMENT]
				doc: YODA_DOCUMENT
				array_2_dim: ARRAY2[YODA_ELEMENT]
				array_2_dim_2: ARRAY2[YODA_ELEMENT]
				array_2_dim_3: ARRAY2[YODA_ELEMENT]
			do
				--| Add your code here
				create yoda
				print((yoda.text("Yoda funktionieren tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda {{b}}funktionieren{{/b}} tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("{{b}}Yoda funktionieren tut!{{/b}}")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda {{u}}funktionieren{{/u}} tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda {{i}}funktionieren{{/i}} tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda {{y}}funktionieren{{/y}} tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda <b>funktionieren</b> tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("Yoda <pre>funktionieren</pre> tut!")).render (create {HTML_RENDERER}, 0))
				print((yoda.text("%NYoda funktionieren%N tut!%N")).render (create {HTML_RENDERER}, 0))
					-- %N is not replaced if at beginning or end. it get removed but not replaced!
				print((yoda.text("{{n}}Yoda funktionieren{{n}} tut!{{n}}")).render (create {HTML_RENDERER}, 0))

				--List
				elements_of_list := <<yoda.text("list element 2"),yoda.text("list element 3")>>
				--print(yoda.list(elements_of_list).render (create {HTML_RENDERER}, 0))
				elements_of_list_2 := <<yoda.text("list element 1"),yoda.list(elements_of_list),yoda.text("list element 4")>>
				--print(yoda.list(elements_of_list_2).render (create {HTML_RENDERER}, 1))
				elements_of_list_3 := <<yoda.list(elements_of_list)>>
				print(yoda.list(elements_of_list_3).render (create {HTML_RENDERER}, 1))
				--print(yoda.list().render (create {HTML_RENDERER}, 1)) --Perfect

				--Decorators
				print((yoda.bold(yoda.text("Yoda funktionieren tut!"))).render (create {HTML_RENDERER}, 1))
				print(yoda.italic((yoda.bold(yoda.text("Yoda funktionieren tut!")))).render (create {HTML_RENDERER}, 1))
				print(yoda.title(yoda.quote(yoda.code(yoda.underline(yoda.italic((yoda.bold(yoda.text("Yoda funktionieren tut!"))))))),4).render (create {HTML_RENDERER}, 1))

				--Image
				print((yoda.image("https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 0))
				print((yoda.image("https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 3))

				--Image in list
				elements_of_list := <<yoda.image("https://www.uzh.ch/logo.jpg"),yoda.image("https://www.uzh.ch/logo.jpg")>>
				print(yoda.numbered_list(elements_of_list).render (create {HTML_RENDERER}, 0))
				print(yoda.bulletpoint_list(elements_of_list).render (create {HTML_RENDERER}, 0))

				--link (extern)
				print((yoda.link(yoda.text("pepe"),"https://www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 3))
				print((yoda.link(yoda.text("pepe"),"www.uzh.ch/logo.jpg")).render (create {HTML_RENDERER}, 0))

				-- link (intern)
				create doc.make("Opepe")
				print((yoda.link_intern(yoda.text("Yoda funktionieren tut!"),doc)).render (create {HTML_RENDERER}, 0))
				print((yoda.link(yoda.image("https://www.uzh.ch/logo.jpg"),"www.yoda.ch")).render (create {HTML_RENDERER}, 1))
				print((yoda.email("yoda@master.ch")).render (create {HTML_RENDERER}, 1))

				--snippet
				print((yoda.snippet("<html>%N%T<head>%N%T%T<title>Page Title</title>%N%T</head>%N%T<body>%N%T<h1>This is a Heading</h1>%N%T<p>This is a paragraph.</p>%N%T</body>%N</html>")).render (create {HTML_RENDERER}, 2))

				--table oh gott
				create array_2_dim.make_filled (yoda.text("table entry!"), 2, 4)
				print((yoda.table(array_2_dim)).render (create {HTML_RENDERER}, 1))
				create array_2_dim_2.make_filled (yoda.text("table entry!"), 1, 1)
				print((yoda.table(array_2_dim_2)).render (create {HTML_RENDERER}, 1))
				create array_2_dim_3.make_filled (yoda.text("table entry!"), 5, 4)
				array_2_dim_3[1,1]:=yoda.table(array_2_dim)
				array_2_dim_3[2,1]:=yoda.image("https://www.uzh.ch/logo.jpg")
				print((yoda.table(array_2_dim_3)).render (create {HTML_RENDERER}, 1))
			end


end
