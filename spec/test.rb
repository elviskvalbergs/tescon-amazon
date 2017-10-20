module Testathon
  	require "selenium-webdriver"
  	require "./spec_helper"
    require './user'  
    require './browser'  
    require './playstation'  
	
	[:chrome, :firefox].each do |type|
		describe "log into Amazon through #{type}" do 
			before :all do
				@browser = Browser.new(type)
				@user = User.new
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
			after :all do
				@browser.driver.quit
			end
		end
	end
end