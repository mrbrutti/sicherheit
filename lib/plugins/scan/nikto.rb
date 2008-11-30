require 'sicherheit/logger'
require 'sicherheit/base'

module Sicherheit
  class Plugins
    module Scan
      module Nikto
        def nikto(options, &block)
          if options.is_a?(Hash)
            r = run("nikto #{parse_opt(options)}")
          elsif options.is_a?(String)
            r = run("nikto #{options}")
          end 
          yield(r) if block_given?
        end
        
        def parse_opt(options={})
          cli_options
          options.each_pair do |key,val|
            case key
              when :C || :Cgidirs   
                # scan these CGI dirs: 'none', 'all', or values like "/cgi/ /cgi-a/"
                cli_options << " -Cgidirs #{val}"
              when :dbcheck    
                # check database and other key files for syntax errors 
                cli_options << " -dbcheck"
              when :e || :evasion
                # ids evasion technique
                if (val == 1 || val == 2 || val == 3 || val == 4 || 
                    val == 5 || val == 6 || val == 7 || val == 8)
                  cli_options << " -evasion #{val}"
                else
                  raise ArgumentError, "#{key.to_str}: Invalid value should be 1,2,3,4,5,6,7 or 8"
                end
              when :F || :Format 
                # save file (-o) format
                if (val == "csv" || val == "htm" || val == "xml" || val == "txt" )
                  cli_options << " -Format #{val}"
                else
                  raise ArgumentError, "#{key.to_str}: Invalid value should be csv, htm, txt or xml"
                end
              when :h || :host
                # target host
                cli_options << " -host #{val}"
              when :H || :Help       
                # Extended help information
                cli_options << " -Help"
              when :i || :id
                # host authentication to use, format is userid:password
                cli_options << " -id #{val}"
              when :m || :mutate
                # Guess additional file names
                if (val == 1 || val == 2 || val == 3 || val == 4 ) 
                  cli_options << " -mutate #{val}"
                else
                  raise ArgumentError, "#{key.to_str}: Invalid value should be 1,2,3 or 4"
                end
              when :o || :output
                # write output to this file
                cli_options << " -output #{val}"
              when :p || :port
                # port to use (default 80)
                cli_options << " -port #{val}"
              when :D || :Display
                # turn on/off display outputs
                if (val == 1 || val == 2 || val == 3 || 
                    val == 4 || val == A || val == D ) 
                    cli_options << " -Display #{val}"
                else
                  raise ArgumentError, "#{key.to_str}: Invalid value should be 1,2,3,4,A or D"
                end
              when :s || :ssl
                # force ssl mode on port
                cli_options << " -ssl"
              when :S || :Single
                # Single request mode
                cli_options << " -Sigle #{val}"
              when :t || :timeout
                # timeout (default 2 seconds)
                cli_options << " -timeout #{val}"
              when :T || :Tuning
                # scan tuning
                if (val == 1 || val == 2 || val == 3 || val == 4 || val == 5 || val == 6 || 
                    val == 7 || val == 8 || val == 9 || val == 0 || val == "a" || val == "b" ||
                    val == "g" || val == "x")
                  cli_options << " -Tuning #{val}"
                else
                  raise ArgumentError, 
                        "#{key.to_str}: Invalid value should be 1,2,3,4,5,6,7,8,9,0,a,b,g or x"
                end
              when :update
                # update databases and plugins from cirt.net (cannot be abbreviated)
                cli_options << " -update"
              when :useproxy
                # Use the HTTP proxy defined in the config.txt file.
                cli_options << " -useproxy" 
              when :V || :Version
                # print plugin and database versions
                cli_options << " -version"
              when :v || :vhost+
                # virtual host (for Host header)
                cli_options << " -vhost"
              else
                raise ArgumentError, "Invalid option => #{key.to_str}"
            end
            cli_options
          end
        end
      end
    end
  end
end
