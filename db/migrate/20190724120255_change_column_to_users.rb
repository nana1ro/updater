class ChangeColumnToUsers < ActiveRecord::Migration[5.2]

  def up
    change_column :users, :target_time, :integer, default: 1
  end

  def down
    change_column :users, :target_time, :integer
  end

end
