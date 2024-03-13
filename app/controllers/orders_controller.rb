class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :non_purchased_item, only: [:index, :create]
  before_action :set_item, only: [:index]

    def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orderform = OrderForm.new
    if current_user == @item.user
      redirect_to root_path
  end
end
    def create

      @orderform = OrderForm.new(order_params)
      if @orderform.valid?
         pay_item
      @orderform.save(params,current_user.id)
      redirect_to root_path
      else
      @item = Item.find(params[:item_id]) 
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
      end
    end
  
    private
    def order_params
    params.require(:order_form).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def non_purchased_item
      @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
    end

    def set_item
      @item = Item.find(params[:item_id])
     end

  end