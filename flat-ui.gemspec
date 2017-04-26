# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "flat-ui/version"

Gem::Specification.new do |gem|
  gem.name          = "flat-ui"
  gem.version       = FlatUI::Rails::VERSION
  gem.authors       = ["Niels van der Zanden"]
  gem.email         = ["niels@pharynx.nl"]
  gem.description   = %q{Flat-UI for Rails Assets}
  gem.summary       = %q{Flat-UI for Rails Assets}
  gem.homepage      = "https://github.com/scarhand/flat-ui"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end