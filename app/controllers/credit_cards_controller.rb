class CreditCardsController < ApplicationController
  require "payjp"

  def new
    card = CreditCard.where(user_id: 2)
    redirect_to credit_card_path(card) if card.exists?
  end

  def create
    Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
    if params[:token].blank?
      redirect_to new_credit_card_path
    else
      customer = Payjp::Customer.create(
        card: params[:token]
        # metadata: {user_id: current_user.id} ←後日修正
      )
      @card = CreditCard.new(
        card_id: customer.default_card,
        customer_id: customer.id,
        # user_id: current_user.id ←後日修正
        user_id: 2
      )
      if @card.save
        card = CreditCard.where(user_id: 2)
        redirect_to credit_card_path(card)
      else
        redirect_to new_credit_card_path
      end
    end
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    card = CreditCard.where(user_id: 2).first
    if card.blank?
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def destroy #PayjpとCardデータベースを削除します
    card = CreditCard.where(user_id: 2).first
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:secret_key]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
    redirect_to buy_items_path
  end
end