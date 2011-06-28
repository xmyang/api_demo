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
    response.should have_selector("input[start_address='map[start_address]'][type='text']")
  end
end
