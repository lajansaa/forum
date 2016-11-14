class PostCommentsController < ApplicationController
  before_action :set_post

  def show
    @comments = @post.comments.page(params[:page]).per(10)

  end

  def new
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      @post.update(:last_commented_at => Time.now)
      flash[:notice] = "You have commented successfully!"
      redirect_to post_comment_path(@post, @comment)
    else
      render :action => "new"
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:name, :comment)
  end

end

