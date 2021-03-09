class PostsController < ApplicationController
  before_action :requires_login, only: %i[new create]

  def index
    @posts = Post.all.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.build post_params
    if new_post.save
      redirect_to root_url
    else
      render new_posts_url
    end
  end

  private

  def requires_login
    redirect_to root_url unless user_signed_in?
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
