class CreateSephcoccoLoungeProducts < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_lounge_products, id: :uuid do |t|
      t.string :name, null: false
      t.string :image_url, null: true
      t.decimal :price, precision: 16, scale: 2, null: false, default: 0.0
      t.integer :amount_in_stock, default: 0, null: false
      t.string  :short_description, null: true
      t.text    :long_description, null: true
      t.string  :other_images, array: true, default: []
      t.integer  :likes, null: false, default: 0
      t.boolean :visible, null: false, default: false

      t.timestamps
    end

    add_index :sephcocco_lounge_products, :name, unique: true
  end

  def down
    remove_index :sephcocco_lounge_products, :name
    drop_table :sephcocco_lounge_products
  end
end
