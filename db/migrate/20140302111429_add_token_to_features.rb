class AddTokenToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :token, :string
    add_index :features, :token, unique: true
  end
end
