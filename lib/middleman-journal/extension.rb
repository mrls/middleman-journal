require 'date'

class JournalExtension < Middleman::Extension
	option :date, Date.today.to_s, 'Unique ID for journal entry'

  def initialize(app, options_hash={}, &block)
    super
  end
end
