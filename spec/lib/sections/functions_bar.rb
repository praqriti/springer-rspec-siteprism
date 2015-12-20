class FunctionBar < SitePrism::Section
  element :sort_results, "#sort-results"
  element :total_pages, "form > input:nth-child(4)"
  element :previous_button, ".prev"
  element :previous_button, ".next"
end