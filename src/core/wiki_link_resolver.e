note
	description: "Summary description for {WIKI_LINK_RESOLVER}."
	author: ""
	date: "$Date: 2014-08-08 12:28:23 +0200 (ven., 08 août 2014) $"
	revision: "$Revision: 95589 $"

deferred class
	WIKI_LINK_RESOLVER

inherit
	WIKI_ITEM_RESOLVER

feature -- Access

	wiki_url (a_link: WIKI_LINK; a_page: detachable WIKI_PAGE): detachable STRING
			-- URL accessing the wiki link `a_link' in the context of `a_page'.
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
