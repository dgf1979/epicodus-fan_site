class ReviewsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    # @review = @post.reviews.new
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = @post.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review Added"
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
    @post = Post.find(params[:post_id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review Updated"
      redirect_to post_path(@review.post_id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to post_path(@post)
  end

private
  def review_params
    params.require(:review).permit(:user, :content, :rating)
  end

end
