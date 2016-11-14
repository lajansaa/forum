class HomeController < ApplicationController

  def index
    sort_by = (params[:order] == 'title') ? 'title' : 'last_commented_at desc'
    @posts = Post.order('created_at DESC').limit(5)
    @comments = Comment.all
  end  
end
