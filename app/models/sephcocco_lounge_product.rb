class SephcoccoLoungeProduct < ApplicationRecord
  include ProductBehavior

  def self.category_association_name
    :sephcocco_lounge_product_categories
  end

  def self.category_join_table
    'sephcocco_lounge_product_categories_products'
  end

  def self.product_foreign_key
    :sephcocco_lounge_product_id
  end

  def self.category_foreign_key
    :sephcocco_lounge_product_category_id
  end

  def self.product_likes_association_name
    :lounge_product_likes
  end

  def self.product_like_class_name
    'SephcoccoLoungeProductLike'
  end

  def self.orders_association_name
    :orders
  end

  def self.order_class_name
    'SephcoccoLoungeOrder'
  end
end
