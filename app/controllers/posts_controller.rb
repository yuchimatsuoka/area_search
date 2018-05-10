class PostsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @posts = Post.all
  end

  def new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    Post.create(small_area_id: post_params[:small_area_id],text: post_params[:text],user_id: current_user.id)
    #binding.pry
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params) if post.user_id == current_user.id
  end

  private
  def post_params
    params.permit(:small_area_id,:text)
  end
end
