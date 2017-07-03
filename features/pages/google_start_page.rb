class GoogleStartPage < SitePrism::Page

  element :search_field, '#lst-ib'
  element :search_button, '#_fZl'

  def google_word(word)
    search_field.click
    search_field.set word
    search_button.click
  end

end