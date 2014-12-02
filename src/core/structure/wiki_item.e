note
	description: "Summary description for {WIKI_ITEM}."
	author: ""
	date: "$Date: 2014-05-19 23:19:11 +0200 (lun., 19 mai 2014) $"
	revision: "$Revision: 95115 $"

deferred class
	WIKI_ITEM

inherit
	WIKI_HELPER

feature -- Visitor

	process (a_visitor: WIKI_VISITOR)
		require
			a_visitor_attached: a_visitor /= Void
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
