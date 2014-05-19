class Contest < ActiveRecord::Base
  has_many :entries, :dependent => :destroy
  has_many :games
  has_many :users, through: :entries
  has_many :winners
  accepts_nested_attributes_for :entries, :reject_if => lambda { |e| e[:team_a_score].blank? || e[:team_b_score].blank? }
end
