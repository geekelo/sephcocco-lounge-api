class SephcoccoLoungeProductCategory < ApplicationRecord
  include ProductCategoryBehavior

  def self.product_association_name
    :sephcocco_lounge_products
  end

  def self.join_table_name
    'sephcocco_lounge_product_categories_products'
  end

  def self.category_foreign_key
    :sephcocco_lounge_product_category_id
  end

  def self.product_foreign_key
    :sephcocco_lounge_product_id
  end
end
