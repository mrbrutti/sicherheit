GRAMMAR = {
  :apps => %w{nmap nikto nessus}
  :actions => %w{run dump find}
  :nouns => %w{results ip targets}
  :pipes => %w{to from }
  :descriptors => %w{alive dead all full common open close}
}
module Sicherheit
  class LinguisticParser
    def initialize(*args)
      self.text = String.new
      args.each do |arg| 
        if arg.is_a?(File)
          self.text << a.readlines
        elsif arg.is_a?(String)
          self.text << a.readlines
      end
    end
    
    def parse
      self.text.each_line do |line|
        case line
        when /GRAMMAR[:apps]/
        when //
        else
        end
      end
    end
  end
end


### EXAMPLE ###
# 
#nmap:
#  run full on targets 1, 2, 3, 4
#  take alive results save to file xx.list
#nessus:
#  run with default configuration on targets from file xx.list
#nikto:
#  run full on targets from file xx.list
#
#results:
#  take all results and email me the results.