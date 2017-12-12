note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	TEST_1_3_4_4

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end

feature {NONE} -- Events
factory: YODA
email1: YODA_LINK



	on_prepare
			-- <Precursor>
		do
			create factory
			create email1.make_email("yoda@power.yedi")
		end

feature -- Test routines

	TEST_1_3_4_4
			-- New test routine
		note
			testing:  "covers/{HTML_VALIDATOR}.validate_link", "covers/{YODA}.email",
			          "covers/{YODA_LINK}.make_email"
		local
			obiwan: YODA_LINK
		do
			--check email1.make_email("yoda@power.yedi")
			assert ("test email with parameter yoda@power.yedi", equal(equal(
			equal(email1.url.count > 0, True),
			equal(email1.name, "eMail")),
			equal(attached {YODA_TEXT} email1.content , True)))

			assert ("email url is of type YODA_TEXT", equal(attached {YODA_TEXT} email1.content, True))

			--not void precon check
			assert ("eMail is of type YODA_LINK", equal(attached {YODA_LINK} email1, True))
			assert ("eMail.content is of type YODA_TEXT", equal(attached {YODA_TEXT} email1.content, True))

			--check through factory {YODA}
			obiwan := factory.email ("yoda@power.yedi")
			assert ("test of internal link with factory and the parameter text and doc", equal(equal(
			equal(obiwan.url.count > 0, True),
			equal(obiwan.name, "eMail")),
			equal(obiwan.content.name, "text")))

			--check precon
			precon_function_trigger(agent factory.email ("not valid"), "u_content_valid")
			precon_function_trigger(agent factory.email (""), "string_not_empty")

			--check
			assert ("test if obiwan email contains mailto:", equal((obiwan.url).has_substring("mailto:"), True))
			assert ("test if obiwan url contains @", equal(obiwan.url.has_substring("@"), True))
		end
end
