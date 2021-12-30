class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.references :user, null: false, foreign_key: true
      t.references :researcher, null: false, foreign_key: true
      t.string :type
      t.float :latitude
      t.float :longitude
      t.string :date_sample
      t.string :date_analysis
      t.string :equipment
      t.string :local_name

      t.timestamps
    end
  end
end
