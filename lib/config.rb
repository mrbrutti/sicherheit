require 'sicherheit/logger'
require 'config/connections'
require 'config/exec'
require 'config/servers'
require 'config/Variables'

module Sicherheit
	class Config
		def initialize(options={})
			@logger = Logger.new options[:level] || {level => "INFO"}
		end
		include Connections, Variables
	end
end

