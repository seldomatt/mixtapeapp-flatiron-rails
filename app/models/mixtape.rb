class Mixtape < ActiveRecord::Base
  attr_accessible :name

  has_many :user_mixtapes
  has_many :users, :through => :user_mixtapes
end
