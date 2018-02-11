module Middleman
  module Journal
    module JournalEntry
      def self.extended(base)
        base.class.send(:attr_accessor, :journal_controller)
      end

      def title
        data['date']
      end

      def date
        data['date']
      end
    end
  end
end
