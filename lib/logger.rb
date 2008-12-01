module Sicherheit
  class Logger
    def initialize(options={})
      @level = options[:level] ||  "INFO"
      output = options[:output] || $stderr

      if output.respond_to?(:puts)
        @device = output
      else
        @device = File.new(output, "a")
        @device.sync = true
        @open = true
      end
    end
    attr_accessor :level

    def log(level, msg)
      if self.level || level
        @device.write "[#{Time.now.gmtime}][#{level||self.level}]--#{msg}\n"
      else
        raise ArgumentError, "Not global or local loggin level provided"
      end
    end

    %w(debug info trace).each do |log_level| 
      class_eval "
        def #{log_level}(message)
          log('#{log_level.upcase}', message)
        end"
    end
    
    def clean(msg)
      msg.strip! if msg.match(/\n|\r/) != nil
    end
    
    def close
     @device.close if @open
    end
  end
end
