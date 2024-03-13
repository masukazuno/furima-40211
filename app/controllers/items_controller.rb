class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    end

    def new
      @item = Item.new
    end

    def show
    
    end

    def edit
      if @item.user_id == current_user.id && @item.order.nil?
      else
        redirect_to root_path
      end
    end
  
    def update
      if @item.update(item_params)
        redirect_to item_path(params[:id])
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def destroy
    if current_user.id == item.user.id
    @item.destroy
    redirect_to action: :index
  else
    redirect_to root_path
  end
end
  
    def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :item_condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
end