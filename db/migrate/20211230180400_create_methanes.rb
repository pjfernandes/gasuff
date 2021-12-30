class CreateMethanes < ActiveRecord::Migration[6.0]
  def change
    create_table :methanes do |t|
      t.references :sample, null: false, foreign_key: true
      t.float :concentration
      t.string :method

      t.timestamps
    end
  end
end
