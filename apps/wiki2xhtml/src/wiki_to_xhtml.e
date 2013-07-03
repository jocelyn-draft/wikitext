note
	description : "Objects that ..."
	author      : "$Author$"
	date        : "$Date$"
	revision    : "$Revision$"

class
	WIKI_TO_XHTML

inherit
	SHARED_EXECUTION_ENVIRONMENT

create
	make

feature {NONE} -- Initialization

	make
			-- Initialize `Current'.
		local
			args: ARGUMENTS_32
			fn: detachable READABLE_STRING_32
			p: PATH
			wi: WIKI_INDEX
			wp: WIKI_PAGE
			i,n: INTEGER
		do
			create args
			if attached args.argument_array as arr then
				from
					i := arr.lower + 1
					n := arr.upper
				until
					i > n
				loop
					fn := arr[i]
					create p.make_from_string (fn)
					print ("Analyze " + p.utf_8_name + "%N")

					if fn.ends_with_general (".index") then
						create wi.make ("Book", p)
						wi.analyze
						if attached wi.book as b then
							b.process (create {WIKI_DEBUG_VISITOR}.make)
						end
					elseif attached p.extension as ext then
						create wp.make ("Iron", "iron")
						wp.get_structure (p)
						wp.process (create {WIKI_DEBUG_VISITOR}.make)
					end
					i := i + 1
				end
			end
		end

feature -- Status

feature -- Access

feature -- Change

feature {NONE} -- Implementation

invariant
--	invariant_clause: True

end
