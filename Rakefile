require 'rubygems'
require 'rake/testtask'
require 'spec'
require 'spec/rake/spectask'

desc "Run specs"
Spec::Rake::SpecTask.new do |t|
  t.spec_files = FileList['examples/**/rspec/test.rb']
  t.spec_opts = %w(-fs --color)
end

desc "Run the mocha examples"
Rake::TestTask.new(:mocha) do |t|
  t.test_files = FileList['examples/**/mocha/test.rb']
  t.verbose = true
end

desc "Run the rr examples"
Rake::TestTask.new(:rr) do |t|
  t.test_files = FileList['examples/**/rr/test.rb']
  t.verbose = true
end

task :default => [:mocha, :rr, :spec]
