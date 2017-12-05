note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_10_1_S4

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text1: YODA_TEXT
	link1: YODA_LINK
	link2: YODA_LINK
	text2: YODA_TEXT
	text3: YODA_TEXT
	list1: YODA_LIST
	link3: YODA_LINK
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create text1.make("Click here, Master Obivan")
			create link1.make_external(text1, "http://www.yoda.ch")
			create link2.make_external(link1, "http://www.force.gg")
			create text2.make("Click here 1")
			create text3.make("Click here 2")
			create list1.make(<<text2, text3>>, False)
			create link3.make_external(list1, "http://www.yoda.ch")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s4
			-- New test routine
		note
			testing:  "covers/{HTML_RENDERER}.render_link", "covers/{YODA_LINK}.render"
		do
			assert("Provided link URL is surrounded with propper <a> tags, link is written in the href='***' part. Putting Link around Text works. Surrounded element is netstd +1 unit.",equal(link1.render (renderer, 0), "<a href='http://www.yoda.ch'>%N%T<p>Click here, Master Obivan</p>%N</a>%N"))
			precon_function_trigger(agent link1.render (renderer, -1), "is_valid_nesting")
			assert("The special Composition of putting a Link around a Link around a Text works",equal(link2.render (renderer, 0), "<a href='http://www.force.gg'>%N%T<a href='http://www.yoda.ch'>%N%T%T<p>Click here, Master Obivan</p>%N%T</a>%N</a>%N"))
			assert("Such a special composition also works with deeper nesting", equal(link2.render (renderer, 1),"%T<a href='http://www.force.gg'>%N%T%T<a href='http://www.yoda.ch'>%N%T%T%T<p>Click here, Master Obivan</p>%N%T%T</a>%N%T</a>%N"))
			assert("The special Composition of putting a Link around a List works with nesting 0", equal(link3.render (renderer, 0), "<a href='http://www.yoda.ch'>%N%T<ul>%N%T%T<li>%N%T%T%TClick here 1%N%T%T</li>%N%T%T<li>%N%T%T%TClick here 2%N%T%T</li>%N%T</ul>%N</a>%N"))
			assert("The special Composition of putting a Link around a List works with nesting 1", equal(link3.render (renderer, 1), "%T<a href='http://www.yoda.ch'>%N%T%T<ul>%N%T%T%T<li>%N%T%T%T%TClick here 1%N%T%T%T</li>%N%T%T%T<li>%N%T%T%T%TClick here 2%N%T%T%T</li>%N%T%T</ul>%N%T</a>%N"))
		end

end


