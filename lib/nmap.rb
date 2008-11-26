require 'sicherheit/logger'
require 'sicherheit/base'

module Sicherheit
  class Scan
    module Nmap
      def nmap(options, &block)
        
        if options.is_a?(Hash)
          r = run("nmap #{parse_opt(options)}")
        elsif options.is_a?(String)
          r = run("nmap #{options}")
        end
  
        yield if block_given?
      end
      
      def parse_gnmap()
      end
      #Short version that actually does not check for errors
      def parse_opt2(options={})  
        options.each_pair do |key,val|
          cli_options << " -#{key.to_str} " 
          cli_options << val if !val.nil? && val != true
        end
      end
      #Detailed version with case for each command option. 
      def parse_opt(options={})
        cli_options
        options.each_pair do |key,val|
        case key
          when :sL
            cli_options << " -sL #{val}"
          when :sP
          when :PN
          when :PS
          when :PA 
          when :PU
          when :PE
          when :PP
          when :PM
          when :PO
          when :PR 
          when :traceroute
           cli_options << " --traceroute"
          when :reason
          when :n
          when :R 
          when :systemdns
          when :dnsservers
          when :sT
          when :sU
          when :sN
          when :sF
          when :sX
          when :sN
          when :sF
          when :sX
          when :sA
          when :sW
          when :sM
          when :scanflags
          when :sI
          when :sO
          when :b
          when :portrange || :ports || :p
            cli_options << " -p#{val}"
          when :fast || :f
            cli_options << " -f"
          when :r
          when :sV
          when :allports
          when :version_intensity
          when :version_light
          when :version_all
          when :version_trace
          when :sR
          when :O || :osdetection
          when :osscan_light
          when :oscan_guess || :fuzzy
          when :max_os_tries
          when :script
          when :script_updatedb
          when :sC
          when :script_args
          when :script_trace
          when :min_hostgroup
          when :max_hostgroup
          when :min_parallelism
          when :max_parallelism
          when :min_rtt_timeout
          when :max_rtt_timeout
          when :initial_rtt_timeout
          when :max_retries
          when :host_timeout
          when :scan_delay
          when :min_rate
          when :defeat_rst_rate_limite
          when :T
            if val = "paranoid" # || ...
              cli_options << " -T #{val}"
            end
          when :T0 || :T1 || :T2 || :T3 || :T4 || :T5
            cli_options << "-#{key.to_str}"
          # we should take this out and do a when for /:T[ 0-5]/
          when :f || :fragment_packets
          when :mtu
          when :D 
          when :S || :spoof_source
          when :e 
          when :source_port || :g
          when :data_length
          when :ip_options
          when :ttl
          when :randomize_hosts
          when :spoof_mac
          when :badsum
          when :oN
          when :oX
          when :oS
          when :oG
          when :oA
          when :v || :verbose_level
          when :d || :debug_level
          when :packet_trace
          when :open
          when :iflist
          when :log_errors
          when :append_output
          when :resume
          when :stylesheet
          when :no_stylesheet
          when :webxml
          when :6
          when :A
          when :datadir
          when :servicedb
          when :versiondb
          when :send_eth
          when :send_ip
          when :privileged
          when :unprivileged
          when :release_memory
          when :interactive
          when :V || :version 
          when :h || :help
          else
            raise ArgumentError, "Nmap Options not found"
        end
      end
    end
  end
end
