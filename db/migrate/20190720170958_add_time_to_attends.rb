class AddTimeToAttends < ActiveRecord::Migration[5.2]
  def change
    add_column :attends, :time, :integer
  end
end
