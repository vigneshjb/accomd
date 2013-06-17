class CreateAccomadations < ActiveRecord::Migration
  def change
    create_table :accomadations do |t|
      t.string :location
      t.boolean :isBooked
      t.integer :user_id

      t.timestamps
    end
  end
end
