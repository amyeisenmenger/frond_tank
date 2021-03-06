class CommentsController < ApplicationController


  def show
    @comment = Comment.find(params[:id])
    @posts = @comment.posts
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
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
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to comments_path
    else
      redirect_to comment_path(@comment)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:entry, :user_id, :post_id)
  end

end