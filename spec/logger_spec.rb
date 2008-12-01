require 'rubygems'
require 'spec'
 

require '../lib/logger.rb'
include Sicherheit

describe Logger do

  before(:each) do
    @Log = Logger.new
    @Log2 = Logger.new :level=>"DEBUG",:output => "/tmp/spec_test_log.txt"
  end
  
  it "should start with INFO and will change it to DEBUG" do
    @Log.level.should == "INFO"
    @Log.level = "DEBUG"
    @Log.level.should == "DEBUG"
  end
  
  it "should start with DEBUG and create file" do
    @Log2.level.should == "DEBUG"
    File.exists?("/tmp/spec_test_log.txt").should == true
  end
  
  after(:each) do
   system ("rm /tmp/spec_test_log.txt")
  end
end

