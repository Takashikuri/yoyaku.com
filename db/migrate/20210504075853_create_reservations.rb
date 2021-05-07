class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :sign_up_day
      t.datetime :reserve_day
      t.string :reserve_name
      t.string :reserve_phone_number
      t.integer :member
      t.string :course
      t.string :medium
      t.string :seat_number

      t.timestamps
    end
  end
end
