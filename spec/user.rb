class User  
  def initialize(email = nil, pass = nil, location = nil)  
    # Instance variables  
    self.name = name || "flexbihackathon"
    self.email = email || "flexbihackathon@gmail.com"
    self.pass = pass || "flexbihackathon"
    self.location = location || "Latvia"
  end  

  attr_accessor :name, :email, :pass, :location
  
  def self.email
    return self.email
  end  
  
  def self.pass
    return self.pass
  end

  def self.location
    return self.location
  end

  def self.name
    return self.name
  end

  def log_in(browser)
    browser.navigate.to "https://www.amazon.com/"
    #wait = Selenium::WebDriver::Wait.new(timeout: 5)
    #Get a list of nav-line-1 class elements, that only appear when logged in
    logged_in = browser.find_elements(:xpath, '//*[@id="nav-link-accountList"]/nav-line-1').size == 1
    if !logged_in
      browser.find_element(:id, 'nav-link-accountList').click #Find log in button
      element = browser.find_element(:id, 'ap_email')         #Find email field
      element.clear                                           #Clear the field, just in case
      element.send_keys self.email                            #Enter user email
      element = browser.find_element(:id, 'ap_password')      #Find password field
      element.clear                                           #Clear the field, just in case
      element.send_keys self.pass                             #Enter user password
      browser.find_element(:id, 'signInSubmit').click         #Log in
    end
  end
end 