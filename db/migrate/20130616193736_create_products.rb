class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, default: "Наименование", null: false
      t.text :description, default: "Описание", null: false
      t.string :image_url, default: "default.png", null: false
      t.decimal :price, precision: 8, scale: 2, default: 1, null: false

      t.timestamps
    end
  end
end
