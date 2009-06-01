require 'fileutils'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "txt_machine"
    gemspec.summary = "Like ActionMailer, but for SMS"
    gemspec.email = "jason@onehackoranother.com"
    gemspec.homepage = "http://github.com/jaz303/txt_machine"
    gemspec.description = "Like ActionMailer, but for SMS"
    gemspec.authors = ["Jason Frame"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

task :txt_machine do
  require 'lib/txt_machine'
end

desc "Run the tests"
task :test => :txt_machine do
  require 'test/unit'
  Dir["test/**/*.rb"].each { |f| require f }
end