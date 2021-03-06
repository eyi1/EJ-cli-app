class Scraper
    
    def scrape_page
        Nokogiri::HTML(open("https://www.theinfatuation.com/new-york/guides/coffee-shops-nyc-for-doing-work"))
    end

    def scrape_coffeeshop_index 
        scrape_page.css("div.spot-block")[8..20].map {|index| index}
    end
    
    def create_coffeeshops
        scrape_coffeeshop_index.each do |coffeeshop_index|
            Store.new_from_index(coffeeshop_index)    
        end
    end

end