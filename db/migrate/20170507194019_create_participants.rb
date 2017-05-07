class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :lanparty_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
