class Api::V1::SephcoccoLoungeOrdersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy, :user_orders, :user_order_create, :user_order_update, :user_order_destroy]
  before_action :set_order, only: [:update, :destroy]
  before_action :set_customer, only: [:create]

  # ADMIN ONLY
  # GET /orders
  def index
    @orders = SephcoccoLoungeOrder.all

    render json: @orders
  end

  # POST /orders
  def create
    order = @customer.sephcocco_lounge_orders.new(order_params) unless @customer.nil?

    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @order.destroy
      render json: { message: 'Order deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete order' }, status: :unprocessable_entity
    end
  end

# USER ONLY

  def user_orders
    @orders = current_user.sephcocco_lounge_orders

    render json: @orders
  end

  def user_order_create
    order = current_user.sephcocco_lounge_orders.new(order_params)
    if order.save
      render json: order, status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end

  def user_order_update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def user_order_destroy
    if @order.destroy
      render json: { message: 'Order deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete order' }, status: :unprocessable_entity
    end
  end

  private

  def set_order
    if current_user.sephcocco_user_role.name == 'admin'
      @order = SephcoccoLoungeOrder.find(params[:id])
    else
      @order = current_user.sephcocco_lounge_orders.find_by(id: params[:id])
    end
  end

  def set_customer
    @customer = SephcoccoUser.find_by(id: order_params[:sephcocco_user_id])
  end

  def admin_order_params
    params.require(:sephcocco_lounge_order).permit(
      :sephcocco_user_id,
      :quantity,
      :unit_price,
      :total_price,
      :shipping_cost,
      :total_cost,
      :status,
      :order_number,
      :stages => [],
    )
  end

  def user_order_params
    params.require(:sephcocco_lounge_order).permit(
      :quantity,
    )
  end
end
