class CreateAccountDetails < ActiveRecord::Migration
  def change
    create_table :account_details do |t|
      t.string :street
      t.string :city
      t.integer :account_id

      t.timestamps
    end
  end
end
