class ItemsController < ApplicationController

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
    @item = Item.find(params[:id])
    category = Category.find(@item.category_id)
    # 「もっと見る」表示用のインスタンス
    @more_items = category.items.where(status_id: 1).where.not(id: @item.id).order(created_at: :desc).limit(5)
    # 「前の商品」「後ろの商品」表示用のインスタンス
    @items = category.items.where(status_id: 1)
  end

  def buy
    store_location
    @item = Item.find(params[:id])
    if user_signed_in?
      @user = current_user.destination
      @card = CreditCard.where(user_id: current_user.id).first
      unless @card.blank?
        Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_info = customer.cards.retrieve(@card.card_id)
      end
      @pref = JpPrefecture::Prefecture.find(@user.prefecture_code)
    else
      redirect_to new_user_session_path
    end
  end

  def payment_method
  end

  # 登録したカードで支払い
  def pay
    item = Item.find(params[:id])
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      Payjp::Charge.create(
        amount: item.price,
        customer: card.customer_id, 
        currency: 'jpy'
      )
      item.update(status_id: '2')
      redirect_to thanks_items_path
    end
  end

  def thanks
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :category_id, :size_id, :brand_id,:item_condition_id, :postage_payer_id, :prefecture_code, :preparation_day_id, :status_id, item_images_attributes: [:url, :id]).merge(user_id: current_user.id)
  end

  def order_params
    params.permit(:token)
  end

  # アクセスしようとしたURLを覚えておく
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
