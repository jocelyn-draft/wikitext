note
	description: "Summary description for {WIKI_TEXT}."
	author: ""
	date: "$Date: 2014-12-02 11:11:23 +0100 (mar., 02 déc. 2014) $"
	revision: "$Revision: 96211 $"

deferred class
	WIKI_TEXT

inherit
	ITERABLE [WIKI_ITEM] -- related to wiki structure

feature -- Access

	new_cursor: ITERATION_CURSOR [WIKI_ITEM]
			-- Fresh cursor associated with current structure
		do
			Result := structure.new_cursor
		end

feature -- Access

	structure: WIKI_STRUCTURE
		deferred
		end

note
	copyright: "2011-2014, Jocelyn Fiat and Eiffel Software"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Jocelyn Fiat
			Contact: http://about.jocelynfiat.net/
		]"
end
