class SessionsController < ApplicationController
  def new
  end

  def create
    admin = Administrator.find_by(username: params[:username])
    if admin&.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_root_path, notice: 'Başarıyla giriş yaptınız!'
    else
      flash.now[:alert] = 'Geçersiz kullanıcı adı veya şifre!'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: 'Başarıyla çıkış yaptınız!'
  end
end
