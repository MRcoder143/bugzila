class AddColToProject < ActiveRecord::Migration[6.1]
  def change
     add_column :user_projects, :description, :string
  end
end
