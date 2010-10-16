require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/clean'
require 'spec/rake/spectask'
require 'irb'

CLEAN.include('pkg')
CLOBBER.include('tmp')

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.spec']
end

desc "Start a console"
task :console do
  exec 'irb -I lib -r proof'
end
