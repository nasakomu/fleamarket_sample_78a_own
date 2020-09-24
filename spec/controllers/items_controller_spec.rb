require 'rails_helper'

describe ItemsController, type: :controller do
  let(:category) { create(:category) }
  let(:brand) { create(:brand) }

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
    it "assigns @item" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'POST #create' do
    let(:params) { {item: attributes_for(:item)} }

    # 保存できる場合
    context 'can save' do
      subject {
        post :create,
        params: params
      }
      it 'count up message' do
        expect{ subject }.to change(Item, :count).by(1)
      end

      it 'redirects to root_path' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end

    # 保存できない場合
    context 'can not save' do
      let(:invalid_params) { {item: attributes_for(:item, name: nil) }}

      subject {
        post :create,
        params: invalid_params
      }
      it 'does not count up' do
        expect{ subject }.not_to change(Item, :count)
      end

      it 'redirects to items_new_path' do
        subject
        expect(response).to render_template :new
      end
    end
  end
end

