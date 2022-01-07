class AddCoordinatesToResearchers < ActiveRecord::Migration[6.0]
  def change
    add_column :researchers, :latitude, :float
    add_column :researchers, :longitude, :float
  end
end
