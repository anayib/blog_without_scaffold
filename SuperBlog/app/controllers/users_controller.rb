class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    @user= User.find(params[:id])  
  end

  def new
    
    @user = User.new

  end

  def edit

    @user= User.find(params[:id]) 

  end

  def create
    
    @user = User.new(params_user)
    
    respond_to do |format|
      if @user.save
        format.html {redirect_to users_path, notice: 'El autor ha sido creado esxitosamente'}
      else
        format.html {render :new, notice: 'el autor no se ha creado exitosamente, vuelva a intentarlo'}
      end
    end
  end

  def update

     @user= User.find(params[:id]) 

     respond_to do |format|

      if @user.update(params_user)
        format.html {redirect_to @user, notice: 'La información ha sido actualizada esxitosamente'}
      else
        format.html {render :edit, notice: 'la información no se ha actualizado exitosamente, vuelva a intentarlo'}
      end
    end

  end

  def destroy
    @user= User.find(params[:id]) 
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Se ha eliminado el autor exitosamente' }
      format.json { head :no_content }
    end
  end

  private

  #params that received from new user form

  def params_user
    params.require(:user).permit(:nombre, :apellido, :email, :empresa)
  end

end
