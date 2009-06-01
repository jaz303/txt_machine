# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{txt_machine}
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jason Frame"]
  s.date = %q{2009-06-01}
  s.description = %q{Like ActionMailer, but for SMS}
  s.email = %q{jason@onehackoranother.com}
  s.extra_rdoc_files = [
    "README.markdown"
  ]
  s.files = [
    "README.markdown",
     "Rakefile",
     "VERSION",
     "lib/txt_machine.rb",
     "lib/txt_machine/base.rb",
     "lib/txt_machine/gateways/discard.rb",
     "lib/txt_machine/gateways/itagg.rb",
     "lib/txt_machine/gateways/skeleton.rb",
     "lib/txt_machine/gateways/test.rb",
     "lib/txt_machine/message.rb",
     "test/message_test.rb",
     "test/test_gateway_test.rb",
     "test/txt_machine_test.rb",
     "txt_machine.gemspec"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jaz303/txt_machine}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Like ActionMailer, but for SMS}
  s.test_files = [
    "test/message_test.rb",
     "test/test_gateway_test.rb",
     "test/txt_machine_test.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
