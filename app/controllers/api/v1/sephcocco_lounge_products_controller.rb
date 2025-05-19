class V1::SephcoccoLoungeProductsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = SephcoccoLoungeProduct.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = SephcoccoLoungeProduct.new(product_params)

    if product_params[:category_ids].present?
      @product.sephcocco_lounge_product_categories = SephcoccoLoungeProductCategory.where(id: product_params[:category_ids])
    end
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

	# DELETE /products/1
	def destroy
		@product.destroy
		head :no_content
	end

	def switch_visibility
		@product = SephcoccoLoungeProduct.find(params[:id])
		@product.update(visible: !@product.visible)
		render json: { message: "Product visibility updated successfully", product: @product }
	end

	def like
		@product = SephcoccoLoungeProduct.find(params[:id])
		unless SephcoccoLoungeProductLike.exists?(sephcocco_lounge_product_id: @product.id, sephcocco_user_id: current_user.id)
			@product.increment!(:likes)
			SephcoccoLoungeProductLike.create(sephcocco_user_id: current_user.id, sephcocco_lounge_product_id: @product.id)
			render json: { message: "Product liked successfully", product: @product }
    else
      render json: { message: "Product already liked" }, status: :unprocessable_entity
		end
	end

	def unlike
		@product = SephcoccoLoungeProduct.find(params[:id])
		if @product.likes > 0
      unless SephcoccoLoungeProductLike.exists?(sephcocco_lounge_product_id: @product.id, sephcocco_user_id: current_user.id)
        render json: { message: "Product not liked by user" }, status: :unprocessable_entity
      else
        SephcoccoLoungeProductLike.where(sephcocco_lounge_product_id: @product.id, sephcocco_user_id: current_user.id).destroy_all
        @product.decrement!(:likes)
			  render json: { message: "Product unliked successfully", product: @product }
      end
		else
			render json: { message: "Product cannot be unliked, no likes to remove" }, status: :unprocessable_entity
		end
	end

	private

  def set_product
    @product = SephcoccoLoungeProduct.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :short_description, :long_description, :price, :visible, category_ids: [])
  end
end
