class CreateFavours < ActiveRecord::Migration[5.2]
  def change
    create_table :favours do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :address
      t.string :status
      t.references :recipient
      t.references :helper

      t.timestamps
    end

    add_foreign_key :favours, :users, column: :recipient_id, primary_key: :id
    add_foreign_key :favours, :users, column: :helper_id, primary_key: :id
  end
end
