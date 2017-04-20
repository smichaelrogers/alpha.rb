# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name              = 'alpha_rb'
  gem.version           = '0.1.0'
  gem.authors           = ['Scott M. Rogers']
  gem.email             = ['mrogerssn@gmail.com']
  gem.homepage          = 'https://github.com/smichaelrogers/alpha.rb'
  gem.description       = 'tiny chess engine'
  gem.summary           = 'tiny chess engine with a really simple API'
  gem.license           = 'MIT'
  gem.require_paths     = ['lib']
  gem.files             = `git ls-files`.split("\n")

  gem.metadata['allowed_push_host'] = 'https://rubygems.org' if gem.respond_to?(:metadata)
end
