Given /^I have a browser$/ do
  # no-op
end

When /^I visit "([^"]*)"$/ do |url|
  get url
end

Then /^I should see "([^"]*)"$/ do |text|
  response_body.should contain(text)
end

Then /^I should see a field labeled "([^"]*)" with the value "([^"]*)"$/ do |label, value|
  field_labeled(label).value.should == value
end

Then /^I should see a "([^"]*)" button$/ do |button_text|
  field_by_xpath("//input[@value='#{button_text}']").should_not be_nil
end

