class CreateFavourApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :favour_applications do |t|
      t.references :favour, foreign_key: true
      t.references :applicant

      t.timestamps
    end

    add_foreign_key :favour_applications, :users, column: :applicant_id, primary_key: :id
  end
end
