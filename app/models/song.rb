class Song < ActiveRecord::Base
  attr_accessible :name

  belongs_to :artist
  belongs_to :album

  has_many :song_genres
  has_many :genres, :through => :song_genres 
end
