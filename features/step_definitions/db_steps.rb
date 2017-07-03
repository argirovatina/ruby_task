Given(/^I connect to DB with my "([^"]*)" and "([^"]*)"$/) do |login, password|
  @client = TinyTds::Client.new username: login, password: password, host: 'localhost', :port => 1433
  puts 'Connected to DB' if @client.active?
  @client.close
end