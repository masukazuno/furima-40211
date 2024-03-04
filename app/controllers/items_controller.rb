class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]

  def index
    @items = Item.all.order(created_at: :desc)
    end

    def new
      @item = Item.new
    end

    def show
    
    end

    def create
      @item = Item.new(item_params)
    if @item.save
      redirect_to root_path 
    
    else
      render :new, status: :unprocessable_entity
    end
  end
    end


  private
  def item_params
    params.require(:item).permit(:name, :introduction, :image, :price, :item_condition_id, :postage_payer_id, :prefecture_code_id, :preparation_day_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end