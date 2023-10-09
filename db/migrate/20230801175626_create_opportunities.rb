class CreateOpportunities < ActiveRecord::Migration[7.0]
  def change
    create_table :opportunities do |t|
      t.string :title
      t.text :description
      t.date :date
      t.integer :user_id
      t.boolean :status

      t.timestamps
    end
  end
end
