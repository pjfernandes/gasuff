class CreateGases < ActiveRecord::Migration[6.0]
  def change
    create_table :gases do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :gas_type
      t.string :chamber_type
      t.float :gase_co2
      t.float :gase_ch4
      t.float :gase_n2o

      t.timestamps
    end
  end
end
