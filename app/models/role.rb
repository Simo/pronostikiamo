class Role < ActiveRecord::Base
  
  has_many :users
  
  #has_many :positions
  #has_many :users, :through => :positions
end
