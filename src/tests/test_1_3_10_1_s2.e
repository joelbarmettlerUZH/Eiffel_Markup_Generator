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
	coverage: "1.38 Percent"

class
	TEST_1_3_10_1_S2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	renderer: HTML_RENDERER
	snippet1: YODA_SNIPPET
	snippet2: YODA_SNIPPET


	on_prepare
			-- <Precursor>
		do
			create snippet1.make_string("<span style='color:green'>Strong, the <b>Force</b> is here</span>")
			create snippet2.make_string("<span style='color:green'>Strong, %Nthe <b>Force</b> is here</span>")
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s2
			--New test routine
		note
			testing:  "covers/{RENDERER}.spaces", "covers/{YODA_SNIPPET}.render",
			          "covers/{HTML_RENDERER}.render_snippet"
		do
			assert("Snippet is rendered with preserved, unchanged input",
				equal(snippet1.render(renderer, 0), "<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Positive Nesting with single line Snippets works",
				equal(snippet1.render(renderer, 1), "%T<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			precon_function_trigger(agent snippet1.render (renderer, -1), "is_valid_nesting")
			assert("Deeper Nesting adds more Tabs before snippet",
				equal(snippet1.render(renderer, 3), "%T%T%T<span style='color:green'>Strong, the <b>Force</b> is here</span>%N"))
			assert("Nesting works even with multiple line snippets",
				equal(snippet2.render(renderer, 3), "%T%T%T<span style='color:green'>Strong, %N%T%T%Tthe <b>Force</b> is here</span>%N"))
		end

end


