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
			vis: WIKI_VISITOR
			l_to_stdout: BOOLEAN
			l_append_to_file: detachable READABLE_STRING_GENERAL
			l_save_to_file: detachable READABLE_STRING_GENERAL
			s: STRING
			l_args: ARRAYED_LIST [READABLE_STRING_32]
		do
			create args
			if attached args.argument_array as arr then
				create l_args.make (arr.count)
				from
					i := arr.lower + 1
					n := arr.upper
				until
					i > n
				loop
					if arr[i].starts_with ("-") then
						if arr[i].same_string_general ("--stdout") then
							l_to_stdout := True
						elseif arr[i].same_string_general ("--to-file") then
							i := i + 1
							if arr.valid_index (i) then
								l_save_to_file := arr[i]
							end
						elseif arr[i].same_string_general ("--append-to-file") then
							i := i + 1
							if arr.valid_index (i) then
								l_append_to_file := arr[i]
							end
						end
					else
						l_args.force (arr[i])
					end
					i := i + 1
				end
				if l_save_to_file = Void and l_append_to_file = Void then
					l_to_stdout := True
				end
				across
					l_args as c
				loop
					fn := c.item
					create p.make_from_string (fn)
					io.error.put_string ("Analyze " + p.utf_8_name + "%N")

					if fn.ends_with_general (".index") then
						create {WIKI_DEBUG_VISITOR} vis.make
						create wi.make ("Book", p)
						wi.analyze
						if attached wi.book as b then
							b.process (vis)
						end
					elseif attached p.extension as ext then
						create s.make (1024)
						create {WIKI_XHTML_GENERATOR} vis.make (s)

						create wp.make ("Iron", "iron")
						wp.get_structure (p)
						wp.process (vis)
						if l_append_to_file /= Void then
							append_text_to (s, create {PATH}.make_from_string (l_append_to_file))
							io.error.put_string ("Appended HTML to file " + l_append_to_file.as_string_8 + "%N")
						end
						if l_save_to_file /= Void then
							save_text_to (s, create {PATH}.make_from_string (l_save_to_file))
							io.error.put_string ("Saved HTML to file " + l_save_to_file.as_string_8 + "%N")
						end
						if l_to_stdout then
							print (s)
						end
					end
				end
			end
		end

	append_text_to (s: READABLE_STRING_8; fn: PATH)
		local
			f: RAW_FILE
		do
			create f.make_with_path (fn)
			if not f.exists or else f.is_access_writable then
				f.open_append
				f.put_string (s)
				f.close
			else
				io.error.put_string ("[ERROR] could not save to file!%N")
			end
		end

	save_text_to (s: READABLE_STRING_8; fn: PATH)
		local
			f: RAW_FILE
		do
			create f.make_with_path (fn)
			if not f.exists or else f.is_access_writable then
				f.create_read_write
				f.put_string (s)
				f.close
			else
				io.error.put_string ("[ERROR] could not save to file!%N")
			end
		end


feature -- Status

feature -- Access

feature -- Change

feature {NONE} -- Implementation

invariant
--	invariant_clause: True

end
