require "lib/spec_helper"

feature "Search functionality" do
	before do
		@app = App.new
		@home_page = @app.home
		@home_page.load
	end

	scenario 'a search term is entered' do
  		@search_results = @home_page.search_for('jersey')
  		expect(@search_results).to be_displayed
  		expect(@search_results.results.size).to eq(20)
  		expect(@search_results.total_results.text).to eq(168,488)
	end

  	scenario "should return all search results on clicking the search button" do
    	@search_results = @home_page.search_for('')
    	expect(@search_results).to be_displayed
  		expect(@search_results.results.size).to eq(20)
  		expect(@search_results.total_results.text).to eq(9,608,158)
  	end

end
