class AddMessageAndStatusToFavourApplicants < ActiveRecord::Migration[5.2]
  def change
    add_column :favour_applications, :message, :text
    add_column :favour_applications, :status, :string
  end
end
