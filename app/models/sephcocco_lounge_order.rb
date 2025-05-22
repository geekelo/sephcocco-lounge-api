class SephcoccoLoungeOrder < ApplicationRecord
  include OrderCallbacks

  belongs_to :sephcocco_lounge_product
  belongs_to :sephcocco_user

  # Alias to standardize the method used in the concern
  def product
    sephcocco_lounge_product
  end
end
