note
	description: "[
	An YODA-Element can be added to a YODA-Document an arbitrary number of times, at arbitrary places.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"
	coverage: "0 Percent (covered in Test FR #1.2.3.1)"

class
	TEST_1_2_3_2

inherit
	TEST_INTERFACE
		redefine
			on_prepare
		end


feature {NONE} -- Events
	Death_Star: YODA_DOCUMENT
	Stormtrooper: YODA_TEXT


	on_prepare
			-- <Precursor>
		do
			create Death_Star.make("Death_Star")
			create Stormtrooper.make("piew, piew, piew")
		end

feature -- Test routines

	test_1_2_3_2
			-- New test routine
		note
			testing:  "covers/{YODA_DOCUMENT}.add_element"
		do
			Death_Star.add_element(Stormtrooper)
			assert("Add Text-Element to a Document once, Count correct",equal(Death_Star.elements.count , 1))
			assert("Add Text-Element to a Document once, Occurences correct",equal(Death_Star.elements.occurrences(Stormtrooper) , 1))
			Death_Star.add_element(Stormtrooper)
			assert("Add Text-Element to a Document twice, Count correct",equal(Death_Star.elements.count , 2))
			assert("Add Text-Element to a Document twice, Occurences correct",equal(Death_Star.elements.occurrences(Stormtrooper) , 2))
			Death_Star.add_element(Stormtrooper)
			Death_Star.add_element(Stormtrooper)
			Death_Star.add_element(Stormtrooper)
			assert("Add Text-Element to a Document five times, Count correct",equal(Death_Star.elements.count , 5))
			assert("Add Text-Element to a Document five times, Occurences correct",equal(Death_Star.elements.occurrences(Stormtrooper) , 5))
		end

end


