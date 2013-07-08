class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :from
      t.date :to
      t.integer :prop_id
      t.integer :user_id

      t.timestamps
    end
  end
end
