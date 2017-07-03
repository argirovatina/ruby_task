Given(/^As user I navigate to "([^"]*)"$/) do |url|
  visit(url)
end

And(/^I google word "([^"]*)"$/) do |word|
  @start_page = GoogleStartPage.new
  @search_page = SearchPage.new
  @start_page.google_word(@aim_word=word)
end

And(/^I select "([^"]*)" site$/) do |site|
  @search_page.go_to_wikipedia(@site=site)
end

Then(/^I assure I am on correct site$/) do
  search_result = @search_page.present_on_page?('wikipedia_icon', @site)
  raise "Cannot find #{@site} site" unless search_result
end

And(/^I check description of (.*) on the page$/) do |aim_word|
  search_result = @search_page.present_on_page?(aim_word.gsub(' ', '_'), @aim_word)
  raise "Cannot find #{@aim_word} on the page" unless search_result
end

And(/^I search for not "([^"]*)" or "([^"]*)" site/) do |latin, cyrillics|
  wikipedia_sites = [latin, cyrillics]
  @search_page.go_to_not_wikipedia(wikipedia_sites)
end

Then(/^I make screenshot of the page$/) do
  Capybara::Screenshot.screenshot_and_save_page
end