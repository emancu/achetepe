Gem::Specification.new do |s|
  s.name = 'achetepe'
  s.version = '0.0.2'
  s.date = Time.now.strftime('%Y-%m-%d')
  s.summary = 'Asynchronous HTTP Requests using Threads'
  s.description = '`achetepe` is a small and simple library to execute a block of code after an asynchronous HTTP request.'
  s.authors = ['Emiliano Mancuso']
  s.email = ['emiliano.mancuso@gmail.com']
  s.homepage = 'http://github.com/emancu/achetepe'
  s.license = 'MIT'

  s.files = Dir[
    'README.md',
    'rakefile',
    'lib/**/*.rb',
    '*.gemspec'
  ]
  s.test_files = Dir['test/*.*']

  s.add_development_dependency 'protest'
  s.add_development_dependency 'cuba'
end


