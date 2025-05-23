# app/controllers/api/v1/sephcocco_lounge_products_controller.rb
class Api::V1::SephcoccoLoungeProductsController < ApplicationController
  include Api::V1::Concerns::ProductManageable

  private

  def product_class
    SephcoccoLoungeProduct
  end

  def category_class
    SephcoccoLoungeProductCategory
  end

  def like_class
    SephcoccoLoungeProductLike
  end

  def product_key
    :sephcocco_lounge_product_id
  end

  def user_key
    :sephcocco_user_id
  end

  def category_association_name
    :sephcocco_lounge_product_categories
  end

  def product_params
    params.require(:product).permit(
      :name,
      :short_description,
      :long_description,
      :image_url,
      :other_images,
      :amount_in_stock,
      :price,
      :visible,
      category_ids: []
    )
  end
end
