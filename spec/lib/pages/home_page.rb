class Home < SitePrism::Page
set_url "/"

  element  :search_field,    "input#query"
  element  :search_button,   "input#search"

  def search_for(query)
    search_field.set(query)
    search_button.click
    SearchResults.new 
  end
end