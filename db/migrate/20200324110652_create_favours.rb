class CreateFavours < ActiveRecord::Migration[5.2]
  def change
    create_table :favours do |t|
      t.string :category
      t.string :title
      t.text :description
      t.string :address
      t.string :important_info
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
