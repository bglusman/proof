require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/clean'
require 'spec/rake/spectask'

CLEAN.include('pkg')
CLOBBER.include('pkg', 'tmp')

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.spec']
end
