class PostsController < ApplicationController
  before_filter :authenticate_admin!, except: [:index, :show]

  def index
    @posts = Post.all
    @post = Post.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create!(post_params)
    respond_to do |format|
      format.html { redirect_to posts_path }
      format.js
    # if @post.save
    #   flash[:notice] = "Post posted."
    #   redirect_to posts_path
    # else
    #   flash[:alert] = "Sorry, try again."
    #   render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated."
      redirect_to user_post_path(@user, @post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Post deleted."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
