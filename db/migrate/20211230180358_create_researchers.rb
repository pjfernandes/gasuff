class CreateResearchers < ActiveRecord::Migration[6.0]
  def change
    create_table :researchers do |t|
      t.string :first_name
      t.string :last_name
      t.string :institution
      t.string :city
      t.string :nation
      t.string :email

      t.timestamps
    end
  end
end
