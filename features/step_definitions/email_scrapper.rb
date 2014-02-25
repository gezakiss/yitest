

Given /I am on the (.*) page/ do |page|
  visit "/" + page
  @emails = Email.count
end
Given /fill (.*) field with "(.*)"/ do |field, value|
    fill_in (field), :with => value
end
When /I click on "(.*)"/ do |link_or_button|
  click_on link_or_button
end
When /wait 1 sec/ do
  sleep(1)
end

When /I select (.*) field/ do |field|
  find("." + field).click
end
When /I leave to the home page/ do |field|
  visit "/"
end
Then /"(.*)" should not be on the grablist/ do |email|
  Email.exists?(:email => email).should == false
end
Then /"(.*)" should be on the grablist/ do |email|
  Email.exists?(:email => email).should == true
end
Then /grablist should have ([0-9]+) new items/ do |q|
  Email.count.should == @emails + q.to_i
end