class Users::SessionsController < Devise::SessionsController
  def new
    run User::Operation::Login::Present
  end

  def create
    run User::Operation::Login do |result|
      sign_in(result[:user])
          if ActiveModel::Type::Boolean.new.cast(result[:remember_me]) 
            current_user.remember_me!
          end
      return redirect_to posts_path, :flash => { :success => "Login Successful!" }
    end
    return redirect_to root_path, :flash => { :danger => "Email or Password Invalid" }
  end

  def destroy
    sign_out(current_user)
    return redirect_to root_path, :flash => { :success => "Logout Successful!" }
  end
end
