class PostsController < ApplicationController
  load_and_authorize_resource
  # before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @posts = Post.all
  end
  
  def show
  end
  
  def new
  end
  
  def create
    if @post.save
      flash[:notice] = "Successfully created post."
      redirect_to @post
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated post."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Successfully destroyed post."
    redirect_to posts_url
  end
end
