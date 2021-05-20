class CreateManages < ActiveRecord::Migration[5.2]
  def change
    create_table :manages do |t|
      t.integer :No
      t.integer :table_number
      t.integer :member
      t.time   :start_time
      t.time   :last_time
      t.time   :finish_time
      t.string :course
      t.string :coupon
      t.string :remarks
      t.timestamps
    end
  end
end
