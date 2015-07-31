class RegistrationsController < Devise::RegistrationsController
  
  private
  
  def sign_up_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :age, :gender, :ethnicity, :religion)
  end
  
  def account_update_params
    params.require(:user).permit(:firstName, :lastName, :email, :password, :password_confirmation, :current_password, :age, :gender, :ethnicity, :religion)
  end
end