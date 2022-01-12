class CreateSediments < ActiveRecord::Migration[6.0]
  def change
    create_table :sediments do |t|
      t.references :sample, null: false, foreign_key: true
      #t.string :class_sediment
      t.float :p_total
      t.float :cinorg
      t.float :c_total
      t.float :calcidif
      t.float :n_total
      t.float :delta_13c
      t.float :delta_15n
      t.string :method

      t.timestamps
    end
  end
end
