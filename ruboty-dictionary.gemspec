lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/dictionary/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-dictionary'
  spec.version       = Ruboty::Dictionary::VERSION
  spec.authors       = ['Katsuya HIDAKA']
  spec.email         = ['hidakatsuya@gmail.com']

  spec.summary       = 'Ruboty plug-in to look up a word in the custom dictionary.'
  spec.homepage      = 'http://github.com/hidakatsuya/ruboty-dictionary'
  spec.license       = 'MIT'

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'
  spec.add_runtime_dependency 'google_drive'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
