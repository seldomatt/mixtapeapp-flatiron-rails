class Song < ActiveRecord::Base
  attr_accessible :name

  belongs_to :artist
  belongs_to :album
end
