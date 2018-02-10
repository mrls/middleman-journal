require 'middleman-core/cli'
require 'date'

module Middleman

  module Cli

    ##
    # This class provides an "entry" command for the middleman CLI.
    #
    # @usage bundle exec middleman entry --help
    # @usage bundle exec middleman entry
    #
    ##
    class Entry < ::Thor::Group

      include Thor::Actions

      check_unknown_options!

      # Template files are relative to this file
      # @return [String]
      def self.source_root
        File.dirname( __FILE__ )
      end

      def entry

        @date    = Time.now
				@title   = @date.strftime('%F')
        @slug    = @date.strftime('%F')

        app = ::Middleman::Application.new do
          config[ :mode ]              = :config
          config[ :disable_sitemap ]   = true
          config[ :watcher_disable ]   = true
          config[ :exit_before_ready ] = true
        end

				absolute_entry_path = File.join(app.source_dir, 'journal', "#{@title}.html.markdown")

				if File.exists?(absolute_entry_path)
          throw "An entry for #{@title} already exists: #{absolute_entry_path}"
        end

				entry_template = File.expand_path('entry.tt', File.dirname(__FILE__))

        template entry_template, absolute_entry_path

      end

      protected

      # Add to CLI
      Base.register( self, 'entry', 'entry', 'Add a new entry to the journal' )

		end

	end

end
