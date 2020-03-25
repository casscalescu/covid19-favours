class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :type
      t.integer :rating
      t.text :description
      t.references :recipient
      t.references :helper
      t.references :favour, foreign_key: true

      t.timestamps
    end

    add_foreign_key :reviews, :users, column: :recipient_id, primary_key: :id
    add_foreign_key :reviews, :users, column: :helper_id, primary_key: :id
  end
end
