require 'date'
require 'middleman-journal/journal_data'
require 'middleman-journal/journal_entry'
require 'middleman-journal/helpers'

class JournalExtension < Middleman::Extension
  option :date, nil, 'Unique ID for journal entry'

  # @return [JournalData] journal data for this journal, which has all
  # information about the journal entries
  attr_reader :data

  def initialize(app, options_hash = {}, &block)
    super
  end

  def after_configuration
    options = {}
    @data = Middleman::Journal::JournalData.new(@app, self, options)
    @app.sitemap.register_resource_list_manipulator(:journal_entries, @data)
  end
end
