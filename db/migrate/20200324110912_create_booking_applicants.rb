class CreateBookingApplicants < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_applicants do |t|
      t.references :user, foreign_key: true
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
