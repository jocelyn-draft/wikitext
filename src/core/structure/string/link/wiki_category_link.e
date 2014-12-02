note
	description: "Summary description for {WIKI_CATEGORY_LINK}."
	date: "$Date: 2013-08-02 11:42:20 +0200 (ven., 02 août 2013) $"
	revision: "$Revision: 92840 $"

class
	WIKI_CATEGORY_LINK

inherit
	WIKI_LINK
		redefine
			process
		end

create
	make

feature -- Visitor

	process (a_visitor: WIKI_VISITOR)
		do
			a_visitor.visit_category_link (Current)
		end

note
	copyright: "2011-2013, Jocelyn Fiat and Eiffel Software"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Jocelyn Fiat
			Contact: http://about.jocelynfiat.net/
		]"
end
