# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adminos/auth/version'

Gem::Specification.new do |spec|
  spec.name          = "adminos-auth"
  spec.version       = Adminos::Auth::VERSION
  spec.authors       = ["Dmitry Silaev"]
  spec.email         = ["dmsilaev@yandex.ru"]
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_dependency "haml-rails"
  spec.add_dependency "state_machine"
  spec.add_dependency 'bcrypt-ruby', '~> 3.1.5'
  spec.add_dependency 'validates'
  spec.add_development_dependency "rake", "~> 10.0"
end
