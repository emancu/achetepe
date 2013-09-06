require "net/http"

class Achetepe
  class << self

    def get(url, &block)
      uri = URI(url)

      Thread.new do
        response = Net::HTTP.get_response(uri)

        yield response
      end
    end

  end
end
