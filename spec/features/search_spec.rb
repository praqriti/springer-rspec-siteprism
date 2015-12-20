require "lib/spec_helper"

feature "Search functionality" do
	before do
		@app = App.new
		@home_page = @app.home
		@home_page.load
	end

	scenario "should return valid total results on successful search" do
  		@search_results_page = @home_page.search_for('articles')
  		expect(@search_results_page).to be_displayed
  		expect(@search_results_page.results.size).to eq(20)
  		expected_results = @search_results_page.function_bar.total_pages.value.to_i*20
  		actual_results = @search_results_page.total_results.text.to_i
  		expect(expected_results).to be >= (actual_results)

	end

  	scenario "should return all search results on clicking the search button with no keywords" do
    	@search_results_page = @home_page.search_for('')
    	expect(@search_results_page).to be_displayed
  		expect(@search_results_page.results.size).to eq(20)
  	end

  	scenario "should return no search results page on entering an invalid keyword" do
    	@search_results_page = @home_page.search_for('abcdeabcdeabcdeabcd')
    	expect(@search_results_page).to be_displayed
  		expect(@search_results_page.results.size).to eq(0)
  		expect(@search_results_page.total_results.text).to eq("0")
  		expect(@search_results_page.no_results.text).to include("Sorry – we couldn’t find what you are looking for. Why not... ")
  	end

  	scenario "should return search results that are non-restricted" do
    	@search_results_page = @home_page.search_for('journals')
    	results_before_filtering = @search_results_page.function_bar.total_pages.value.to_i
    	@search_results_page.search_for_items_with_access('journals')
    	results_after_filtering = @search_results_page.function_bar.total_pages.value.to_i
  		expect(results_before_filtering).to be > (results_after_filtering)

  		expect(@search_results_page).to have_no_restricted_items
  		expect(@search_results_page).to have_results_teaser
  	end

end
