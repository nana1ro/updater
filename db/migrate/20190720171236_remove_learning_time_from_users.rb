class RemoveLearningTimeFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :learning_time
  	remove_column :users, :lesson_id
  end
end
