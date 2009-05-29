Gem::Specification.new do |s|
  s.name = "txt_machine"
  s.version = "0.0.1"
  
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new(">= 0")
  end
  
  s.authors = ["Jason Frame"]
  s.date = "2009-05-29"
  s.description = "Like ActionMailer, but for SMS"
  s.email = "jason@onehackoranother.com"
  
  s.files = %w(
    README.markdown
    txt_machine.rb
    lib/txt_machine.rb
    lib/txt_machine/message.rb
    lib/txt_machine/gateways/discard.rb
    lib/txt_machine/gateways/itagg.rb
    lib/txt_machine/gateways/skeleton.rb
    lib/txt_machine/gateways/test.rb
  )
  
  s.has_rdoc = false
  s.homepage = "http://github.com/jaz303/txt_machine"
  s.require_paths = ["lib"]
  # s.rubyforge_project = ""
  s.summary = s.description
  
end