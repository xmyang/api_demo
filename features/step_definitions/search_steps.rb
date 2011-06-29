Given /^I navigate to the demo page$/ do
  visit root_path
end

When /^I enter "([^"]*)" and "([^"]*)"$/ do |start_address, end_address|
  fill_in "Start Address", :with => start_address
  fill_in "End Address", :with => end_address
end

When /^I click the button$/ do
  click_button "Show me the way!"
end

Then /^the detailed start and end addresses should be displayed$/ do
  page.should have_selector("span#start_address",
                            :content => "西安钟楼, East St, Beilinqu, Xi'an, Shaanxi, China")
  page.should have_selector("span#end_address",
                            :content => "China Shaanxi Xi'an Beilinqu鼓楼")
end

Then /^the distance between two addresses should be displayed$/ do
  page.should have_selector("p#distance", :content => "0.6 km")
end

Then /^the time spent by driving should be displayed$/ do
  page.should have_selector("p#duration", :content => "1 min")
end

Then /^the drive instructions should be displayed$/ do
  page.should have_selector("div#steps>ol>li#instruction")
end

Then /^an appriprate message should be displayed$/ do
  page.should have_content("Invalid addresses, please try again.")
end
