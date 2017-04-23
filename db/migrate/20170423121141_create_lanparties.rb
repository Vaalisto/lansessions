class CreateLanparties < ActiveRecord::Migration
  def change
    create_table :lanparties do |t|
      t.string :partyname
      t.datetime :startdate
      t.datetime :endtime
      t.string :description

      t.timestamps null: false
    end
  end
end
