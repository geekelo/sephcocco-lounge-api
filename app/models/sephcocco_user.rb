class SephcoccoUser < ApplicationRecord
  belongs_to :sephcocco_user_role, optional: true

  has_many :lounge_product_likes, class_name: 'SephcoccoLoungeProductLike', foreign_key: :sephcocco_user_id, dependent: :destroy
  has_many :liked_products, through: :lounge_product_likes, source: :sephcocco_lounge_product
end