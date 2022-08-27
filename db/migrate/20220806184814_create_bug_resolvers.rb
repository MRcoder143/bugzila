class CreateBugResolvers < ActiveRecord::Migration[6.1]
  def change
    create_table :bug_resolvers do |t|
      t.belongs_to :user
      t.belongs_to :bug

      t.timestamps
    end
  end
end
