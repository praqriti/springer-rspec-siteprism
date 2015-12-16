require 'lib/pages/home_page.rb'
require 'lib/pages/search_results_page.rb'

class App
  def home
    Home.new
  end

  def search_results
    SearchResults.new
  end
end