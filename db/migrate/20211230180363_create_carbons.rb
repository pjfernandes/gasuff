class CreateCarbons < ActiveRecord::Migration[6.0]
  def change
    create_table :carbons do |t|
      t.references :sample, null: false, foreign_key: true
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
