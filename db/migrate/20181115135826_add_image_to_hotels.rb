class AddImageToHotels < ActiveRecord::Migration[5.1]
  def change
    add_column :hotels, :image, :string
  end
end
