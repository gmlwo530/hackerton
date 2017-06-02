class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :writer
      t.text :content
      t.string :option
      t.timestamps null: false
    end
  end
end
