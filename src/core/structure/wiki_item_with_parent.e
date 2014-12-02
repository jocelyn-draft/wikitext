note
	description: "Summary description for {WIKI_ITEM_WITH_PARENT}."
	author: ""
	date: "$Date: 2013-08-02 11:42:20 +0200 (ven., 02 août 2013) $"
	revision: "$Revision: 92840 $"

class
	WIKI_ITEM_WITH_PARENT [G -> WIKI_ITEM]

feature -- Access

	parent: detachable WIKI_COMPOSITE [WIKI_ITEM]

feature -- Element change

	set_parent (p: like parent)
		do
			parent := p
		end

note
	copyright: "2011-2013, Jocelyn Fiat and Eiffel Software"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Jocelyn Fiat
			Contact: http://about.jocelynfiat.net/
		]"
end
