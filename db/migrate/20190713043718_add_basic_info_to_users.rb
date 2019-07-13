class AddBasicInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_name, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name_kana, :string
    add_column :users, :first_name_kana, :string
    add_column :users, :category_id, :integer
    add_column :users, :lesson_id, :integer
    add_column :users, :target_time, :integer
    add_column :users, :learning_time, :integer
  end
end
