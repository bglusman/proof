require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/clean'
require 'rake/rdoctask'
require 'spec/rake/spectask'

CLEAN.include('pkg')
CLOBBER.include('tmp')

desc "Build RDoc documentation"
Rake::RDocTask.new do |rd|
  rd.main = "README.rdoc"
  rd.rdoc_files.include("README.rdoc", "lib/**/*.rb")
end

desc "Run all specs"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/**/*.rb']
end

desc "Start a console"
task :console do
  exec 'irb -I lib -r proof'
end
