class CommentsController < ApplicationController


  def show
    @comment = Comment.find(params[:id])
    @post = Post.find(@comment.post_id)
    @user = User.find(@post.user_id)
  end

  def new
    @comment = Comment.new(user_id: params[:user_id], post_id: params[:post_id])
    @post = Post.find(@comment.post_id)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_path(@comment.post_id)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post_id)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to post_path(@comment.post_id)
    else
      redirect_to comment_path(@comment)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:entry, :user_id, :post_id)
  end

end