class CreateWaters < ActiveRecord::Migration[6.0]
  def change
    create_table :waters do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :water_type
      t.float :water_co2
      t.float :water_ch4
      t.float :water_n2o

      t.timestamps
    end
  end
end
