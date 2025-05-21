class SephcoccoLoungeOrder < ApplicationRecord
  belongs_to :sephcocco_lounge_product
  belongs_to :sephcocco_user

  before_create :set_unit_price
  before_create :set_order_status
  before_create :set_order_number
  before_create :set_order_total
  before_create :set_shipping_details

  private
  def set_order_status
    self.status = 'pending' # ['pending', 'processing', 'completed', 'cancelled']
    self.stages =  ['pending'] # ['pending', 'processing', 'shipped', 'delivered']
    self.current_stage = self.stages.last
    self.quantity = self.quantity || 1
  end

  def set_order_number
    self.order_number = SecureRandom.uuid
  end

  def set_unit_price
    self.unit_price = self.sephcocco_lounge_product.price
  end

  def set_order_total
    self.total_price = self.unit_price * self.quantity unless self.unit_price.nil?
    self.total_cost = self.total_price + self.shipping_cost unless self.shipping_cost.nil?
  end
end
