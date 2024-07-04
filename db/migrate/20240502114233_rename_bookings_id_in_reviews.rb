class RenameBookingsIdInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :bookings_id, :booking_id
  end
end
