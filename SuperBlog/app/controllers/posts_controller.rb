class PostsController < ApplicationController
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
    
    @post = Post.new(post_params)

     respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'El post fue creado exitosamente' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new , notiece: 'El post no ha se ha creado, vuelva a intentarlo o comuniquese con el administrador del sitio si el problema persiste'}
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end


  end

  def update

    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'El post se actualizó correctamente' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
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
