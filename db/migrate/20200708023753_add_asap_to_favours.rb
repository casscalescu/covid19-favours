class AddAsapToFavours < ActiveRecord::Migration[5.2]
  def change
    add_column :favours, :completion_asap, :binary
  end
end
