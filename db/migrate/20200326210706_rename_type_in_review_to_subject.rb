class RenameTypeInReviewToSubject < ActiveRecord::Migration[5.2]
  def change
    rename_column :reviews, :type, :subject
  end
end
