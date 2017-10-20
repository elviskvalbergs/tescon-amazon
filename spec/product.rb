class Product
  def initialize(department = nil, category = nil, subcategory = nil, sub_sub_category = nil, genre = nil, search_term = nil, max_price = nil)
    self.department = department
    self.category = category
    self.subcategory = subcategory
    self.sub_sub_category = sub_sub_category
    self.genre = genre
    self.search_term = search_term
    self.max_price = max_price
  end  

  attr_accessor :department, :category, :subcategory, :sub_sub_category, :genre, :search_term, :max_price

  def self.department
    return self.department
  end

  def self.category
    return self.category
  end

  def self.subcategory
    return self.subcategory
  end

  def self.sub_sub_category
    return self.sub_sub_category
  end

  def self.genre
    return self.genre
  end

  def self.search_term
    return self.search_term
  end

  def self.max_price
    return self.max_price
  end
end 