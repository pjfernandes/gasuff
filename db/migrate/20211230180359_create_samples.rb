class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.references :user, null: false, foreign_key: true
      t.references :researcher, null: false, foreign_key: true
      t.string :class_sample
      t.float :latitude
      t.float :longitude
      t.date :date_sample
      t.date :date_analysis
      t.string :equipment
      t.string :local_name
      t.string :type
      t.float :concentration
      t.float :ph
      t.float :temperature
      t.float :salinity
      t.float :pressure
      t.string :method

      t.timestamps
    end
  end
end
