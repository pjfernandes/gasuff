class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :researcher
  has_many :carbons
  has_many :methanes
  has_many :sediments
end
