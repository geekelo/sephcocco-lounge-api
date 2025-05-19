class Api::V1::SephcoccoLoungeProductCategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_product_category, only: [:show, :update, :destroy]

  # GET /product_categories
  def index
    @product_categories = SephcoccoLoungeProductCategory.all

    render json: @product_categories
  end

  # GET /product_categories/1
  def show
    render json: @product_category
  end

  # POST /product_categories
  def create
    @product_category = SephcoccoLoungeProductCategory.new(product_category_params)

    if @product_category.save
      render json: @product_category, status: :created, location: api_v1_product_category_url(@product_category)
    else
      render json: @product_category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_categories/1
  def update
    if @product_category.update(product_category_params)
      render json: @product_category
    else
      render json: @product_category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_categories/1
  def destroy
    @product_category.destroy
  end

  def add_product_to_category
    @product = SephcoccoLoungeProduct.find(params[:product_id])
    @category = SephcoccoLoungeProductCategory.find(params[:category_id])

    if @product && @category
      @product.product_category_assignments.create(sephcocco_lounge_product_category: @category)
      render json: { message: "Product added to category successfully", product: @product }, status: :created
    else
      render json: { message: "Product or category not found" }, status: :not_found
    end
  end

  private

  def set_product_category
    @product_category = SephcoccoLoungeProductCategory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_category_params
    params.require(:product_category).permit(:name, :description, :slug)
  end
end
