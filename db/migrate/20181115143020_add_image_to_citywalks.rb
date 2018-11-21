class AddImageToCitywalks < ActiveRecord::Migration[5.1]
  def change
    add_column :citywalks, :image, :string
  end
end
