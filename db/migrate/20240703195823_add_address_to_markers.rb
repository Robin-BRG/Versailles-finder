class AddAddressToMarkers < ActiveRecord::Migration[7.1]
  def change
    add_column :markers, :address, :string
  end
end
