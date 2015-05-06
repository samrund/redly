class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def update
      @post = Post.find params[:id]
      if @post.update params.require(:post).permit(:title, :link, :body, :post_type)
        redirect_to post_path(@post), flash: { notice: 'Thank you for updating your post.' }
      else
        flash.now[:error] = @post.errors.full_messages
        render :edit
      end
  end

  def new
    @post = Post.new
    @post.post_type = params[:post_type] if params[:post_type].present?
  end

  def create
    @post = Post.new post_params
    if @post.save
      redirect_to posts_path, flash: { notice: 'Thank you for submitting your post.' }
    else
      @fields_with_problems = @post.errors.messages.keys
      flash.now[:error] = @post.errors.full_messages
      render :new
    end
  end

  private

  def find_post
    @post = Post.find params[:id]
  end

  def post_params
    @post = Post.new params.require(:post).permit(:title, :link, :body, :post_type)
  end


end
