class AddCityIdToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :city_id, :integer
  end
end
