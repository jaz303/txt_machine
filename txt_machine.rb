%w(
  txt_machine
  txt_machine/message
  txt_machine/adapters/skeleton_adapter
  txt_machine/adapters/discard_adapter
  txt_machine/adapters/test_adapter
  txt_machine/adapters/itagg_adapter
).each do |file|
  require File.dirname(__FILE__) + '/lib/' + file
end