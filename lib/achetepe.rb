require "net/http"

class Achetepe
  class << self

    def get(url, &block)
      uri = URI(url)

      Thread.new do
        yield Net::HTTP.get_response(uri)
      end
    end

    def post(url, params = {}, &block)
      uri = URI(url)

      Thread.new do
        yield Net::HTTP.post_form(uri, params)
      end
    end

  end
end
