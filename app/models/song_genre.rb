class SongGenre < ActiveRecord::Base
  attr_accessible :genre

  belongs_to :song 
  belongs_to :genre
end
