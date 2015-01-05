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

     #al crear el archivo new.js.erb el render que el 
    #controlador hace por defecto lo va a hacer con 
    #formato js porque le puse en el link_to del index.htm
    #el metodo remote: true, es decir hágalo en formato js

  end

  def edit
    @post = Post.find(params[:id])
    #al crear el archivo edit.js.erb el render que el 
    #controlador hace por defecto lo va a hacer con 
    #formato js porque le puse en el link_to del index.htm
    #el metodo remote: true, es decir hágalo en formato js
  end

  def create
    @post = Post.create(post_params)
    #al crear el archivo create.js.erb el render que el 
    #controlador hace por defecto lo va a hacer con 
    #formato js porque le puse en el link_to del index.htm
    #el metodo remote: true, es decir hágalo en formato js
  end

  def update
    @post = Post.update(params[:id], post_params)
    #al crear el archivo update.js.erb el render que el 
    #controlador hace por defecto lo va a hacer con 
    #formato js porque le puse en el link_to del index.htm
    #el metodo remote: true, es decir hágalo en formato js

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
