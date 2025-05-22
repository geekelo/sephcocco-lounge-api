class SephcoccoLoungeProduct < ApplicationRecord
  include ProductBehavior

  def self.category_association_name
    :lounge_product_categories
  end

  def self.join_table_name
    'sephcocco_lounge_product_categories_products'
  end

  def self.product_foreign_key
    :sephcocco_lounge_product_id
  end

  def self.category_foreign_key
    :sephcocco_lounge_product_category_id
  end

  def self.product_likes_class
    SephcoccoLoungeProductLike
  end

  def self.orders_class
    SephcoccoLoungeOrder
  end
end
