require 'spec_helper'

describe "Map api demo" do
  describe "search" do
    it "should return correct instructions" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit root_path
      fill_in "start address", :with => "钟楼 西安"
      fill_in "End Address", :with => "鼓楼 西安"
      click_button
      response.should render_template('/')
      response.should have_selector("div#search_result")
      response.should have_selector("span#start_address")
      response.should have_selector("span#end_address")
      response.should have_selector("p#distance")
      response.should have_selector("p#duration")
      response.should have_selector("div#steps")
      response.should have_selector("div#steps>ol>li#instruction")
    end
  end
end
