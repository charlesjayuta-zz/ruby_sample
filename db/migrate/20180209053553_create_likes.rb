class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.integer :game_id
      t.string :ip_address

      t.timestamps
    end
  end
end
