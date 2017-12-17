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
	coverage: "2.22 Percent"

class
	TEST_1_3_10_1_S1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	renderer: HTML_RENDERER
	--features for Subtest 1
	text1: YODA_TEXT
	text2: YODA_TEXT
	text3: YODA_TEXT
	text4: YODA_TEXT
	text5: YODA_TEXT
	text6: YODA_TEXT

	on_prepare
			-- <Precursor>
		do
			create text1.make("Hard working, you must")
			create text2.make("Replace these < symbols > in text")
			create text3.make("{{b}}bold{{/b}}, {{i}}italic{{/i}}, {{u}}underline{{/u}}.")
			create text4.make("{{b}}bold{{/b}}, <b>not bold</b>.")
			create text5.make("break%Nhere.")
			create text6.make("This is {{b}}styled{{/b}} but%Nthis is <b>not</b>")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s1
			-- New test routine
		note
			testing:  "covers/{RENDERER}.spaces", "covers/{YODA_TEXT}.render",
			          "covers/{HTML_RENDERER}.render_text"
		do
			assert("Setting Paragraph Tags around Text",
				equal(text1.render (renderer, 0), "<p>Hard working, you must</p>%N"))
			assert("Nesting adds Tabs before element",
				equal(text1.render (renderer, 1), "%T<p>Hard working, you must</p>%N"))
			precon_function_trigger(agent text1.render (renderer, -1), "is_valid_nesting")
			assert("Deeper Nesting adds more Tabs before element",
				equal(text1.render (renderer, 3), "%T%T%T<p>Hard working, you must</p>%N"))
			assert("Correctly replace not-allowed characters by alternative representation",
				equal(text2.render (renderer, 0), "<p>Replace these &lt; symbols &gt; in text</p>%N"))
			assert("Replace inline styling tags with corresponding HTML Tag",
				equal(text3.render (renderer, 0), "<p><b>bold</b>, <i>italic</i>, <u>underline</u>.</p>%N"))
			assert("Replace inline styling tags with corresponding HTML Tag but replace HTML-Styling Tags as user input by alternative representation.",
				equal(text4.render (renderer, 0), "<p><b>bold</b>, &lt;b&gt;not bold&lt;/b&gt;.</p>%N"))
			assert("Replace eiffel line breaks with HTML line breaks",
				equal(text5.render (renderer, 0), "<p>break<br>here.</p>%N"))
			assert("Breaking lines works with nested structures as well",
				equal(text5.render (renderer, 3), "%T%T%T<p>break<br>here.</p>%N"))
			assert("Linebreaks, nesting, styling and preventing input tags work all together.",
				equal(text6.render (renderer, 3), "%T%T%T<p>This is <b>styled</b> but<br>this is &lt;b&gt;not&lt;/b&gt;</p>%N"))
		end


end


