class RemoveStartEndDateFavours < ActiveRecord::Migration[5.2]
  def change
  	remove_column :favours, :start_date
  	remove_column :favours, :end_date
  end
end
