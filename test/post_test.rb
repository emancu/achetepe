require_relative './helper'

Protest.describe 'Post' do

  it 'return a Net::HTTPOK on a valid url' do
    params = { user: 'emancu', pass: 'achetepe_rocks' }

    response = Achetepe.post(TestApp.url + 'login', params) do |response|
      assert_equal response.class, Net::HTTPOK
      assert response.class.ancestors.include?(Net::HTTPResponse)
    end

    assert_equal Thread, response.class
    response.join
  end

  it 'return a Net::HTTPBadRequest' do
    response = Achetepe.post(TestApp.url + 'login') do |response|
      assert_equal response.class, Net::HTTPBadRequest
    end

    assert_equal Thread, response.class
    response.join
  end

  it "executes the block as soon as a response is received" do
    params = { user: 'emancu', pass: 'achetepe_rocks' }
    ordered_responses = []

    get1 = Achetepe.post(TestApp.url + 'slow_post', params) do |response|
      ordered_responses << 'slow_post'
    end

    sleep(1)

    get2 = Achetepe.post(TestApp.url + 'login', params) do |response|
      ordered_responses << 'root'
    end

    get1.join
    get2.join

    assert_equal ['root', 'slow_post'], ordered_responses
  end

end
