require_relative './helper'

Protest.describe 'Get' do

  it 'return a Net::HTTPOK on a valid url' do
    response = Achetepe.get(TestApp.url) do |response|
      assert_equal response.class, Net::HTTPOK
    end

    assert_equal Thread, response.class
    response.join
  end

  it 'return a Net::HTTPNotFound' do
    response = Achetepe.get(TestApp.url + 'not_found') do |response|
      assert_equal response.class, Net::HTTPNotFound
    end

    assert_equal Thread, response.class
    response.join
  end

  it "executes the block as soon as a response is received" do
    ordered_responses = []

    get1 = Achetepe.get(TestApp.url + 'slow_request') do |response|
      ordered_responses << 'slow_request'
    end

    sleep(1)

    get2 = Achetepe.get(TestApp.url) do |response|
      ordered_responses << 'root'
    end

    get1.join
    get2.join

    assert_equal ['root', 'slow_request'], ordered_responses
  end

end
