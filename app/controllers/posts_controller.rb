class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def show
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @categories = Category.all
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
