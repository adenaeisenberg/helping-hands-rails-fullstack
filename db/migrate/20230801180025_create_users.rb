class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :bio
      t.date :dob
      t.string :phone_number
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
