# frozen_string_literal: true

class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    redirect_to posts_url
  end

  def index
    redirect_to new_user_session_path unless current_user
    @user = current_user
    @users = User.all
    @posts = Post.all.reverse
    @time = Time.now.strftime("%Y-%m-%d %H:%M:%S:%6N")
  end

  def destroy
    if Post.find(params[:id]).user_id == current_user.id
      Post.find(params[:id]).destroy
      redirect_to posts_url
    else
      redirect_to posts_url
    end
  end

  def edit 
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_url
    else
      render 'edit'
    end
  end 

  private
  def post_params
    return_hash = params.require(:post).permit(:message)
    return_hash['user_id'] = current_user.id
    return return_hash
  end
end
