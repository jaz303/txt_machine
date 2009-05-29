require 'fileutils'

task :txt_machine do
  require 'txt_machine'
end

task :test => :txt_machine do
  require 'test/unit'
  Dir["test/**/*.rb"].each { |f| require f }
end