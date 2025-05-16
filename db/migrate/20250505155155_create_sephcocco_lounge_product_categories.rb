class CreateSephcoccoLoungeProductCategories < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_lounge_product_categories, id: :uuid do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.string :slug, null: false

      t.timestamps
    end

    add_index :sephcocco_lounge_product_categories, :name, unique: true
    add_index :sephcocco_lounge_product_categories, :slug, unique: true
  end

  def down
    remove_index :sephcocco_lounge_product_categories, :name
    remove_index :sephcocco_lounge_product_categories, :slug
    drop_table :sephcocco_lounge_product_categories
  end
end
