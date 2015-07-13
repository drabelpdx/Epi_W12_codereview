class CommentsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params)
    current_user.comments.push(@comment)
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    # if @comment.save
    #   current_user.comments.push(@comment)
    #   flash[:notice] = "Your comment has been posted."
    #   redirect_to post_path(@post)
    # else
    #   render :new
    end
  end

  def destroy
    @task = Task.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
