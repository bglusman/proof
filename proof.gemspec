# -*- encoding: utf-8 -*-
require File.expand_path("../lib/proof/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "proof"
  s.version     = Proof::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Stuart Ellis']
  s.email       = ['stuart@stuartellis.eu']
  s.homepage    = "http://github.com/stuartellis/proof"
  s.summary     = "Readability analysis reporting"
  s.description = "Proof generates readability analysis reports"

  s.required_ruby_version = '>= 1.9.2'
  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "proof"

  s.add_dependency "lingua", ">= 0.6.2"
  
  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "aruba", "~> 0.2.3"
  s.add_development_dependency "cucumber", "~> 0.9.3"
  s.add_development_dependency "rspec", "~> 1.3.1"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end