class AddColumnToReviews < ActiveRecord::Migration[7.1]
  def change
    add_reference :reviews, :bookings, null: false, foreign_key: true
  end
end
