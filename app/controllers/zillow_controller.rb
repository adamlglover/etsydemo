require 'open-uri'
require 'nokogiri'
require 'csv'

url = "http://www.zillow.com/homes/for_rent/Shaw-Washington-DC/house,condo,apartment,duplex,townhouse_type/121785_rid/0-800193_price/0-3000_mp/days_sort/38.922341,-77.009976,38.908517,-77.040875_rect/14_zm/"
page = Nokogiri::HTML(open(url))

url = []
url << line['href']
end
end