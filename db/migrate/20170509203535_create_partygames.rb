class CreatePartygames < ActiveRecord::Migration
  def change
    create_table :partygames do |t|
      t.integer :lanparty_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
