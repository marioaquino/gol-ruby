Given /^I have a browser$/ do
  # no-op
end

When /^I visit "([^"]*)"$/ do |url|
  visit url
end

Then /^I should see "([^"]*)"$/ do |text|
  page.has_content? text
end

Then /^I should see a field labeled "([^"]*)" with the value "([^"]*)"$/ do |label, value|
  field_labeled(label).value.should == value
end

Then /^I should see a "([^"]*)" button$/ do |button_text|
  find("//input[@value='#{button_text}']").should_not be_nil
end

When /^I set the field labeled "([^"]*)" with the value "([^"]*)"$/ do |labeled_field, value|
  fill_in labeled_field, :with => value
end

When /^I press the "([^"]*)" button$/ do |button_text|
  click_button button_text
end

Then /^I should be on the "([^\"]*)" page$/ do |path|
  current_path.should == path
end

Then /^I should see a table named "([^"]*)" with (\d+) rows and (\d+) columns$/ do |name, rows, cols|
  all("//table[@name = '#{name}']").each do |table|
    all_rows = table.all(".//tr")
    all_rows.size.should == rows.to_i
    all_rows.first.all(".//td").size.should == cols.to_i
  end
end

Given /^I have setup a grid with (\d+) rows and (\d+) columns$/ do |rows, cols|
  visit '/'
  fill_in 'Rows:', :with => rows
  fill_in 'Columns:', :with => cols
  click_button 'Create Grid'
end

When /^I click on the cell at (\d+),(\d+)$/ do |x, y|
  check "#{x}_#{y}"
end

Then /^the cells at "([^"]*)" should be alive$/ do |live_cells|
  @live_points = live_cells.split(' & ').map{|pair| pair.gsub(',', '_')}.flatten
  @live_points.each do |point| 
    page.find_field(point)[:checked].should be_true
  end
end

Then /^all other cells should be dead$/ do
  page.all("//input[@type='checkbox']").each do |field|
    coordinates = field[:id]
    field[:checked].should be_false unless @live_points.include?(coordinates)
  end
end

