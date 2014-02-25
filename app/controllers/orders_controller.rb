class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  # GET /checkout
  def new
    @order = Order.new
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        # Removing orders email from EmailScapper table
        Email.destroy_all(:email => order_params[:email])
        format.html { redirect_to :controller => "orders", :action => "complete" }
      else
        format.html { render action: 'new' }
      end
    end
  end
  def complete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:email, :name, :address)
    end
end
