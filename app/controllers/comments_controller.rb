class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      current_user.comments.push(@comment)
      flash[:notice] = "Your comment has been posted."
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
