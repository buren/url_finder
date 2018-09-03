# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'url_finder/version'

Gem::Specification.new do |spec|
  spec.name          = 'url_finder'
  spec.version       = UrlFinder::VERSION
  spec.authors       = ['Jacob Burenstam']
  spec.email         = ['burenstam@gmail.com']

  spec.summary       = 'Find URLs in common file formats (Markdown, HTML, string).'
  spec.description   = 'Find URLs in common file formats (Markdown, HTML, string) with ease - Ruby and CLI.'
  spec.homepage      = 'https://github.com/buren/url_finder'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # optional dependencies
  spec.add_development_dependency 'kramdown', '~> 1.17'
  spec.add_development_dependency 'nokogiri', '~> 1.8'

  # dev dependencies
  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'yard'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
