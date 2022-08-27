class RenameColumnTypeToBugtype < ActiveRecord::Migration[6.1]
  def change
    rename_column :bugs ,:type ,:bugtype
  end
end
