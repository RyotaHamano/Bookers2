class RelationshipsController < ApplicationController
  
  def create
    current_user.followers.create(followed_id: params[:user_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    current_user.followers.find_by(followed_id: params[:user_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  
  
end
