require 'selenium-webdriver'

browser = Selenium::WebDriver.for :chrome
browser.get 'https://www.amazon.com/gp/offer-listing/B01LRLJV28/ref=sr_1_4_olp?s=videogames&ie=UTF8&qid=1508494701&sr=1-4&keywords=Playstation+4+slim'


prod_hash = []

for seller in (2..11)
  price = browser.find_element(:xpath, "//*[@id=\"olpOfferList\"]/div/div/div[#{seller}]/div[1]/span").text.match(/\d.*/)
  ratings = browser.find_element(:xpath, "//*[@id=\"olpOfferList\"]/div/div/div[#{seller}]/div[4]/p").text.match(/(\d|\.){1,3}/)
  puts price[0].to_i
  puts ratings[0].to_f
  prod_hash[seller] = [ratings[0].to_i, price[0].to_i]
end


puts prod_hash
prod_hash.sort_by { |rating, price| [rating, price] }
puts prod_hash

browser.quit

#//*[@id="olpOfferList"]/div/div/div[4]/div[4]/p/text()
#//*[@id="olpOfferList"]/div/div/div[5]/div[4]/p/text()