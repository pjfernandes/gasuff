class CreatePsediments < ActiveRecord::Migration[6.0]
  def change
    create_table :psediments do |t|
      t.references :sediment, null: false, foreign_key: true
      t.float :p_total
      t.float :cinorg
      t.float :delta_13c
      t.string :method

      t.timestamps
    end
  end
end
