class Sample < ApplicationRecord
  belongs_to :user
  belongs_to :researcher
  has_many :waters
  has_many :gases
  has_many :sediments

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :class_sample, :date_analysis, :date_sample ],
    associated_against: {
      researcher: [ :first_name, :last_name, :institution ]
    },
    using: {
      tsearch: { prefix: true }
    }

  def self.to_csv(records = [])
    CSV.generate(headers: true, col_sep: ";") do |csv|
      csv << ["longitude", "latitude", "class_sample"]

      records.each do |sample|
        row = [sample.longitude, sample.latitude, sample.class_sample]
        csv << row
      end
    end
  end
end
