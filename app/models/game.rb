class Game < ActiveRecord::Base
  has_many :entries
  has_many :winners
  belongs_to :contest
end
