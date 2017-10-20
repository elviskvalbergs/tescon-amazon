module Testathon
  	require "selenium-webdriver"
  	require "./spec_helper"
    require './user'  
    require './browser'  
    require './product'  
	
	[:chrome].each do |type|
		describe "log into Amazon through #{type}" do 
			before :all do
				@browser = Browser.new(type)
				@user = User.new
				@product = Product.new("a", "b", "c", "d", "e", "f", "g")
				puts "#{@product.department} | #{@product.category} | #{@product.subcategory} | #{@product.sub_sub_category} | #{@product.genre} | #{@product.search_term} | #{@product.max_price}"
			end
			
			after :all do
				@browser.driver.quit
			end

			it "should create a user" do
				expect(@user).not_to be_nil
			end

			it "should open the #{type} browser" do
				expect(@browser).not_to be_nil
			end

			it "should enter the credentials and log in" do
				@user.log_in(@browser.driver)
			end
			
			it "should go to department" do
				@browser.driver.navigate.to "https://www.amazon.com/"
				@browser.driver.find_element(:id, 'nav-link-shopall').click
				wait = Selenium::WebDriver::Wait.new(timeout: 10)
			end

			it "should go to category" do
				element = @browser.driver.find_elements(:link, 'Video Games')[0]
				element.send_keys(:return)
				wait = Selenium::WebDriver::Wait.new(timeout: 10)
			end

			# it "should select sub-category - #{@product.subcategory}" do
			# 	@browser.driver.find_element(:xpath, '//*[@id="leftNav"]/ul[0]/ul/div/li[0]/span/a').click #Playstation 4
			# 	wait = Selenium::WebDriver::Wait.new(timeout: 10)
			# end

			# it "should select sub-sub-category - #{@product.sub_sub_category}" do
			# 	@browser.driver.find_element(:xpath, '//*[@id="leftNav"]/ul[0]/ul/div/li[4]/span/a').click #Games
			# 	wait = Selenium::WebDriver::Wait.new(timeout: 10)
			# end

			# it "should select the genre - #{@product.genre}" do
			# 	@browser.driver.find_element(:xpath, '//*[@id="leftNav"]/ul[2]/div/li[8]/span/a').click #Games
			# 	wait = Selenium::WebDriver::Wait.new(timeout: 10)
			# end

			it "should set max price " do
			  element = @browser.driver.find_element(:id, 'high-price')
			  element.clear                                           
      		  element.send_keys @product.max_price                            
			end

			# it "should ship to location" do
			# 	wait = Selenium::WebDriver::Wait.new(timeout: 5000)
			# 	@browser.driver.find_element(:xpath("//span[.='Ship to #{@user.location}']")).click
			# end

		end
	end
end