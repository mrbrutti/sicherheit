module Sicherheit
  class Assessment
    def initialize(options={:name => "Assessment", :targets => ["127.0.0.1", "localhost"], 
                            :type => 0, :tasks => [Tasks.new,Tasks.new], :servers =>[]})
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
      self.targets = hsh[:targets]
      self.type = hsh[:type]
      self.tasks = hsh[:tasks]
      self.servers = hsh[:servers] || Sicherheit::Servers
      
      block.call(self) if block_given?
    end
    attr_reader :name,:targets,:type,:tasks
    
  end
end