class CreateCnratios < ActiveRecord::Migration[6.0]
  def change
    create_table :cnratios do |t|
      t.references :sediment, null: false, foreign_key: true
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
