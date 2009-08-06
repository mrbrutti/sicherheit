module Sicherheit
  class Task
    attr_accessor :command, :type, :on, :args, :targets, :runon, :dependencies
    
    def initialize(option={}, &block)
      if option.is_a?(Symbol) || option.is_a?(String)
        self.command = option
        block_given? ? block.call(self) : raise(ArgumentError, "Need a Block")  
        self.run
      elsif option.is_a?(Hash)
        self.command = option[:command]
        self.type = option[:type]
        self.on = option[:on]
        self.args = option[args]
        self.targets = option[:targets]
        self.runon = option[:runon]
        self.dependencies = option[:dependencies]
      else
        raise ArgumentError, "Need a Hash or a Block"
      end 
    end
    
    def run
      #TODO: run command on server on $server
      puts "This is a test"
    end
  
    def results
      #Return results.
    end
  end
end



Sicherheit::Task.new "nmap" do |t|
  t.args = "-sS -P0 -p1-1024"
  t.type = :async 
  t.on = :localhost
  t.targets = ["192.168.1.1", "192.168.1.2"]
  t.runon = :Sateada
end

a = Sicherheit::Task.new :command => "nmap",
                         :args => "-sS -P0 -p1-1024",
                         :type => :async,
                         :on => :localhost,
                         :targets => ["192.168.1.1", "192.168.1.2"],
                         :runon => :Sateada

a.run
