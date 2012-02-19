class Product < ActiveRecord::Base
  default_scope :order => 'title'
  
  # validation stuff...
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => {:message => "already exists in database. Please choose another."}
  validates :title, :length => {:minimum => 10, :message => "must be at least 10 characters long"}
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a valid url for a GIF, JPG, or PNG image.'
  }
end
