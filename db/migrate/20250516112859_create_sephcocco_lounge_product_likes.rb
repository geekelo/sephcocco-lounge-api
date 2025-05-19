class CreateSephcoccoLoungeProductLikes < ActiveRecord::Migration[7.2]
  def up
    create_table :sephcocco_lounge_product_likes, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.uuid :sephcocco_user_id, null: false, foreign_key: true
      t.uuid :sephcocco_lounge_product_id, null: false, foreign_key: true

      t.timestamps
    end

    add_index :sephcocco_lounge_product_likes, [:sephcocco_user_id, :sephcocco_lounge_product_id], unique: true, name: 'index_sephcocco_lounge_product_likes_on_user_and_product'
  end

  def down
    remove_index :sephcocco_lounge_product_likes, name: 'index_sephcocco_lounge_product_likes_on_user_and_product'
    drop_table :sephcocco_lounge_product_likes
  end
end
