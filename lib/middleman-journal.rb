require "middleman-core"
require "middleman-journal/version"
require "middleman-journal/extension"
require "middleman-journal/commands/entry"

Middleman::Extensions.register :journal do

	JournalExtension
end
