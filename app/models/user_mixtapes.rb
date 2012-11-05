class UserMixtapes < ActiveRecord::Base
  attr_accessible :mixtape_id, :user_id

  belongs_to :user
  belongs_to :mixtape
end
