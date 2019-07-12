class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.integer :category_id
      t.integer :rank_id
      t.string :name
      t.string :image
      t.string :video
      t.text :description
      t.integer :time
      t.integer :status

      t.timestamps
    end
  end
end
