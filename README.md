achetepe
========

Asynchronous HTTP Requests using Threads

## Dependencies

`achetepe` requires Ruby 1.9 or later.

Install dependencies using `dep` is easy as run:

    dep install

### Development and Testing dependencies

Start test server

    rake test:start_server

Run tests

    rake

Stop test server

    rake test:stop_server

## Instalation

As simple as

    $ gem install achetepe


## Getting started

`achetepe` makes an HTTP request to run in background using __Threads__ and when you get a response, it will execute a block (a.k.a _callback function_)


### GET

    Achetepe.get('https://github.com/emancu/achetepe') do |response|
      puts response
    end

    # => #<Thread:0x007fd2b413b530 sleep>
    # => #<Net::HTTPOK:0x007fd2b5959f68>

### POST

    Achetepe.post('http://www.example.com/search.cgi', q: 'ruby') do |response|
      puts response
    end

    # => #<Thread:0x007fc8c605ac80 sleep>
    # => #<Net::HTTPBadGateway:0x007fc8c4bc2ca0>

### PUT

Coming soon..
