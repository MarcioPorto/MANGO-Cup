class Player < ActiveRecord::Base
  has_many :games
  has_many :matches, through: :games
end
