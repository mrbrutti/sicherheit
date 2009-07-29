module Sicherheit
  module Config
    class Server
      def initialize(options={:name => "localhost", :address => "127.0.0.1", 
                              :port => 22, :apps => {:nmap => "/usr/bin/nmap",
                                                    :nessus => "/opt/local/bin/nessus"}})
        if options.is_a?(String)
          parse(options)
        elsif options.is_a?(Hash)
          self.name = options[:name]
          self.address = options[:address]
          self.port = options[:port]
          self.apps = options[:apps]
        end
      end
      attr_accessor :name, :address, :port, :apps
      
      def parse(file_name)
        #TODO PARSE DEFINITIION FILE and RETURN OBJECT
      end
    end
  end
end
