class CreateCitywalks < ActiveRecord::Migration[5.1]
  def change
    create_table :citywalks do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.string :place

      t.timestamps
    end
  end
end
