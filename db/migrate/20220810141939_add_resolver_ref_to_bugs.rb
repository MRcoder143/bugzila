class AddResolverRefToBugs < ActiveRecord::Migration[6.1]
  def change
     remove_column :bugs ,:resolver_id
  end
end
