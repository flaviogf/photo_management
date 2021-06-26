# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe 'GET #index' do
    let(:photo) { create(:photo) }

    before { get :index }

    it { is_expected.to respond_with(:success) }

    it { expect(assigns(:photos)).to eq([photo]) }
  end

  describe 'GET #new' do
    before { get :new }

    it { is_expected.to respond_with(:success) }
  end

  describe 'POST #create' do
    let(:params) do
      {
        photo: {
          name: 'image1.png',
          ext: :png,
          size: 1000
        }
      }
    end

    it { is_expected.to permit(:name).for(:create, params: params).on(:photo) }

    context 'when request params are valid' do
      let(:params) do
        {
          photo: {
            name: 'image1.png',
            ext: :png,
            size: 1000
          }
        }
      end

      before { post :create, params: params }

      it { is_expected.to redirect_to(photos_path) }
    end

    context 'when request params are invalid' do
      let(:params) do
        {
          photo: {
            name: '',
            ext: :png,
            size: 1000
          }
        }
      end

      before { post :create, params: params }

      it { is_expected.to respond_with(:unprocessable_entity) }
    end
  end

  describe 'GET #show' do
    context 'when photo exists' do
      let(:photo) { create(:photo) }

      before { get :show, params: { id: photo.id } }

      it { is_expected.to respond_with(:success) }

      it { expect(assigns(:photo)).to eq(photo) }
    end

    context 'when photo does not exist' do
      before { get :show, params: { id: 1 } }

      it { is_expected.to respond_with(:not_found) }
    end
  end

  describe 'GET #edit' do
    context 'when photo exists' do
      let(:photo) { create(:photo) }

      before { get :edit, params: { id: photo.id } }

      it { is_expected.to respond_with(:success) }
    end

    context 'when photo does not exist' do
      before { get :edit, params: { id: 1 } }

      it { is_expected.to respond_with(:not_found) }
    end
  end

  describe 'PUT #update' do
    let(:photo) { create(:photo) }

    let(:params) do
      {
        id: photo.id,
        photo: {
          name: 'image1.png',
          ext: :png,
          size: 1000
        }
      }
    end

    it { is_expected.to permit(:name, :ext, :size).for(:update, params: params).on(:photo) }

    context 'when request params are valid' do
      let(:params) do
        {
          id: photo.id,
          photo: {
            name: 'image1.png',
            ext: :png,
            size: 1000
          }
        }
      end

      before { put :update, params: params }

      it { is_expected.to redirect_to(photos_path) }
    end

    context 'when request params are not valid' do
      let(:params) do
        {
          id: photo.id,
          photo: {
            name: '',
            ext: :png,
            size: 1000
          }
        }
      end

      before { put :update, params: params }

      it { is_expected.to respond_with(:unprocessable_entity) }
    end
  end

  describe 'DELETE #destroy' do
    context 'when photo exists' do
      let(:photo) { create(:photo) }

      before { delete :destroy, params: { id: photo.id } }

      it { is_expected.to redirect_to(photos_path) }
    end

    context 'when photo does not exist' do
      before { delete :destroy, params: { id: 1 } }

      it { is_expected.to respond_with(:not_found) }
    end
  end
end
