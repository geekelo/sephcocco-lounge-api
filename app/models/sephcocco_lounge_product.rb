class SephcoccoLoungeProduct < ApplicationRecord
  has_and_belongs_to_many :sephcocco_lounge_product_categories, join_table: 'sephcocco_lounge_product_categories_products', foreign_key: :sephcocco_lounge_product_id, association_foreign_key: :sephcocco_lounge_product_category_id
  
  has_many :lounge_product_likes, class_name: 'SephcoccoLoungeProductLike', foreign_key: :sephcocco_lounge_product_id, dependent: :destroy
  has_many :likers, through: :lounge_product_likes, source: :sephcocco_user
end
