require "nina/version"

module Nina
  class Application
    def call(env)
      [200, { "Content-type" => "text/html"}, ["Hello World Nina"]]
    end
  end
end
