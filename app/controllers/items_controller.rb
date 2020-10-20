class ItemsController < ApplicationController
  before_action :correct_user, only: :destroy
  before_action :set_item, only: [:show, :destroy]

  def top
    @new_items = Item.where(status_id: 1).order(created_at: :desc).limit(5)
  end

  def index
  end
  
  def new
    @item = Item.new
    @item.item_images.new
    @categories = Category.where(ancestry: nil)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @item.item_images.new
      @categories = Category.where(ancestry: nil)
      render :new
    end
  end

  def show
    category = Category.find(@item.category_id)
    # 「もっと見る」表示用のインスタンス
    @more_items = category.items.where(status_id: 1).where.not(id: @item.id).order(created_at: :desc).limit(5)
    # 「前の商品」「後ろの商品」表示用のインスタンス
    @items = category.items.where(status_id: 1)
  end

  def edit
    @item = Item.find(params[:id])
    @category = @item.category
    # 登録カテゴリーが子の場合か孫の場合で分岐
    if @category.ancestors.length == 1 
      @categories_child = @category.siblings
      @categories_parent = @category.parent.siblings
    else 
      @categories_parent = @category.parent.parent.siblings
      @categories_child = @category.parent.siblings
      @categories_grandchild = @category.siblings
    end
  end

  def update
    @item = Item.find(params[:id])
    @category = @item.category
    # 登録カテゴリーが子の場合か孫の場合で分岐
    if @category.ancestors.length == 1 
      @categories_child = @category.siblings
      @categories_parent = @category.parent.siblings
    else 
      @categories_parent = @category.parent.parent.siblings
      @categories_child = @category.parent.siblings
      @categories_grandchild = @category.siblings
    end
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit

  def destroy
    if @item.destroy
      redirect_to root_path, notice: "出品を取り消しました"
    else
      redirect_to root_path, alert: "エラーが発生しました"
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :size_id, :brand_id,:item_condition_id, :postage_payer_id, :prefecture_code, :preparation_day_id, :status_id, item_images_attributes: [:url, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def correct_user
    seler_user = Item.find(params[:id]).user
    redirect_to(root_path) unless seler_user == current_user
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
