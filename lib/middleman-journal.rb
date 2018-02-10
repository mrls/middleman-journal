require "middleman-core"

Middleman::Extensions.register :middleman-journal do
  require "my-extension/extension"
  MyExtension
end
