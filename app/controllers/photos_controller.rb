# frozen_string_literal: true

class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @photos = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new photo_params

    if @photo.save
      redirect_to photos_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @photo.update(photo_params)
      redirect_to photos_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @photo.destroy!

    redirect_to photos_path
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image).merge(opened_at: Time.now.utc)
  end

  def set_photo
    @photo = Photo.find params[:id]
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end
end
