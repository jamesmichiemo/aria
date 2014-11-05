class FavoritesController < ApplicationController
  respond_to :html, :js
  def index
    @favorites = current_user.favorites.page(params[:page]).per(10)
  end

  def create
    @favorites = current_user.favorites.build(favorite_params)
    if @favorites.save
      render :layout => false
    end
  end

  def destroy 
    @favorite = current_user.favorites.find_by(id: params[:id])
    @favorite.destroy
    render :layout => false
  end

  private
  def favorite_params
    params.require(:favorite).permit(:image_url,:key,:bpm,:artist,:title,:track_id)
  end
end
