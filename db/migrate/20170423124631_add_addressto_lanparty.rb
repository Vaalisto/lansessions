class AddAddresstoLanparty < ActiveRecord::Migration
  def change
  	add_column :lanparties, :address, :string
  	add_column :lanparties, :city, :string
  end
end
