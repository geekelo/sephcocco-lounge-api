class CreateSephcoccoLoungeProductLikes < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_lounge_product_likes, id: :uuid do |t|
      t.uuid :sephcocco_user_id, null: false
      t.uuid :sephcocco_lounge_product_id, null: false

      t.timestamps
    end

    add_index :sephcocco_lounge_product_likes, [:sephcocco_user_id, :sephcocco_lounge_product_id], unique: true, name: 'index_sephcocco_lounge_product_likes_on_user_and_product'

    add_foreign_key :sephcocco_lounge_product_likes, :sephcocco_users, column: :sephcocco_user_id
    add_foreign_key :sephcocco_lounge_product_likes, :sephcocco_lounge_products, column: :sephcocco_lounge_product_id
  end

  def down
    remove_foreign_key :sephcocco_lounge_product_likes, column: :sephcocco_user_id
    remove_foreign_key :sephcocco_lounge_product_likes, column: :sephcocco_lounge_product_id
    remove_index :sephcocco_lounge_product_likes, name: 'index_sephcocco_lounge_product_likes_on_user_and_product'
    drop_table :sephcocco_lounge_product_likes
  end
end
