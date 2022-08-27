class DropBugResolver < ActiveRecord::Migration[6.1]
  def change
    drop_table :bug_resolvers
  end
end
