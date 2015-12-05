class PostsController < ApplicationController
  # TODO: add title to posts
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    @user = User.find(@post.user_id)
  end

  def new
    @post = Post.new(user_id: params[:user_id])
    @user = User.find(@post.user_id)
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(@post.user_id)
    if @post.save
      redirect_to user_path(@post.user_id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
  end

  def update
    @post = Post.find(params[:id])
    @user = User.find(@post.user_id)
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to user_path(@post.user_id)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:entry, :user_id)
  end

end
