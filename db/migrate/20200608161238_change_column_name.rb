class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :shoes, :type, :shoe_type
  end
end
