class AddNameLastNameToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :name, :string
    add_column :accounts, :lastname, :string
  end
end
