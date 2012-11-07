class Song < ActiveRecord::Base
  attr_accessible :name, :artist_name, :genre_names, :genre

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

  def add_genre(genre)
    genre = Genre.find_or_create_by_name(genre) if genre.is_a?(String)
    self.song_genres.build(:genre => genre).genre unless song_genre_exists?(genre) 
  end

  def genre_names
    self.genres.collect{|g| g.name} if self.genres.exists?
  end

  def genre_names=(string)
    string.split(",").collect do |genre_name|
      self.add_genre(genre_name.strip)
    end
  end

  private 

    def song_genre_exists?(genre)
      self.song_genres.detect{|sg| sg.genre_id == genre.id}
    end

end
