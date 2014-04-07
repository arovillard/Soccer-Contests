class Game < ActiveRecord::Base
  has_many :entries
  belongs_to :contest
end
