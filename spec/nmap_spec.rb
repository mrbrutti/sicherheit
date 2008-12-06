require 'rubygems'
require 'spec'
 
require 'lib/plugins/scan/nmap.rb'
include Sicherheit::Plugins::Scan

describe Nmap do

  before(:each) do
    #nmap_1 = nmap :sL => true, :excludefiles => "test.txt"
  end
  
  it "should create the right parsed output" do
    parse_opt(:sL => true, :excludefiles => "test.txt").should == " -sL --excludefiles test.txt"
    parse_opt(:UDP_Scan => true).should == " -sT"
  end
  
end