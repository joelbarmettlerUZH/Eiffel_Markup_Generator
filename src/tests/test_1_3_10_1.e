note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_10_1

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	html: HTML_RENDERER
	--features for Subtest 1
	t1: YODA_TEXT
	t2: YODA_TEXT
	t3: YODA_TEXT
	t4: YODA_TEXT
	t5: YODA_TEXT
	t6: YODA_TEXT
	--features for Subtest 1
	s1: YODA_SNIPPET
	s2: YODA_SNIPPET

	on_prepare
			-- <Precursor>
		do
			create html
			--Set-Up for Subtest 1
			create t1.make("Hard working, you must")
			create t2.make("Replace these < symbols > in text")
			create t3.make("{{b}}bold{{/b}}, {{i}}italic{{/i}}, {{u}}underline{{/u}}.")
			create t4.make("{{b}}bold{{/b}}, <b>not bold</b>.")
			create t5.make("break%Nhere.")
			create t6.make("This is {{b}}styled{{/b}} but%Nthis is <b>not</b>")
			--Set-Up for Subtest 2
			create s1.make_string("<span style='color:green'>Strong, the <b>Force</b> is here</span>")
			create s2.make_string("<span style='color:green'>Strong, %Nthe <b>Force</b> is here</span>")
		end

feature -- Test routines

	TEST_1_3_10_1S1
			-- New test routine
		note
			testing:  "covers/{RENDERER}.spaces", "covers/{YODA_TEXT}.render",
			          "covers/{HTML_RENDERER}.render_text"
		do
			assert("Setting Paragraph Tags around Text",equal(t1.render (html, 0), "<p>Hard working, you must</p>%N"))
			assert("Nesting adds Tabs before element",equal(t1.render (html, 1), "%T<p>Hard working, you must</p>%N"))
			precon_trigger(agent t1.render (html, -1), "is_valid_nesting")
			assert("Deeper Nesting adds more Tabs before element",equal(t1.render (html, 3), "%T%T%T<p>Hard working, you must</p>%N"))
			assert("Correctly replace not-allowed characters by alternative representation",equal(t2.render (html, 0), "<p>Replace these &lt; symbols &gt; in text</p>%N"))
			assert("Replace inline styling tags with corresponding HTML Tag",equal(t3.render (html, 0), "<p><b>bold</b>, <i>italic</i>, <u>underline</u>.</p>%N"))
			assert("Replace inline styling tags with corresponding HTML Tag but replace HTML-Styling Tags as user input by alternative representation.", equal(t4.render (html, 0), "<p><b>bold</b>, &lt;b&gt;not bold&lt;/b&gt;.</p>%N"))
			assert("Replace eiffel line breaks with HTML line breaks", equal(t5.render (html, 0), "<p>break<br>here.</p>%N"))
			assert("Breaking lines works with nested structures as well", equal(t5.render (html, 3), "%T%T%T<p>break<br>here.</p>%N"))
			assert("Linebreaks, nesting, styling and preventing input tags work all together.", equal(t6.render (html, 3), "%T%T%T<p>This is <b>styled</b> but<br>this is &lt;b&gt;not&lt;/b&gt;</p>%N"))
		end


	TEST_1_3_10_1S2
			--New test routine
		note
			testing:  "covers/{RENDERER}.spaces", "covers/{YODA_SNIPPET}.render",
			          "covers/{HTML_RENDERER}.render_snippet"
		do
			assert("Snippet is rendered with preserved, unchanged input", equal(s1.render(html, 0), "<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Positive Nesting with single line Snippets works", equal(s1.render(html, 1), "%T<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Negative Nesting with single line Snippets is preserved", equal(s1.render(html, -1), "<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Deeper Nesting adds more Tabs before snippet", equal(s1.render(html, 3), "%T%T%T<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Nesting works even with multiple line snippets", equal(s2.render(html, 3), "%T%T%T<span style='color:green'>Strong, %N%T%T%Tthe <b>Force</b> is here</span>%N"))
		end

end


