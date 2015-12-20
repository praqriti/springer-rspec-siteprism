require "lib/sections/functions_bar.rb"

class SearchResults < SitePrism::Page
	set_url "/search"
  elements :results,      "#results-list > li"
  element  :total_results, ".header > h1 > strong:nth-child(1)"
  element  :search_field,    "input#query"
  element  :search_button,   "input#search"
  element  :no_results,   "#no-results-message"
  element  :preview_only_checkbox, "#results-only-access-checkbox"
  elements :restricted_items, ".no-access-message"
  element  :results_teaser, "#results-teaser"

  section :function_bar, FunctionBar, ".functions-bar.functions-bar-top"

  def search_for(query)
    search_field.set(query)
    search_button.click
  end

  def search_for_items_with_access(query)
    preview_only_checkbox.click
    search_field.set(query)
    search_button.click
  end
end