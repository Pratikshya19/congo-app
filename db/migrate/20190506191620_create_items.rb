class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.integer :category_id
      t.string :image_url
      t.integer :vendor_id

      t.timestamps
    end
  end
end
