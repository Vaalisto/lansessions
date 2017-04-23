class ChangeLanpartyEndtimeToEnddate < ActiveRecord::Migration
  def change
  	remove_column :lanparties, :endtime, :datetime
  	add_column :lanparties, :enddate, :datetime
  end
end
