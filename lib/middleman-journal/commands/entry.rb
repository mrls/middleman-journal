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
        File.dirname(__FILE__)
      end

      def entry
        @date = Time.now
        @title = @date.strftime('%F')
        @slug = @date.strftime('%F')

        app = ::Middleman::Application.new do
          config[:mode]              = :config
          config[:disable_sitemap]   = true
          config[:watcher_disable]   = true
          config[:exit_before_ready] = true
        end

        template template_path, destination_path
      end

      private

      def template_path
        File.expand_path('entry.tt', File.dirname(__FILE__))
      end

      def destination_path
        path = File.join(app.source_dir, 'journal', "#{@title}.html.markdown")

        if File.exist?(absolute_entry_path)
          throw "An entry for #{@title} already exists: #{path}"
        end

        path
      end

      # Add to CLI
      Base.register(self, 'entry', 'entry', 'Add a new entry to the journal')
    end
  end
end
