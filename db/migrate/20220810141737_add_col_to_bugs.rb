class AddColToBugs < ActiveRecord::Migration[6.1]
  def change
    add_column :bugs, :resolver_id, :integer
  end
end
