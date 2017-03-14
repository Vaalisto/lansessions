class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :year
      t.string :platform

      t.timestamps null: false
    end
  end
end
