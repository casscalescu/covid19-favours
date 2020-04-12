class AddCoordinatesToFavours < ActiveRecord::Migration[5.2]
  def change
    add_column :favours, :latitude, :float
    add_column :favours, :longitude, :float
  end
end
