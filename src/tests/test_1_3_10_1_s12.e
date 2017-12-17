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
	coverage: "7.11 Percent"

class
	TEST_1_3_10_1_S12

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
	text1: YODA_TEXT
	bold1: TEXT_DECORATOR_BOLD
	italic1: TEXT_DECORATOR_ITALIC
	underline1: TEXT_DECORATOR_UNDERLINE
	code1: TEXT_DECORATOR_CODE
	quote1: TEXT_DECORATOR_QUOTE
	title1: TEXT_DECORATOR_TITLE
	bold2: TEXT_DECORATOR_BOLD
	bold3: TEXT_DECORATOR_BOLD
	renderer: HTML_RENDERER

	on_prepare
			-- <Precursor>
		do
			create text1.make("Wars not make one great")
			create bold1.make_style(text1)
			create italic1.make_style (text1)
			create underline1.make_style (text1)
			create code1.make_style (text1)
			create quote1.make_style (text1)
			create title1.make_style_with_attribute (text1, 1)
			create bold2.make_style (italic1)
			create bold3.make_style (bold1)
			create renderer
		end

feature -- Test routines

	test_1_3_10_1_s12
			-- New test routine
		note
			testing:  "covers/{RENDERER}.render_italic", "covers/{RENDERER}.render_underline",
			          "covers/{RENDERER}.render_title", "covers/{RENDERER}.render_code",
			          "covers/{TEXT_DECORATOR}.render", "covers/{RENDERER}.render_bold",
			          "covers/{RENDERER}.render_qoute"
		do
			assert("decorating a TEXT element with a bold decorator adds <b> tags around the whole text. Decorators correctly remove <p> tags from the text.",
				equal(bold1.render (renderer, 0), "<b><p>Wars not make one great</p></b>%N"))
			assert("decorating a TEXT element with a italic decorator adds <i> tags around the whole text.",
				equal(italic1.render (renderer, 0), "<i><p>Wars not make one great</p></i>%N"))
			assert("decorating a TEXT element with a underline decorator adds <u> tags around the whole text. ",
				equal(underline1.render (renderer, 0), "<u><p>Wars not make one great</p></u>%N"))
			assert("decorating a TEXT element with a code decorator adds <code> tags around the whole text.",
				equal(code1.render (renderer, 0), "<code>Wars not make one great</code>%N"))
			assert("decorating a TEXT element with a quote decorator adds <blockquote> tags around the whole text",
				equal(quote1.render (renderer, 0), "<blockquote>Wars not make one great</blockquote>%N"))
			assert("decorating a TEXT element with a title decorator of strength x adds <hx> tags around the whole text.",
				equal(title1.render (renderer, 0), "<h1>Wars not make one great</h1>%N"))
			precon_function_trigger(agent bold2.render(renderer, -1), "is_valid_nesting")
			assert("Positive nesting adds indentation to outer decorator",
				equal(bold1.render (renderer, 3), "%T%T%T<b><p>Wars not make one great</p></b>%N"))
			assert("Decorators can decorate other Decorators.",
				equal(bold2.render (renderer, 0), "<b><i><p>Wars not make one great</p></i></b>%N"))
			assert("Multiple decorator decorating is possible even of the same type.",
				equal(bold3.render (renderer, 0), "<b><b><p>Wars not make one great</p></b></b>%N"))
		end

end


