class PostsController < ApplicationController

  respond_to :html ,  :js 


  def index
    @posts=Post.all
  end

  def show

    @post = Post.find(params[:id])

  end

  def new
    
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
  end

  def update
    @post = Post.update(params[:id], post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'El post fue destruido exitosamente' }
      format.json { head :no_content }
      
    end
  end

  private

  def post_params
    params.require(:post).permit(:titulo, :fecha, :publicado, :contenido, :user_id)
  end
end
