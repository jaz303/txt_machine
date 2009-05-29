%w(
  txt_machine
  txt_machine/message
  txt_machine/gateways/skeleton
  txt_machine/gateways/discard
  txt_machine/gateways/test
  txt_machine/gateways/itagg
).each do |file|
  require File.dirname(__FILE__) + '/lib/' + file
end