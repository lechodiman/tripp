class AddCityIdToRestaurant < ActiveRecord::Migration[5.1]
  def change
    add_column :restaurants, :city_id, :integer
  end
end
