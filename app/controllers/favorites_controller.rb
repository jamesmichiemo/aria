class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.page(params[:page]).per(10)
  end

  def create
    @favorites = current_user.favorites.build(favorite_params)
    if @favorites.save
      flash[:success] = "Added to your favorites list!"
      redirect_to user_url(current_user)
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id])
    @favorite.destroy
    flash[:success] = "Removed from your favorites list."
    redirect_to :back
  end

  private
  def favorite_params
    params.require(:favorite).permit(:image_url,:key,:bpm,:artist,:title,:track_id)
  end
end
