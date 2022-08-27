class CreateBugs < ActiveRecord::Migration[6.1]
  def change
    create_table :bugs do |t|
      t.string :title
      t.datetime :deadline
      t.string :screenshot
      t.string :type
      t.string :status
      t.belongs_to :user
      t.belongs_to :project


      t.timestamps
    end
  end
end
