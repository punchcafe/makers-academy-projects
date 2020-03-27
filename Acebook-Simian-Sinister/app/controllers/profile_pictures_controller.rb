class ProfilePicturesController < ApplicationController
  def edit
  end
  def update
    current_user.profile_picture.attach(params[:profile_picture])
    redirect_to posts_path
  end
  def destroy
   current_user.profile_picture.purge
   redirect_to root_path
 end
end
