class AddUsertypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :usertype, :integer, default: 0
  end
end
