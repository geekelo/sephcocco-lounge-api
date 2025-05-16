class SephcoccoLoungeProduct < ApplicationRecord
  has_many :sephcocco_lounge_product_categories

  has_many :lounge_product_likes, class_name: 'SephcoccoLoungeProductLike', foreign_key: :sephcocco_lounge_product_id, dependent: :destroy
  has_many :likers, through: :lounge_product_likes, source: :sephcocco_user
end
