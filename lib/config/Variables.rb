module Sicherheit
  class Config
    module Variables
      def initialize(variables={})
        @variables.each do |x,y|
              
        end
      end
      attr_reader variables

      def set(variable, *args, &block)
        if !block_given? && args.empty? || block_given? && !args.empty?
          raise ArgumentError, "you need either a value or a block"
        end

        if args.length > 1
          raise ArgumentError, "wrong number of arguments (#{args.length} for 1)"
        end

        value = args.empty? ? block : args.first
        sym = variable.to_sym
        protect(sym) { @variables[sym] = value }
      end

      alias :[]= :set

      # Removes any trace of the given variable.
      def unset(variable)
        sym = variable.to_sym
        protect(sym) do
          @original_procs.delete(sym)
          @variables.delete(sym)
        end
      end

      def protect(variable)
        @variable_locks[variable.to_sym].synchronize { yield }
      end
      private :protect
      
    end
  end
end
