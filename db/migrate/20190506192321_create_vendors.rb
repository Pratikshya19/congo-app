class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :password
      t.boolean :vendor

      t.timestamps
    end
  end
end
