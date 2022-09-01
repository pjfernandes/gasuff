class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.references :user, null: false, foreign_key: true
      t.references :researcher, null: false, foreign_key: true
      t.string :type
      t.float :latitude
      t.float :longitude
      t.date :date_sample
      t.date :date_analysis
      t.date :entry_date
      t.date :exit_date
      t.string :location
      t.string :history
      t.string :cod_sample
      t.string :observation
      t.string :class_sample
      t.string :remineralization
      t.string :ecosystem
      t.float :sediment_co2
      t.float :sediment_ch4
      t.float :sediment_n2o
      t.float :carbon
      t.float :nitrogen
      t.float :sand
      t.float :silt
      t.float :clay
      t.float :delta_13c
      t.float :delta_15n
      t.float :density
      t.string :water_type
      t.float :water_co2
      t.float :water_ch4
      t.float :water_n2o
      t.string :gas_type
      t.string :chamber_type
      t.float :gase_co2
      t.float :gase_ch4
      t.float :gase_n2o

      t.timestamps
    end
  end
end
