class AddDateToFavours < ActiveRecord::Migration[5.2]
  def change
  	add_column :favours, :completion, :date
  end
end
