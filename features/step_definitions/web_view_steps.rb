Given /^I have a browser$/ do
  # no-op
end

Then /^I should see a "([^"]*)" button$/ do |button_text|
  find("//input[@value='#{button_text}']").should_not be_nil
end

Then /^I should see a table with (\d+) rows and (\d+) columns$/ do |rows, cols|
  tables = all("//table")
  tables.should_not be_empty
  tables.each do |table|
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
  page.find("//div[@id='#{x}_#{y}']").click
end

Then /^the cells at "([^"]*)" should be alive$/ do |live_cells|
  @live_points = live_cells.split(' & ').map{|pair| pair.gsub(',', '_')}.flatten
  @live_points.each do |point| 
    page.find(:xpath, "//input[@name='#{point}']").value.should == 'true'
  end
end

Then /^all other cells should be dead$/ do
  page.all("//input[@type='hidden']").each do |field|
    coordinates = field[:name]
    next if ['rows', 'columns'].include? coordinates
    field.value.should == '' unless @live_points.include?(coordinates)
  end
end

Given /^I have seeded a (\d+) by (\d+) grid with live cells at the following locations:$/ do |rows, cols, table|
  Given "I have setup a grid with #{rows} rows and #{cols} columns"
  table.rows.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      When "I click on the cell at #{row_index},#{column_index}" if column == "X"
    end
  end
end

Then /^I should see the following live and dead cells on the grid:$/ do |table|
  table.rows.each_with_index do |row, row_index|
    row.each_with_index do |column, column_index|
      panel_class = column == 'X' ? 'panel flip' : 'panel'
      page.find("//div[@id='#{row_index}_#{column_index}']")['class'].should == panel_class
    end
  end
end

When /^I wait (\d+) seconds$/ do |time_in_secs|
  sleep time_in_secs.to_i
end