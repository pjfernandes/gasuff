class Researcher < ApplicationRecord
  has_many :samples
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
