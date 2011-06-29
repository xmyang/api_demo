require 'spec_helper'
require 'http_get'

describe "Google Map Directions API" do

  before(:all) do
    domain = "maps.googleapis.com"
    path = "/maps/api/directions/json"
    params = {:origin => "钟楼，西安", :destination => "鼓楼，西安", :sensor => "false"}
    @json_result = http_get(domain, path, params)
    @result = ActiveSupport::JSON.decode(@json_result)
    puts @result.inspect
  end

  it "should have distance" do
    @result["routes"][0]["legs"][0].has_key?("distance").should be_true
  end
  
  it "should have duration" do
    @result["routes"][0]["legs"][0].has_key?("duration").should be_true
  end
    
  it "should have start address" do
    @result["routes"][0]["legs"][0].has_key?("start_address").should be_true
  end

  it "should have end address" do
    @result["routes"][0]["legs"][0].has_key?("end_address").should be_true    
  end
  
  it "should have steps" do 
    @result["routes"][0]["legs"][0].has_key?("steps").should be_true
  end

  it "should have html_instructions in steps" do 
    @result["routes"][0]["legs"][0]["steps"].first.has_key?("html_instructions").should be_true
  end
end
