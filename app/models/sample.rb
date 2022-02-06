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

  def self.to_csv
    CSV.generate(headers: true, col_sep: ";") do |csv|
      csv << ["longitude", "latitude", "class_sample"]

      all.each do |sample|
        row = [sample.longitude, sample.latitude, sample.class_sample]
        csv << row
      end
    end
  end

end
