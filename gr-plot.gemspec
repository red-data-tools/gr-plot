# frozen_string_literal: true

require_relative 'lib/gr/plot/version'

Gem::Specification.new do |spec|
  spec.name          = 'gr-plot'
  spec.version       = GR::Plot::VERSION
  spec.authors       = 'kojix2'
  spec.email         = '2xijok@gmail.com'

  spec.summary       = 'GR::Plot'
  spec.description   = 'GR\'s matlab-like high-level API.'
  spec.homepage      = 'https://github.com/red-data-tools/GR.rb'
  spec.license       = 'MIT'

  spec.files         = Dir['*.{md,txt}', '{lib}/**/*']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.5'

  spec.add_dependency 'ruby-gr'
end
