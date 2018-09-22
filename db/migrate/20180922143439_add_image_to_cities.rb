class AddImageToCities < ActiveRecord::Migration[5.1]
  def change
    add_column :cities, :image, :string
  end
end
