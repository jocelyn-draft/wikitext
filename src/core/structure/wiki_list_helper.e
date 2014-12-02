note
	description: "Summary description for {WIKI_LIST_HELPER}."
	author: ""
	date: "$Date: 2013-08-02 11:42:20 +0200 (ven., 02 août 2013) $"
	revision: "$Revision: 92840 $"

deferred
class
	WIKI_LIST_HELPER

feature -- Access

	valid_kind (k: like list_kind): BOOLEAN
		do
			inspect k
			when ordered_kind, unordered_kind, definition_term_kind, definition_description_kind then
				Result := True
			else
				Result := k = list_kind
			end
		end

	list_kind: CHARACTER = '%U'
	ordered_kind: CHARACTER = '#'
	unordered_kind: CHARACTER = '*'
	definition_term_kind: CHARACTER = ';'
	definition_description_kind: CHARACTER = ':'

note
	copyright: "2011-2013, Jocelyn Fiat and Eiffel Software"
	license: "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Jocelyn Fiat
			Contact: http://about.jocelynfiat.net/
		]"
end
