class CreateJoinTableProductsCategories < ActiveRecord::Migration[7.2]
  def change
    create_table :sephcocco_lounge_product_categories_products, id: false do |t|
      t.uuid :sephcocco_lounge_product_id, null: false
      t.uuid :sephcocco_lounge_product_category_id, null: false
    end

    add_index :sephcocco_lounge_product_categories_products, 
              [:sephcocco_lounge_product_id, :sephcocco_lounge_product_category_id], 
              unique: true, 
              name: 'index_products_categories_on_product_and_category'
  end
end
