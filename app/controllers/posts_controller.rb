class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, :except => [:index, :new, :create, :latest]

  def index 
    sort_by = (params[:order] == 'title') ? 'title' : 'last_commented_at desc'
    @posts = Post.order(sort_by).page(params[:page]).per(10)
  end

  def show
    @count_comments = Comment.where(:post_id => @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = "Post was successfully created!"
      redirect_to posts_path
    else
      render :action => :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post was successfully updated!"
      redirect_to post_path(@post)
    else
      render :action => :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = "Post was successfuly deleted!"
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :tag_ids => [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
