class AddCityIdToCitywalks < ActiveRecord::Migration[5.1]
  def change
    add_column :citywalks, :city_id, :integer
  end
end
