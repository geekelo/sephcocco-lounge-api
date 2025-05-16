class SephcoccoLoungeProductLike < ApplicationRecord
  belongs_to :sephcocco_user, class_name: 'SephcoccoUser', foreign_key: :sephcocco_user_id
  belongs_to :sephcocco_lounge_product, class_name: 'SephcoccoLoungeProduct', foreign_key: :sephcocco_lounge_product_id
end
