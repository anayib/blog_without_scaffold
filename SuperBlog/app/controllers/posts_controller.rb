class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def show

  
  end

  def new
    
    @post = Post.new

  end

  def edit
  end

  def create
    
    @post = Post.new(params[:titulo, :fecha, :publicado, :contenido, :user_id])  

  end

  def update

  end

  def destroy
  end
end
