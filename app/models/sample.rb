class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :researcher
  has_many :carbons
  has_many :methanes
  has_many :sediments

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :class_sample, :local_name, :equipment, :date_analysis, :date_sample ],
    associated_against: {
      researcher: [ :first_name, :last_name, :institution ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
