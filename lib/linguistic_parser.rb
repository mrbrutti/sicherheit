### Example from olibini paipr
#$bigger_grammar = { 
#  :sentence => [[:noun_phrase, :verb_phrase]],
#  :noun_phrase => [[:Article, :'Adj*', :Noun, :'PP*'], [:Name], [:Pronoun]],
#  :verb_phrase => [[:Verb, :noun_phrase, :'PP*']],
#  :'PP*' => [[], [:PP, :'PP*']],
#  :'Adj*' => [[], [:Adj, :'Adj*']],
#  :PP => [[:Prep, :noun_phrase]],
#  :Prep => %w(to in by with on),
#  :Adj => %w(big little blue green adiabatic),
#  :Article => %w(the a),
#  :Name => %w(Pat Kim Lee Terry Robin),
#  :Noun => %w(man ball woman table),
#  :Verb => %w(hit took saw liked),
#  :Pronoun => %w(he she it these those that)}
#  

GRAMMAR = {
  :sentence => %w{,}
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