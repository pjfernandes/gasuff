class CreateSediments < ActiveRecord::Migration[6.0]
  def change
    create_table :sediments do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :remineralization
      #t.string :ecosystem
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

      t.timestamps
    end
  end
end
