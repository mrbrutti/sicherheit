module Sicherheit
  module Config
  class Task
      def initialize(command, type, args, on=nil, &blocks)
        self.command = command
        self.type = type
        self.on = on || 0
        self.args = args
        block.call if block_given?
      end
    
      def run
        #TODO: run command on server on $server
      end
    
      def results
      end
      
    end
  end
end