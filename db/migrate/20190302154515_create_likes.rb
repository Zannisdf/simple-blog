class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true
      t.boolean :liked, default: false

      t.timestamps
    end
  end
end
