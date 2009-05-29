require 'uri'
require 'net/http'
require 'net/https'
require 'cgi'

class TxtMachine
  module Adapters
    class ItaggAdapter < SkeletonAdapter
      
      ENDPOINT          = 'https://secure.itagg.com/smsg/sms.mes'
      ENDURI            = URI.parse(ENDPOINT)

      ROUTE_BUDGET      = 4
      ROUTE_NATIONAL_UK = 7
      ROUTE_GLOBAL      = 8
      
      DEFAULT_CONFIG    = { :route => ROUTE_NATIONAL_UK }
      
      def send(msg)
        
        path  = ENDURI.path
        path += '?' + message_to_hash(msg).map { |k,v| "#{CGI.escape(k.to_s)}=#{CGI.escape(v.to_s)}"}.join('&')
      
        begin
          req = Net::HTTP::Post.new(path)
          http = Net::HTTP.new(ENDURI.host, ENDURI.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
          res = http.start { |http| http.request(req) }
        rescue => e
          
        end
        
        case res
        when Net::HTTPSuccess
          # OK
        else
          # error
        end
      
      end
    
    private
    
      def default_config
        DEFAULT_CONFIG
      end
      
      def message_to_hash(msg)
        { 'usr'     => @config[:username],
          'pwd'     => @config[:password],
          'txt'     => msg.body,
          'to'      => msg.recipients.join(','),
          'type'    => 'text',
          'route'   => @config[:route],
          'from'    => msg.originator || @config[:originator] }
      end
      
    end
  end
end