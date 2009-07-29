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
        begin
          @device.write "[#{Time.now.gmtime}][#{level||self.level}]--#{clean(msg)}\n"
        rescue
          Raise "Something went Wrong writing to file"
        end
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
      msg.match(/\n|\r/) != nil ? msg.strip!  : msg
    end

    def close
     @device.close if @open
    end
  end
end
