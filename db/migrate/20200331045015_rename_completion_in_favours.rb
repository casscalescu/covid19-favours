class RenameCompletionInFavours < ActiveRecord::Migration[5.2]
  def change
  	rename_column :favours, :completion, :completion_date
  end
end
