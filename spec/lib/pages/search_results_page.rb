class SearchResults < SitePrism::Page
	set_url "/search"
  elements :results,      "#results-list > li"
  elements :results_links,   "[data-hook='products_list_item'] a"
  element :total_results, ".header > h1 > strong:nth-child(1)"
  element  :search_field,    "input#query"
  element  :search_button,   "input#search"

  def search_for(query)
    search_field.set(query)
    search_button.click
    # click_on('Search')
  end
end