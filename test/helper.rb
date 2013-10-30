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

    on post do
      on "slow_post" do
        sleep(2)
        res.write "It takes too much"
      end

      on "login" do

        # POST /login, user: foo, pass: baz
        on param("user"), param("pass") do |user, pass|
          res.write "#{user}:#{pass}" #=> "foo:baz"
        end

        # If the params `user` and `pass` are not provided,
        # this block will get executed.
        on true do
          res.status = 400
          res.write "You need to provide user and pass!"
        end
      end

    end
  end
end
