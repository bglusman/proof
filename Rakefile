require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/clean'
require 'rake/rdoctask'
require 'cucumber/rake/task'
require 'spec/rake/spectask'

CLEAN.include('pkg')
CLOBBER.include('tmp')

Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = ['--format', 'pretty']
end

Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

Spec::Rake::SpecTask.new do |t|
  t.spec_opts = ['--options', 'spec/spec.opts']
end

desc "Start a console"
task :console do
  exec 'irb -I lib -r proof'
end

task :default => ['spec']
