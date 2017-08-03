require 'nina'
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "app", "controllers")

module Todolist
  class Application < Nina::Application
  end
end