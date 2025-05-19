class SephcoccoLoungeProductCategory < ApplicationRecord
  has_and_belongs_to_many :sephcocco_lounge_products, join_table: 'sephcocco_lounge_product_categories_products', foreign_key: :sephcocco_lounge_product_category_id, association_foreign_key: :sephcocco_lounge_product_id

  before_create :create_slug
  before_update :create_slug, if: :name_changes?

  private

  def create_slug
    self.slug = name.parameterize if name.present?
  end
end
