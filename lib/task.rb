module Sicherheit
  class Task
    attr_accessor :command, :type, :on, :args, :targets
    
    def initialize(command, args, type = :async, on = :localhost, &blocks)
      if (option.is_a?(Symbol) || option.is_a?(String))
        block_given? ? block.call : raise ArgumentError, "Need a Block"  
      else
        self.command = option[:command]
        self.type = option[:type]
        self.on = option[:on]
        self.args = option[args]
        self.targets = option[:targets]
        self.runon = hsh[:runon]
        self.dependencies = hsh[:dependencies]
      else
        raise ArgumentError, "Need a Hash or a Block"
      end 
    end
    
    def run
      #TODO: run command on server on $server
    end
  
    def results
      #Return results.
    end
    
  end
end



Sicherheit::Tasks.new "nmap"  