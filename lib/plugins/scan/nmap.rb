module Sicherheit
  class Plugins
    module Scan
      module Nmap
        def nmap(options, &block)
        
          if options.is_a?(Hash)
            r = run("nmap #{parse_opt(options)}")
          elsif options.is_a?(String)
            r = run("nmap #{options}")
          end 
          yield(r) if block_given?
        end
      
        def parse_gnmap()
        end
        #Short version that actually does not check for unknown options.
        def parse_opt2(options={})  
          options.each_pair do |key,val|
            cli_options << " -#{key.to_str} " 
            cli_options << val if !val.nil?
          end
        end

        #Detailed version with case for each command option. 
        def parse_opt(options={})
          cli_options = String.new
          options.each_pair do |key,val|
            case key
              when :sL
                cli_options << " -sL"
              when :sP
                cli_options << " -sP"
              when :PN
                cli_options << " -PN"
              when :PS || :PA || :PU
                cli_options << " -#{key.to_str} #{val}"
              when :PE || :PP || :PM
                cli_options << " -#{key.to_str}"
              when :PO 
                cli_options << " -PO #{val}"
              when :PR 
              when :exclude 
                cli_options << " --exclude #{val}"
              when :excludefiles
                cli_options << " --excludefiles #{val}"
              when :traceroute
               cli_options << " --traceroute"
              when :reason
                cli_options << " --reason"
              when :n || :R 
                cli_options << " -#{key.to_str}"
              when :system_dns
                cli_options << " --system-dns"
              when :dns_servers
                cli_options << " --dns-servers #{val}"
              when :sS || :TCP_SYN
                cli_options << " -sS"
              when :sT || :Connect 
                cli_options << " -sT"
              when :sU || :UDP_Scan
                cli_options << " -sU"
              when :sN || :TCP_Null
                cli_options << " -sN"
              when :sF || :FIN
                cli_options << " -sF"
              when :sX || :Xmas
                cli_options << " -sX"
              when :sM || :Maimon
                cli_options << " -sM"
              when :sA || :ACK
              when :sW || :Window 
                cli_options << " -sW"
              when :scanflags
                cli_options << " --scanflags #{val}"
              when :sI || :Idle_Scan
                cli_options << " -sI #{val}"
              when :sO || :IP_Scan
              when :b || :FTP_bounce_scan
                cli_options << " -b #{val}"
              when :portrange || :ports || :p
                cli_options << " -p#{val}"
              when :fast || :F
                cli_options << " -F"
              when :top_ports
                cli_options << " --top-ports #{val}"
              when :port_ratio
                cli_options << " --port-ratio #{val}"
              when :r
                cli_options << " -r"
              when :sV
                cli_options << " -sV"
              when :allports
                cli_options << " --allports"
              when :version_intensity
                cli_options << " --version-intensity #{val}"
              when :version_light
                cli_options << " --version-light"
              when :version_all
                cli_options << " --version-all"
              when :version_trace
                cli_options << " --version-trace"
              when :sR
              when :O || :osdetection
                cli_options << " -O"
              when :osscan_limit
                cli_options << " --osscan-limit"
              when :oscan_guess || :fuzzy
                cli_options << " --fuzzy"
              when :max_os_tries
                cli_options << ""
              when :script 
                # I could take Files here and upload them directly or something ...
                cli_options << " --script="
              when :script_updatedb
              when :sC
                cli_options << " -sC"
              when :script_args
                cli_options << " --script-args=#{val}"
              when :script_trace
                cli_options << " --script-trace"
              when :min_hostgroup
                cli_options << "--min-hostgroup #{val}"
              when :max_hostgroup
                cli_options << "--max-hostgroup #{val}"
              when :min_parallelism
                cli_options << " --min-parallelism #{val}"
              when :max_parallelism
                cli_options << " --max-parallelism #{val}"
              when :min_rtt_timeout
                cli_options << " --min-rtt-timeout #{val}"
              when :max_rtt_timeout
                cli_options << " --max-rtt-timeout #{val}"            
              when :initial_rtt_timeout
                cli_options << " --initial-rtt-timeout #{val}" 
              when :max_retries
                cli_options << " --max-retries #{val}"
              when :host_timeout
                cli_options << " --host-timeout #{val}" 
              when :scan_delay
                cli_options << " --scan-delay #{val}"
              when :max_scan_delay
                cli_options << " --max-scan-delay #{val}"
              when :min_rate
                cli_options << " --min-rate #{val}"
              when :max_rate
                cli_options << " --max-rate #{val}"
              when :defeat_rst_rate_limite
              when :T
                if val = "paranoid" # || ...
                  cli_options << " -T #{val}"
                end
              when :T0 || :T1 || :T2 || :T3 || :T4 || :T5
                cli_options << "-#{key.to_str}"
              # we should take this out and do a when for /:T[ 0-5]/
              when :f || :fragment_packets
                cli_options << " -f"
              when :mtu
                cli_options << " --mtu #{val}"
              when :D 
                cli_options << " -D #{val}"
              when :S || :spoof_source
                cli_options << " -S #{val}"
              when :e
                cli_options << " -e #{val}"
              when :source_port || :g
                cli_options << " -g#{val}"
              when :data_length
                cli_options << " --data-lenght #{val}"
              when :ip_options
                cli_options << " --ip-options #{val}"
              when :ttl
                cli_options << " --ttl #{val}"
              when :randomize_hosts
                cli_options << " --randomize-hosts"
              when :spoof_mac
                cli_options << " --spoof-mac #{val}"
              when :badsum
                cli_options << " --badsum"
              when :oN
                cli_options << " --oN #{val}"
              when :oX
                cli_options << " --oX #{val}"
              when :oS
                cli_options << " --oS #{val}"
              when :oG
                cli_options << " --oG #{val}"
              when :oA
                cli_options << " --oA #{val}"
              when :v || :verbose_level
                cli_options << " -#{"v"*val}"
              when :d || :debug_level
                cli_options << " -d#{val}"
              when :packet_trace
                cli_options << " --packet-trace"
              when :open  
                cli_options << " --open"
              when :iflist
                cli_options << " --iflist"
              when :log_errors
                cli_options << " --log-errors"
              when :append_output
                cli_options << " --append-output"
              when :resume
                cli_options << " --resume #{val}"
              when :stylesheet
                cli_options << " --stylesheet #{val}"
              when :no_stylesheet
                cli_options << " --no-stylesheet"
              when :webxml
                cli_options << " --webxml"
              when 6.to_syn || :ipv6
                cli_options << " -6"
              when :A 
                cli_options << " -A"
              when :datadir 
                cli_options << " --datadir #{val}"
              when :servicedb
              when :versiondb
              when :send_eth
                cli_options << " --send-eth"
              when :send_ip
                cli_options << " --send-ip"
              when :privileged
                cli_options << " --privileged"
              when :unprivileged
                cli_options << " --unprivileged"
              when :release_memory
              when :interactive
              # just for completeness ... :D 
              when :V || :version 
                cli_options << " -v"
              when :h || :help 
                cli_options << " -h"
              else
                raise ArgumentError, "Nmap Options not found"
            end
          end
        end
      end
    end
  end
end
