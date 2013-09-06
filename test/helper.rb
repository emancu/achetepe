$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../lib"))


require "rubygems"
require "protest"
require "achetepe"
require "cuba"

Protest.report_with(:progress)

class TestApp < Cuba
  def self.url
    'http://localhost:9494/'
  end

  define do
    on get do
      on root do
        res.write "Hello achetepe!"
      end

      on "redirects" do
        res.redirect "/"
      end

      on "slow_request" do
        sleep(2)
        res.write "It takes too much"
      end

      on default do
        res.status = 404
      end
    end
  end
end
