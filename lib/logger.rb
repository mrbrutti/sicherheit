module Sicherheit
  class Logger
    def initialize(options={})
      @level = options[:level]
      output = options[:output] || $stderr

      if outpuit.response_to?(:puts)
        @device = output
      else
        @device = File.new(ouput.to_str, "a")
        @open = true
      end
    end

    attr_accessor :level
    
    def log(level=nil,msg)
      if !self.level.nil?
        msg.strip!("\n").strip!("\r") # Avoid new lines
        device.puts "[#{Time.now}][#{level||self.level}]--#{msgs}\n"
      else
        raise "Not global or instanse level provided"
      end
    end

    %w(debug info trace).each do class_eval "
      def #{log_level}(message)
        log(#{log_level.upcase}, message, line_prefix)
      end"
    end

    def close
     @device.close if @open
    end
  end
end
