class PostsController < ApplicationController

  def index
    # @posts = Post.all
    @posts = Post.all.order(params[:sort])
    @search_results = Post.search(params[:search_string])
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post Added"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post Updated"
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:user, :title, :description, :rating)
  end
end
