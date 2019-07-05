class CreateBookings < ActiveRecord::Migration[4.2]

  def change
    create_table :bookings do |t|
      t.integer :user_id
      t.integer :clinic_id
      t.integer :price
      t.string :reason
      t.string :day
      t.string :time
      t.timestamps
    end
  end

end
