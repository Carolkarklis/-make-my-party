class UsersController < ApplicationController

  def show
    @user = User.find(current_user)
  end

  def edit
    @user = User.find(current_user)
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    redirect_to users_show_path, notice: 'Perfil atualizado!'
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to destroy_user_session_path, alert: 'Perfil Apagado!'#mudar para My_itens
  end


  private

  def user_params
     params.require(:user).permit(:firstname, :lastname, :email, :address, :picture)
  end

end
