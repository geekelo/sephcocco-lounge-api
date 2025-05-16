class SephcoccoLoungeProductCategory < ApplicationRecord
  has_many :sephcocco_lounge_products

  before_create :create_slug
  before_update :create_slug, if: :name_changes?

  private

  def create_slug
    self.slug = name.parameterize if name.present?
  end
end
