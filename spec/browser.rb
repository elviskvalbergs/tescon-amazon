class Browser
  def initialize(type)
    self.type = type
    self.driver = Selenium::WebDriver.for type
  end  

  attr_accessor :type, :driver
  
  def self.type
    return self.type
  end  
  
  def self.driver
    return self.type
  end  

end 