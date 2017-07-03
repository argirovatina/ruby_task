class SearchPage < GoogleStartPage

  element :wikipedia_icon, '#siteSub'
  element :aim_word, '#firstHeading'
  element :another_aim_word, '.avia-caption-title>strong'

  def go_to_wikipedia(result)
    find(:xpath, "//h3/a[contains(text(), '#{result}')]").click
  end

  def go_to_not_wikipedia(result)
    find("[class='med _wI']")             # wait till full page load
      all('.r>a').each do |search_result| # select first not Wikipedia/Википедия site
        search_result.click unless result.any? { |wiki_result| search_result.text.downcase.include? wiki_result.downcase }
      end
  end

  def present_on_page?(selector, word)
    if self.class.new.methods.include? selector.to_sym
      element = self.send(selector)
      element.text.downcase.include? word.downcase if element
    else
      false
    end
  end

end
