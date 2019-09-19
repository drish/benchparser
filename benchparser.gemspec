require_relative "lib/benchparser/version"

Gem::Specification.new do |spec|
  spec.name          = "benchparser"
  spec.version       = Benchparser::VERSION
  spec.summary       = "Benchparser - benchmark output parser"
  spec.homepage      = "https://github.com/drish/benchparser"
  spec.license       = "MIT"

  spec.author        = "Derich Pacheco"
  spec.email         = "carlosderich@gmail.com"

  spec.files         = Dir["*.{md,txt}", "{lib}/**/*"]
  spec.require_path  = "lib"

  spec.required_ruby_version = ">= 2.3"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-byebug"
end
