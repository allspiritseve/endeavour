# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'endeavour/version'

Gem::Specification.new do |gem|
  gem.name = 'endeavour'
  gem.version = Endeavour::VERSION
  gem.authors = ['Cory Kaufman-Schofield']
  gem.email = ['cory@corykaufman.com']
  gem.summary = 'Try, but better.'
  gem.homepage = 'https://github.com/allspiritseve/endeavour'
  gem.license = 'MIT'
  gem.files = `git ls-files -z`.split("\x0").reject { |f| f =~ /^test/ }
  gem.require_paths = ['lib']
  gem.add_development_dependency 'minitest-reporters'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'byebug'
  gem.add_development_dependency 'minitest'
  gem.add_development_dependency 'rake'
end
