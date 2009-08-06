module Sicherheit
  module Config
    class Server
      attr_accessor :name, :address, :port, :apps, :username, :password, :publickey
      def initialize(options={}, &block)
        if options.is_a?(String)
          require 'yaml'
          hsh = YAML.load_file options
        elsif options.is_a?(Hash)
          hsh = options
        end
        #initializate options
        # example :
        # {:name => "localhost", :username => "sdas", :publickey => true, 
        #  :address => "127.0.0.1", :port => 22, 
        #  :apps => {:nmap => "/usr/bin/nmap", 
        #            :nessus => "/opt/local/bin/nessus"}}
        self.name = hsh[:name]
        self.address = hsh[:address]
        self.port = hsh[:port]
        self.apps = hsh[:apps]
        self.username = hsh[:username]
        self.password = hsh[:password]
        self.publickey = hsh[:publickey] || false
        
        block.call(self) if block_given?
      end
    end
  end
end
