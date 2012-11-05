class User < ActiveRecord::Base
  attr_accessible :name

  has_many :user_mixtapes
  has_many :mixtapes, :through => :user_mixtapes
end
