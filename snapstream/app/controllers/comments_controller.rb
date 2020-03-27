class CommentsController < ApplicationController
  def create
    puts "we get here"
    puts params
    puts params["user_id"]
    @comment = Comment.create(user_id: params["user_id"], post_id: params["post_id"], message: params["message"]["contents"])
    redirect_to posts_url
  end
end
