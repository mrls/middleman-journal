module Middleman
  module Journal
    class JournalData
      def initialize(app, controller, options)
        @app        = app
        @options    = options
        @controller = controller

        @_entries = []
      end

      def entries
        @_entries
      end

      def manipulate_resource_list(resources)
        resources.each do |resource|
          if resource.path =~ %r/journal\/\d{4}-\d{2}-\d{2}\.html/
            resource.extend JournalEntry
            @_entries << resource
          end
        end
      end
    end
  end
end
