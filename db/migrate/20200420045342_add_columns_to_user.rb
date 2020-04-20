class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :recipient_rating_average, :float
    add_column :users, :helper_rating_average, :float
  end
end
