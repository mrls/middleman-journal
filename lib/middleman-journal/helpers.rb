module Middleman
  module Blog
    module Helpers
      def journal
        app.extensions[:journal].data
      end
    end
  end
end
