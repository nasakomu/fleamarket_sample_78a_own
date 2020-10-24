class CreditCardsController < ApplicationController

  def new
    card = CreditCard.where(user_id: current_user.id)
    redirect_to credit_card_path(card) if card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params[:token].blank?
      flash.now[:alert] = "保存できませんでした。カード情報を確認の上、再度入力してください。".html_safe
      render :new
    else
      customer = Payjp::Customer.create(
        card: params[:token]
      )
      @card = CreditCard.new(
        card_id: customer.default_card,
        customer_id: customer.id,
        user_id: current_user.id
      )
      if @card.save
        card = CreditCard.where(user_id: current_user.id)
        redirect_to credit_card_path(card)
      else
        flash.now[:alert] = "保存できませんでした。カード情報を確認の上、再度入力してください。".html_safe
        render :new
      end
    end
  end

  # Cardのデータをpayjpに送り情報を取り出して表示
  def show
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_info = customer.cards.retrieve(card.card_id)
    end
  end

  # PayjpとCardデータベースを削除
  def destroy
    card = CreditCard.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_back
  end

  # 記憶したURLにリダイレクト
  def redirect_back
    redirect_to(session[:forwarding_url])
    session.delete(:forwarding_url)
  end

end