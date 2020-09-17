class ItemsController < ApplicationController
  def top
  end

  def index
  end
  
  def new
    @item = Item.new
  end

  def create  
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price,:category_id, :size_id, :brand_id,:item_condition_id, :postage_payer_id, :prefecture_code, :preparation_day_id, :status_id)
    # .merge(user: current_user.id)
  end
end
