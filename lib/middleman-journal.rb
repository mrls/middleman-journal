require 'middleman-core'
require 'middleman-journal/version'

Middleman::Extensions.register :journal do
  require 'middleman-journal/extension'
  require 'middleman-journal/commands/entry'

  JournalExtension
end
