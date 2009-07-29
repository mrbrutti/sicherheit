module Sicherheit
  module Config
    class Assessment
      def initialize(options={:name => "Assessment", :targets => ["127.0.0.1", "localhost"], 
                              :type => 0, :tasks => [Tasks.new,Tasks.new]})
        
        if options.is_a?(String)
          parse(options)
        elsif options.is_a?(Hash)
          self.name = options[:name]
          self.targets = options[:address]
          self.type = options[:type]
          self.tasks = options[:tasks]
        end
      end
      attr_reader :name,:targets,:type,:tasks
      
      def parse(file_name)
        #TO DO : Find the best way to parse the file. Maybe using a YML. json o xml. 
        x = File.open(file_name, "r")
      end
    end
  end
end