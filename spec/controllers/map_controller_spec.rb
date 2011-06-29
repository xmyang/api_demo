require 'spec_helper'

describe MapController do
  render_views

  it "should be successful" do
    get :search
    response.should be_success
  end

  it "should have the right title" do
    get :search
    response.should have_selector("title", :content => "API Demo | Show me the way!")
  end

  it "should have a start address field" do
    get :search
    response.should have_selector("input[name='map[start_address]'][type='text']")
  end
  
  it "should have an end address field" do
    get :search
    response.should have_selector("input[name='map[end_address]'][type='text']")
  end
  
  it "should have a submit button" do
    get :search
    response.should have_selector("input[name='commit'][type='submit']")
  end
end
