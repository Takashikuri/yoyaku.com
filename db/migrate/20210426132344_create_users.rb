class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :store_name
      t.string :phone_number
      t.string	:address
      t.string	:email
      
      t.string  :password_digest

      t.timestamps
    end
  end
end
