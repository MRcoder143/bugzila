class AddResolverToBugs < ActiveRecord::Migration[6.1]
  def change
    add_reference :bugs, :resolver, null: false, foreign_key: {to_table: :users}
   end
  end
