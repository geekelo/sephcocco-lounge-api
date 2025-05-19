class CreateJoinTableProductsCategories < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_lounge_product_categories_products, id: false do |t|
      t.uuid :sephcocco_lounge_product_id, null: false
      t.uuid :sephcocco_lounge_product_category_id, null: false
    end

    add_index :sephcocco_lounge_product_categories_products, 
              [:sephcocco_lounge_product_id, :sephcocco_lounge_product_category_id], 
              unique: true, 
              name: 'index_products_categories_on_product_and_category'
  end

  def down
    remove_index :sephcocco_lounge_product_categories_products, name: 'index_products_categories_on_product_and_category'
    drop_table :sephcocco_lounge_product_categories_products
  end
end
