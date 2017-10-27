note
	description: "Document that contain elements."
	author: "Joel Barmettler"
	date: "$25.10.17$"
	revision: "$27.10.2017$"
class
	YODA_DOCUMENT

	create
		make

	feature {ANY}
		--name and elements shall be public, allow access for everybody
		elements: LINKED_LIST[YODA_ELEMENT]
		renderer_instances: ARRAY[RENDERER]
		renderer_names: ARRAY[STRING]
		name: STRING

	feature {ANY}
		make(u_name: STRING)
			--creates instance of document, uses name for it
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		add_element(element: YODA_ELEMENT)
			--some fancy comment
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


		render(output_format: STRING): STRING
			--zbsp string = website und ruft auf alle unterdocumente render auf
			--braucht instanz von renderers (in einem array gespeichert)sobald renderer gebaucht wird
			require
				placeholder: True
			do
				--comment what is done
			ensure
				placeholder: True
			end


	invariant
		placeholder: True
		elements_never_void: elements /= void implies elements.count > 0
end
