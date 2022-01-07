class CreateSediments < ActiveRecord::Migration[6.0]
  def change
    create_table :sediments do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :class_sediment

      t.timestamps
    end
  end
end
