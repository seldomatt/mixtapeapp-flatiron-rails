class Song < ActiveRecord::Base
  attr_accessible :name, :artist_name

  belongs_to :artist
  belongs_to :album

  has_many :song_genres
  has_many :genres, :through => :song_genres 

  has_many :mixtape_songs
  has_many :mixtapes, :through => :mixtape_songs

  def artist_name
    self.artist.name if self.artist
  end

  def artist_name=(string)
    self.artist = Artist.find_or_create_by_name(string)
  end


end
