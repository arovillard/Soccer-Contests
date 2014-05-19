class Winner < ActiveRecord::Base
  belongs_to :game
  belongs_to :entry
  belongs_to :user
end
