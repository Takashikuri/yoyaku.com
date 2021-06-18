class CreateManages < ActiveRecord::Migration[5.2]
  def change
    create_table :manages do |t|
      
      t.integer :table_number
      t.integer :member
      t.datetime   :start_time
      t.datetime   :last_time
      t.datetime   :finish_time
      t.string :course
      t.string :coupon
      t.string :remarks
      t.timestamps
      t.string :last
      t.string :accounting
      t.string :closed
      
    end
  end
end
