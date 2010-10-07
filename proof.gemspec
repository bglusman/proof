# -*- encoding: utf-8 -*-
require File.expand_path("../lib/proof/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "proof"
  s.version     = Proof::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/proof"
  s.summary     = "Readability analyzer"
  s.description = "A readability analysis utility"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "proof"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
