class Removecolumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :bugs , :screenshot
  end
end
