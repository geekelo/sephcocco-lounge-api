class SephcoccoLoungeProductLike < ApplicationRecord
  include ProductLikeBehavior

  def self.user_class_name
    'SephcoccoUser'
  end

  def self.product_class_name
    'SephcoccoLoungeProduct'
  end

  def self.user_foreign_key
    :sephcocco_user_id
  end

  def self.product_foreign_key
    :sephcocco_lounge_product_id
  end
end
